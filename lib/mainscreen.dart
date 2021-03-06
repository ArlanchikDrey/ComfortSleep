import 'dart:developer';

import 'package:comfort_sleep/bloc/counter_bloc.dart';
import 'package:comfort_sleep/main.dart';
import 'package:comfort_sleep/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var time; // Check time
  CounterBloc counterBloc; // on screen

  @override
  void initState() {
    counterBloc = BlocProvider.of<CounterBloc>(context);
    counterBloc.add(Events.Playing);
    super.initState();
  }

  @override
  void dispose() {
    audio.clearCache();
    super.dispose();
  }

  // Check time in debug console
  _positionHandler(Duration p) {
    print('Время: $p');
    time = p;
    if (p.inSeconds == 8) {
      setState(() {
        player.seek(Duration(seconds: 1));
        print("рестарт......");
      });
    }
  }

  playPlayer(int index) async {
    player = await audio.play(soundList[index]);
    // ignore: deprecated_member_use
    player.positionHandler = _positionHandler;
    setState(() {
      currentlyPlaying = index;
      playing = true;
    });
  }

  stopPlayer() async {
    await player.stop();
    setState(() {
      currentlyPlaying = null;
      playing = false;
    });
  }

  initLoadAll(CounterInitial state){
    print(state.soundList);
    //audio.loadAll(state.soundList);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterInitial>(
      builder: (context,state){
        initLoadAll(state);
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                        itemCount: soundList.length,
                        itemBuilder: (context, index) => Wrap(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                child: Icon(currentlyPlaying == index
                                    ? Icons.stop
                                    : Icons.play_arrow),
                              ),
                              title: Text(
                                soundList[index]
                                    .toString()
                                    .toUpperCase()
                                    .replaceAll("_", " ")
                                    .replaceAll(".MP3", ""),
                                style: TextStyle(fontSize: 15.0),
                              ),
                              onTap: () => playing == false
                                  ? playPlayer(index)
                                  : stopPlayer(),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    child: Center(
                      child: time == null ? null : Text(time.toString()),
                    ),
                  ),
                ],
              )),
        );
  });
  }
}
