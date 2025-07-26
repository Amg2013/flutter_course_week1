import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_states.dart';

class CounterBloc extends Bloc<CounterEvent, CounterStates> {
  CounterBloc() : super(InitialCounterStates(50)) {
    //
    on<IncermenButtonPressdEvent>(_onIncremnet);
    //
    on<DecermenButtonPressdEvent>(_onDecremnet);
  }

  //

  void _onIncremnet(
    IncermenButtonPressdEvent event,
    Emitter<CounterStates> emit,
  ) {
    final newCount = state.count + event.amount;

    emit(CounterStateInc(newCount, 'msg'));
  }

  ////////////////////////////////////////////////
  void _onDecremnet(
    DecermenButtonPressdEvent event,
    Emitter<CounterStates> emit,
  ) {
    final newCount = state.count - event.amount;
    emit(CounterStatesDec(newCount, 'msg'));
  }
}
