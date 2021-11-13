part of 'counter_cubit.dart';

abstract class CounterState {}

class InitialCounterState extends CounterState {}

class CounterNumChangedState extends CounterState {
  final int counter;
  CounterNumChangedState(this.counter);
}
