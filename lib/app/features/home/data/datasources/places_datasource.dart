part of 'datasources.dart';

// ignore: one_member_abstracts
abstract class IPlacesDatasource {
  Future<List<PlaceModel>> getSearchResults({required String placeName});
}

class PlacesDatasource extends IPlacesDatasource {
  PlacesDatasource() {
    _client = RestDioClient(EnvConfig.kReservamosApiUrl);
  }

  late final IBaseRestClient _client;

  @override
  Future<List<PlaceModel>> getSearchResults({required String placeName}) async {
    final res = await _client.requestHttp<List<dynamic>>(
      httpMethod: RequestType.get,
      endpointUrl: '/places',
      requestData: {'q': placeName},
    );

    return res
        .map(
          (e) => PlaceModel.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
