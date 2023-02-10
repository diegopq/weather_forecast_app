part of 'repositories.dart';

// ignore: one_member_abstracts
abstract class IPlacesRepo {
  Future<Either<Failure, List<Place>>> getSearchResults({
    required String placeName,
  });
}
