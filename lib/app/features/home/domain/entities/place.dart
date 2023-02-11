part of 'entities.dart';

class Place {
  Place({
    required this.id,
    required this.slug,
    required this.placeName,
    required this.cityName,
    required this.state,
    required this.country,
    required this.lat,
    required this.lon,
    required this.placeType,
  });

  factory Place.empty() {
    return Place(
      id: 0,
      slug: '',
      placeName: '',
      cityName: '',
      state: '',
      country: '',
      lat: '',
      lon: '',
      placeType: PlaceType.none,
    );
  }

  final int id;
  final String slug;
  final String placeName;
  final String cityName;
  final String state;
  final String country;
  final String lat;
  final String lon;
  final PlaceType placeType;
}
