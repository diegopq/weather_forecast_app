part of 'use_cases.dart';

class SearchPlaces {
  SearchPlaces(this._placesRepo);

  final IPlacesRepo _placesRepo;

  Future<Either<Failure, List<Place>>> call({required String placeName}) async {
    final either = await _placesRepo.getSearchResults(placeName: placeName);
    final result = either.fold(
      (l) {
        return l;
      },
      (r) {
        return r
            .where(
              (element) => element.lat.isNotEmpty && element.lon.isNotEmpty,
            )
            .toList();
      },
    );

    if (result is Failure) return Left(result);
    return Right(result as List<Place>);
  }
}
