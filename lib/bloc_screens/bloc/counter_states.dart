part of 'counter_bloc.dart';

abstract class CounterStates {
  final int count;
  CounterStates(this.count);
}

class InitialCounterStates extends CounterStates {
  InitialCounterStates(super.count);
}

class CounterStatesDec extends CounterStates {
  final String msg;

  CounterStatesDec(int count, this.msg) : super(count);
}

class CounterStateInc extends CounterStates {
  final String msg;
  CounterStateInc(int count, this.msg) : super(count);
}
