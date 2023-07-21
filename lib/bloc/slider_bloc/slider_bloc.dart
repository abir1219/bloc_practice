import 'package:bloc_01/bloc/slider_bloc/slider_event.dart';
import 'package:bloc_01/bloc/slider_bloc/slider_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderState()) {
    on<SlideEvent>(_homePageSlide);
  }

  void _homePageSlide(SlideEvent event,Emitter<SliderState> emit){
    emit(state.copyWith(index: event.index));
  }
}
