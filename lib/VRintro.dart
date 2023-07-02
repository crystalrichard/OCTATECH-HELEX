import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:octatech/environmentSelector.dart';
import 'package:video_360/video_360.dart';
import 'package:flutter/services.dart';
import 'VRexercise.dart';

class VRintro extends StatefulWidget {
  VRintro({Key? key, required this.sport, required this.map}) : super(key: key);
  final String map;
  final String sport;

  @override
  State<VRintro> createState() => _VRintroState();
}

class _VRintroState extends State<VRintro> {
  String durationText = '';
  String totalText = '';
  Video360Controller? controller;

  Map<String, String> sportToIntro = {
    'FOOTBALL':
        'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/intro%2Ffootball.mp4?alt=media',
    'CRICKET':
        'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/intro%2Fcricket.mp4?alt=media',
    'ATHLETICS':
        'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/intro%2Fathletics.mp4?alt=media',
    'BASKET BALL':
        'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/intro%2Fbasketball.mp4?alt=media',
    'VOLLEYBALL':
        'https://firebasestorage.googleapis.com/v0/b/hel-ex-e2e1c.appspot.com/o/intro%2Fvolleyball.mp4?alt=media',
  };

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

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
            url: sportToIntro[widget.sport],
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
                  MaterialPageRoute(
                      builder: (context) => VRExercise(
                            sport: widget.sport,
                            map: widget.map,
                          )),
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
