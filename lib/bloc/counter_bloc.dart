import 'dart:async';
import 'package:comfort_sleep/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<Events, CounterInitial> {
  @override
  CounterInitial get initialState => CounterInitial(
  );

  @override
  Stream<CounterInitial> mapEventToState(
    Events event,
  ) async* {
    if (event == Events.Playing) {
      yield* mapPlayingState();
    }
  }

  Stream<CounterInitial> mapPlayingState() async* {
    var list = [];
    if (list == null) {
      yield CounterInitial.error('sxsxsx');
    } else {
      yield CounterInitial.success(soundList);
    }
  }
}
