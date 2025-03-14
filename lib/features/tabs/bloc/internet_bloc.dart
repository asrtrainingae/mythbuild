import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription<InternetConnectionStatus>? _subscription;
  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {
      if(event is ConnectedEvent){
        print("Connected to the internet");
        emit(InternetConnectedState());
      }
      else if(event is NotConnectedEvent){
        print("Not Connected to the internet");
        emit(InternetNotConnectedState());
      }
    });


    _subscription = InternetConnectionChecker().onStatusChange.listen(
    (InternetConnectionStatus status) {
      if (status == InternetConnectionStatus.connected) {
        add(ConnectedEvent());
      } else {
        add(NotConnectedEvent());
      }
    }
  );
  }
  @override
  Future<void> close(){
    _subscription?.cancel();
    return super.close();
  }

  
}
