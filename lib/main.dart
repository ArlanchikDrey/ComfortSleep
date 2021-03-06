import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:comfort_sleep/bloc/counter_bloc.dart';
import 'package:comfort_sleep/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AudioCache audio = new AudioCache(prefix: "sounds/");
AudioPlayer player;
int currentlyPlaying;
bool playing = false;

void main() => runApp(ComfortSleep()); // Main

class ComfortSleep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: MainScreen(title: 'Comfort Sleep Application'),
      ),
    );
  }
}
