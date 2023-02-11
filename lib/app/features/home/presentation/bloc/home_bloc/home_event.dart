part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SearchLocation extends HomeEvent {
  const SearchLocation(this.locationName);

  final String locationName;

  @override
  List<Object> get props => [locationName];
}

class AddError extends HomeEvent {
  const AddError(this.failure);

  final Failure failure;

  @override
  List<Object> get props => [failure];
}

class SearchResult extends HomeEvent {
  const SearchResult(this.places);

  final List<Place> places;

  @override
  List<Object> get props => [places];
}

class SelectPlace extends HomeEvent {
  const SelectPlace(this.place);

  final Place place;

  @override
  List<Object> get props => [place];
}
