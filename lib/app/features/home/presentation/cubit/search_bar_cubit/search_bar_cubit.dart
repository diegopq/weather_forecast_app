import 'package:bloc/bloc.dart';

class SearchBarCubit extends Cubit<bool> {
  SearchBarCubit() : super(false);

  void focus() {
    emit(true);
  }

  void unFocus() {
    emit(false);
  }
}
