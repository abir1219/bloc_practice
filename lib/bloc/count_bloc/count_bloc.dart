import 'package:bloc/bloc.dart';
import 'package:bloc_01/bloc/count_bloc/count_event.dart';

import 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(Initializer()) {
    on<Increment>((event, emit) {
      emit(CountState(count: state.count+1));
    });

    on<Decrement>((event, emit) {
      emit(CountState(count: state.count > 0 ? state.count-1 : state.count));
    });
  }
}
