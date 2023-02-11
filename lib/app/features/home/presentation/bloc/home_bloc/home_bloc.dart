import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_forecast/app/core/errors/errors.dart';
import 'package:weather_forecast/app/core/utils/utils.dart';
import 'package:weather_forecast/app/features/home/domain/entities/entities.dart';
import 'package:weather_forecast/app/features/home/domain/usecases/use_cases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required SearchPlaces searchPlaces,
    required GetWeather getWeather,
  })  : _searchPlaces = searchPlaces,
        _getWeather = getWeather,
        super(HomeInitial()) {
    on<SearchLocation>(_onSearchingLocation);
    on<AddError>((event, emit) => emit(ErrorState(event.failure)));
    on<SearchResult>(
      (event, emit) {
        emit(SearchingState(places: event.places));
      },
    );
    on<SelectPlace>(_onSelectPlace);
  }

  final SearchPlaces _searchPlaces;
  final GetWeather _getWeather;

  final debouncer = Debouncer(milliseconds: 500);

  void _onSearchingLocation(SearchLocation event, Emitter<HomeState> emit) {
    emit(
      SearchingState(
        isBusy: true,
        places: List.empty(),
      ),
    );
    debouncer.run(() async {
      final either = await _searchPlaces(placeName: event.locationName);
      either.fold(
        (failure) {
          add(AddError(failure));
        },
        (places) {
          add(SearchResult(places));
        },
      );
    });
  }

  Future<void> _onSelectPlace(
    SelectPlace event,
    Emitter<HomeState> emit,
  ) async {
    final place = event.place;
    emit(
      PlaceWeather(
        isBusy: true,
        place: place,
        weather: Weather.empty(),
      ),
    );
    final either = await _getWeather(lat: place.lat, lon: place.lon);
    either.fold(
      (failure) {
        emit(ErrorState(failure));
      },
      (weather) {
        emit(
          PlaceWeather(place: place, weather: weather),
        );
      },
    );
  }
}
