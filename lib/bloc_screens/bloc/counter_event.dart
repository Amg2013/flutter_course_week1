part of 'counter_bloc.dart';

abstract class CounterEvent {}

class IncermenButtonPressdEvent extends CounterEvent {
  final int amount;
  IncermenButtonPressdEvent({this.amount = 1});
}

class DecermenButtonPressdEvent extends CounterEvent {
  final int amount;
  DecermenButtonPressdEvent({this.amount = 1});
}

class ResetCounterEvent extends CounterEvent {}
