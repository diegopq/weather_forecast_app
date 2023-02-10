part of 'services.dart';

// ignore: one_member_abstracts
abstract class IBaseRestClient {
  Future<T> requestHttp<T>({
    required RequestType httpMethod,
    required String endpointUrl,
    required Map<String, dynamic> requestData,
  });
}

class RestDioClient implements IBaseRestClient {
  ///Dio client implementation
  RestDioClient(
    this.baseUrl, {
    this.withLogger = kDebugMode,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {'Accept': 'application/json'},
        contentType: 'application/json',
        connectTimeout: 2500,
      ),
    );

    if (withLogger) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (obj) {
            log(obj.toString());
          },
        ),
      );
    }
  }

  final bool withLogger;
  final String baseUrl;
  late final Dio dio;

  Map<String, String> headers = {};

  final _successStatus = [200, 201];

  @override
  Future<T> requestHttp<T>({
    required RequestType httpMethod,
    required String endpointUrl,
    required Map<String, dynamic> requestData,
  }) async {
    var attemp = 0;
    // ignore: literal_only_boolean_expressions
    do {
      attemp++;
      log('Intento $attemp', name: 'REST Base Client');
      try {
        final response = await dio.request<String>(
          endpointUrl,
          data: (httpMethod == RequestType.post)
              ? requestData
              : <dynamic, dynamic>{},
          options: Options(
            method: httpMethod.name.toUpperCase(),
            headers: headers,
            responseType: ResponseType.json,
            receiveTimeout: 5000,
            sendTimeout: 10000,
            validateStatus: _successStatus.contains,
          ),
          queryParameters: (httpMethod == RequestType.get) ? requestData : {},
        );
        return jsonDecode(response.data!) as T;
      } on DioError catch (e) {
        switch (e.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
          case DioErrorType.cancel:
            if (attemp > 3) {
              throw BaseClientException(BaseClientExceptionType.network);
            }
            // BACKOFF
            log('Reintentar request network', name: 'REST Base Client');
            await Future<void>.delayed(Duration(seconds: attemp));
            break;
          case DioErrorType.response:
            switch (e.response?.statusCode) {
              case 400:
                final serviceException =
                    jsonDecode(e.response?.data as String)['message'] as String;
                log(
                  serviceException,
                  name: 'REST Base Client',
                );
                throw BaseClientBadRequestException(serviceException);
              case 403:
                if (attemp > 2) {
                  throw BaseClientException(BaseClientExceptionType.auth);
                }
                log('Reintentar request auth', name: 'BC REST Client');
                break;
              case 500:
              default:
                throw BaseClientException(BaseClientExceptionType.server);
            }
            break;
          case DioErrorType.other:
          // ignore: no_default_cases
          default:
            throw BaseClientException(BaseClientExceptionType.unknown);
        }
      } catch (e) {
        log('Error desconocido !! $e', name: 'BC REST Client');
        throw BaseClientException(BaseClientExceptionType.client);
      }
    } while (true);
  }
}
