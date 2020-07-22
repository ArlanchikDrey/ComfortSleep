import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:comfort_sleep/utils/utils.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<Events, CounterState> {
  @override
  CounterState get initialState => CounterState.EMPTY();

  @override
  Stream<CounterState> mapEventToState(
      Events event,
      ) async* {
    if(event == Events.PLAY){
      yield* mapToPlayState();
    }
  }

  Stream<CounterState> mapToPlayState() async* {
    yield CounterState.INIT(soundList);
  }

  Stream<CounterState> mapToStoptate() async* {
    yield CounterState.DISPOSE('stop');
  }
}

