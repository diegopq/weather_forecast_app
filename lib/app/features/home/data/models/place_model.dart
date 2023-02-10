part of 'models.dart';

class PlaceModel extends Place {
  PlaceModel({
    required super.id,
    required super.slug,
    required super.placeName,
    required super.cityName,
    required super.state,
    required super.country,
    required super.lat,
    required super.lon,
    required super.placeType,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json['id'] as int,
      slug: json['slug'] as String,
      placeName: json['display'] as String,
      cityName: json['city_name'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      lat: json['lat'] as String? ?? '',
      lon: json['long'] as String? ?? '',
      placeType: PlaceType.values.firstWhere(
        (element) => element.name == (json['result_type'] as String),
      ),
    );
  }
}

extension PlaceMapper on PlaceModel {
  Place toEntitie() {
    return Place(
      id: id,
      slug: slug,
      placeName: placeName,
      cityName: cityName,
      state: state,
      country: country,
      lat: lat,
      lon: lon,
      placeType: placeType,
    );
  }
}
