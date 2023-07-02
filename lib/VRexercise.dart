import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:octatech/environmentSelector.dart';
import 'package:octatech/main.dart';
import 'package:video_360/video_360.dart';
import 'package:flutter/services.dart';

class VRExercise extends StatefulWidget {
  VRExercise({Key? key, required this.sport, required this.map})
      : super(key: key);
  final String map;
  final String sport;

  @override
  State<VRExercise> createState() => _VRExerciseState();
}

class _VRExerciseState extends State<VRExercise> {
  Video360Controller? controller;
  String durationText = '';
  String totalText = '';

  Map<String, Map<String, String>> sportToIntro = {
    'FOOTBALL': {
      'SCI FI':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Ffootball%20sci%20fi.mp4?alt=media',
      'MOON':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Ffootball%20moon.mp4?alt=media',
      'RETRO':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Ffootball%20retro.mp4?alt=media'
     
    },
    'CRICKET': {
      'SCI FI':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Fcricket%20sci%20fi.mp4?alt=media',
      'MOON':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Fcricket%20moon.mp4?alt=media',
      'RETRO':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Fcricket%20retro.mp4?alt=media'
     
    },
    'BASKET BALL': {
      'SCI FI':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Fbasketball%20sci%20fi.mp4?alt=media',
      'MOON':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Fbasketball%20moon.mp4?alt=media',
      'RETRO':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Fbasketball%20retro.mp4?alt=media'
    
    },
    'VOLLEYBALL': {
      'SCI FI':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Fvolleyball%20sci%20fi.mp4?alt=media',
      'MOON':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Fvolleyball%20moon.mp4?alt=media',
      'RETRO':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Fvolleyball%20retro.mp4?alt=media'
      
    },
    'ATHLETICS': {
      'SCI FI':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Fathletics%20sci%20fi.mp4?alt=media',
      'MOON':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Fathletics%20moon.mp4?alt=media',
      'RETRO':
          'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/environment%2Fathletics%20retro.mp4?alt=media'
     
    }
  };

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text(widget.sport),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Stack(children: [
        Center(
          child: Container(
              child: Video360View(
            onVideo360ViewCreated: (Video360Controller? controller) {
              this.controller = controller;
            },
            url: sportToIntro[widget.sport]![widget.map]!,
            isAutoPlay: true,
            isRepeat: false,
            onPlayInfo: (Video360PlayInfo info) {
              setState(() {
                durationText = info.duration.toString();
                totalText = info.total.toString();
              });
              if (info.duration >= info.total && info.total > 0) {
                controller?.stop();
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              }
            },
          )),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    controller?.play();
                  },
                  color: Colors.grey[100],
                  child: Text('Play'),
                ),
                MaterialButton(
                  onPressed: () {
                    controller?.stop();
                  },
                  color: Colors.grey[100],
                  child: Text('Stop'),
                ),
                MaterialButton(
                  onPressed: () {
                    controller?.reset();
                  },
                  color: Colors.grey[100],
                  child: Text('Reset'),
                ),
                MaterialButton(
                  onPressed: () {
                    controller?.jumpTo(810000);
                  },
                  color: Colors.grey[100],
                  child: Text('End'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    controller?.seekTo(-2000);
                  },
                  color: Colors.grey[100],
                  child: Text('<<'),
                ),
                MaterialButton(
                  onPressed: () {
                    controller?.seekTo(2000);
                  },
                  color: Colors.grey[100],
                  child: Text('>>'),
                ),
                Flexible(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.grey[100],
                    child: durationText != "0"
                        ? Text(durationText + ' / ' + totalText)
                        : Text("Loading..."),
                  ),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}
