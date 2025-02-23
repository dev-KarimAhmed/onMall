import 'package:flutter_bloc/flutter_bloc.dart';

part 'store_details_states.dart';
class StoreDetailsCubit extends Cubit<StoreDetailsStates> {
  StoreDetailsCubit() : super(StoreDetailsInitial());

  int currentValue = 0;

  void changeValue(int value) {
    currentValue = value;
    emit(ValueChanged());
  }
}