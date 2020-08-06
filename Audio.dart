import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

final player = AudioCache();
bool isPlaying = false;
bool isStarted = false;
AudioPlayer audioPlayer = AudioPlayer();
startPlaying() async {
  if (!isStarted) {
    await audioPlayer.play(
      "https://luan.xyz/files/audio/ambient_c_motion.mp3",
    );
    isStarted = true;
    isPlaying = true;
  } else
    await audioPlayer.resume();
}

task1app() {
  return MaterialApp(
    home: Scaffold(
      drawer: new Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Basic Audio App "),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.maxFinite,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/download.jpg',
                  alignment: Alignment.center,
                  width: 600,
                  height: 100,
                ),
                Card(
                  color: Colors.greenAccent,
                  child: Text(
                    "Play and pause the Internet audio",
                  ),
                  elevation: double.maxFinite,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      color: Colors.blueAccent,
                      child: IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                          ),
                          onPressed: () {
                            startPlaying();
                          }),
                      elevation: 10,
                    ),
                    Card(
                      color: Colors.amberAccent,
                      child: IconButton(
                          icon: Icon(
                            Icons.pause,
                          ),
                          onPressed: () {
                            audioPlayer.pause();
                          }),
                      elevation: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images.jpg',
                  alignment: Alignment.center,
                  width: 200,
                  height: 100,
                ),
                Card(
                  color: Colors.greenAccent,
                  child: Text(
                    "Play and pause the local audio",
                  ),
                  elevation: double.maxFinite,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      color: Colors.blueAccent,
                      child: IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                          ),
                          onPressed: () {
                            player.play('Audio.wav');
                          }),
                      elevation: 10,
                    ),
                    Card(
                      color: Colors.amberAccent,
                      child: IconButton(
                          icon: Icon(
                            Icons.pause,
                          ),
                          onPressed: () {
                            player.clear('Audio.wav');
                          }),
                      elevation: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
