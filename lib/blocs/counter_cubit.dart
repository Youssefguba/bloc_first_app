import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(InitialCounterState());

  int counter = 0;

  void incrementCounter(){
    counter++; // counter = 1
    emit(CounterNumChangedState(counter));
  }

  void decrementCounter() {
    counter--;
    emit(CounterNumChangedState(counter));
  }

}