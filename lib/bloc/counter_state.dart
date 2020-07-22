part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  const CounterState();
}

class CounterInitial extends CounterState {
final List<String> soundList;
final String message;

const CounterInitial({ this.soundList, this.message});

factory CounterInitial.success(List<String> soundList){
  return CounterInitial(
    soundList: soundList,
    message: '200'
  );
}

factory CounterInitial.error(String message){
  return CounterInitial(
      soundList: List<String>(),
      message: message
  );
}
}
