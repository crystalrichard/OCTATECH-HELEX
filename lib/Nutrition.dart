import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:octatech/nu_video.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'environmentSelector.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({Key? key}) : super(key: key);
  @override
  State<Nutrition> createState() => _Nutrition();
  Widget build(BuildContext context) {
    return new Scaffold();
  }
}

class _Nutrition extends State<Nutrition> {
  final List<String> titles = [
    "FOOTBALL",
    "CRICKET",
    "ATHLETICS",
    "BASKET BALL",
    "VOLLEYBALL",
  ];

  Map indexToHeading = {
    0: 'FOOTBALL',
    1: 'CRICKET',
    2: 'ATHLETICS',
    3: 'BASKET BALL',
    4: 'VOLLEYBALL',
  };

  @override
  Widget build(BuildContext context) {
    final List<Widget> images = [
      Hero(
        tag: indexToHeading[0],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/nu_football.gif",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Hero(
        tag: indexToHeading[1],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/nu_cricket.gif",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Hero(
        tag: indexToHeading[2],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/nu_athletics.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Hero(
        tag: indexToHeading[3],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/nu_basketball.gif",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Hero(
        tag: indexToHeading[4],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/nu_volleyball.gif",
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text("Select diet for your sport"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: VerticalCardPager(
            titles: titles,
            images: images,
            textStyle: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontFamily: 'Caveat'),
            initialPage: 2,
            align: ALIGN.CENTER,
            onSelectedItem: ((index) => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            NuVideo(sport: indexToHeading[index])),
                  )
                }),
          ))
        ],
      )),
      //Checkbox(value: false, onChanged: null),
    );
  }
}
