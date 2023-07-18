import 'package:bloc_01/bloc/application_bloc/application_event.dart';
import 'package:bloc_01/bloc/application_bloc/application_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent,ApplicationState>{
  ApplicationBloc():super(const ApplicationState()){
    on<TriggerAppEvent>((event, emit) => emit(ApplicationState(index: event.index)));
  }
}