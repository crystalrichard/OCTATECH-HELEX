// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'environmentSelector.dart';
//import 'package:flutter_launcher_icons/android.dart';
import 'Nutrition.dart';
//import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
  Widget build(BuildContext context) {
    return new Scaffold();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> titles = [
    "FOOTBALL",
    "CRICKET",
    "ATHLETICS",
    "BASKET BALL",
    "VOLLEYBALL",
    "NUTRITION"
  ];

  Map indexToHeading = {
    0: 'FOOTBALL',
    1: 'CRICKET',
    2: 'ATHLETICS',
    3: 'BASKET BALL',
    4: 'VOLLEYBALL',
    5: 'NUTRITION'
  };
  void nutrition_nav(int index) {
    if (index != 5) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => SecondRoute(heading: indexToHeading[index])),
      );
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Nutrition()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> images = [
      Hero(
        tag: indexToHeading[0],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/football.jpeg",
            fit: BoxFit.cover,
          ),
       ),
      ),
      Hero(
        tag: indexToHeading[1],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/cricket.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Hero(
        tag: indexToHeading[2],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/athletics.gif",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Hero(
        tag: indexToHeading[3],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/basketball.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Hero(
        tag: indexToHeading[4],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/vollyball.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      Hero(
        tag: indexToHeading[4],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/images/forest.gif",
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Center(
                  child: Image.asset(
                    "assets/images/logo_1.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: VerticalCardPager(
                titles: titles,
                images: images,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Caveat',
                ),
                initialPage: 2,
                align: ALIGN.CENTER,
                onSelectedItem: nutrition_nav,
              ),
            ),
          ],
        ),
      ),
      //Checkbox(value: false, onChanged: null),
    );
  }
}
