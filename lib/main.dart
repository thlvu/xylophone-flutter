import 'dart:io';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(XylophoneApp());


void audioPlayHandler(AudioPlayerState value) {}

Expanded buildNote({Color color, int noteNumber}) {
  return Expanded(
    child: FlatButton(
      color: color,
      onPressed: () {
        final AudioPlayer audioPlayer = new AudioPlayer();
        if (Platform.isIOS) {
          audioPlayer.monitorNotificationStateChanges(audioPlayHandler);
        }
        final AudioCache audioCache = new AudioCache(fixedPlayer: audioPlayer);
        audioCache.play('note$noteNumber.wav');
      },
      child: Container(),
    ),
  );
}


class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildNote(color: Color(0xFF277DA1), noteNumber: 1),
              buildNote(color: Color(0xFF4D908E), noteNumber: 2),
              buildNote(color: Color(0xFF90BE6D), noteNumber: 3),
              buildNote(color: Color(0xFFF9C74F), noteNumber: 4),
              buildNote(color: Color(0xFFF9844A), noteNumber: 5),
              buildNote(color: Color(0xFFF8961E), noteNumber: 6),
              buildNote(color: Color(0xFFF94144), noteNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
