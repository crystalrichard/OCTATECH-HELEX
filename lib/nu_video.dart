import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:octatech/main.dart';
import 'package:video_360/video_360.dart';
//import 'package:video_player/video_player.dart';

class NuVideo extends StatefulWidget {
  NuVideo({Key? key, required this.sport}) : super(key: key);
  final String sport;

  @override
  State<NuVideo> createState() => _NuVideoState();
}

class _NuVideoState extends State<NuVideo> {
  String durationText = '';
  String totalText = '';
  Video360Controller? controller;

  Map<String, String> sportToNutrition = {
    'FOOTBALL':
        'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/nutrition%2Fnu_football.mp4?alt=media',
    'CRICKET':
        'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/nutrition%2Fnu_cricket.mp4?alt=media',
    'ATHLETICS':
        'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/nutrition%2Fnu_athletics.mp4?alt=media',
    'BASKET BALL':
        'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/nutrition%2Fnu_basketball.mp4?alt=media',
    'VOLLEYBALL':
        'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/nutrition%2Fnu_volleyball.mp4?alt=media',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text(widget.sport),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Stack(children: [
        Center(
          child: Container(
              child: Video360View(
            onVideo360ViewCreated: (Video360Controller? controller) {
              this.controller = controller;
            },
            url: sportToNutrition[widget.sport],
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
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
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
                    controller?.jumpTo(80000);
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
