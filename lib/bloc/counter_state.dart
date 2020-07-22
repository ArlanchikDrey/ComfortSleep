part of 'counter_bloc.dart';

@immutable
class CounterState {
  final List<String> soundList;
  final String message;
  final Events event;

  const CounterState({@required this.soundList, @required this.message, this.event});

  factory CounterState.EMPTY(){
    return CounterState(
        soundList: List<String>(),
        message: ''
    );
  }

  factory CounterState.INIT(List<String> soundList){
    return CounterState(
        soundList: soundList,
        message: '200',
        event: Events.PLAY
    );
  }

  factory CounterState.DISPOSE(String message){
    return CounterState(
        soundList: List<String>(),
        message: message,
        event: Events.STOP
    );
  }

}

