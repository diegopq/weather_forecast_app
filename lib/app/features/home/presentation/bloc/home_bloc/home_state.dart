part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class SearchingState extends HomeState {
  const SearchingState({
    required this.places,
    this.isBusy = false,
  });

  final bool isBusy;
  final List<Place> places;

  @override
  List<Object> get props => [isBusy, places];
}

class PlaceWeather extends HomeState {
  const PlaceWeather({
    required this.place,
    required this.weather,
    this.isBusy = false,
  });

  final bool isBusy;
  final Place place;
  final Weather weather;

  @override
  List<Object> get props => [
        isBusy,
        place,
        weather,
      ];
}

class ErrorState extends HomeState {
  const ErrorState(this.failure);

  final Failure failure;
}
