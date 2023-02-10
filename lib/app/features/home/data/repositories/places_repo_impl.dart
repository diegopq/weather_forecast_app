part of 'repositories_impl.dart';

class PlacesRepoImpl implements IPlacesRepo {
  PlacesRepoImpl(this._placesDatasource);

  final IPlacesDatasource _placesDatasource;

  @override
  Future<Either<Failure, List<Place>>> getSearchResults({
    required String placeName,
  }) async {
    try {
      final result =
          await _placesDatasource.getSearchResults(placeName: placeName);
      final places = result
          .map(
            (e) => e.toEntitie(),
          )
          .toList();
      return Right(places);
    } on BaseClientException catch (e, stack) {
      log(e.toString(), stackTrace: stack, name: 'Places Repo');
      if (e.type == BaseClientExceptionType.network) {
        return const Left(NetworkFailure());
      }
      if (e.type == BaseClientExceptionType.auth) {
        return const Left(AuthFailure());
      }
      if (e.type == BaseClientExceptionType.server) {
        return const Left(
          ServerFailure(),
        );
      }
      if (e.type == BaseClientExceptionType.unknown) {
        return const Left(AnotherFailure());
      }
      return const Left(AnotherFailure());
    } on BaseClientBadRequestException catch (e, stack) {
      log(e.toString(), stackTrace: stack, name: 'Places Repo');
      return Left(
        ServiceFailure(e.code),
      );
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack, name: 'Places Repo');
      return const Left(AnotherFailure());
    }
  }
}
