import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'VRintro.dart';

class SecondRoute extends StatelessWidget {
  SecondRoute({Key? key, required this.heading}) : super(key: key);

  List<String> images = [
    'assets/images/Cyberpunk-2077.gif',
    'assets/images/forest.gif',
    'assets/images/Avenger Tower.jpg'
    // 'assets/images/martian_2.jpg',
    // 'assets/images/grim reaper.gif',
  ];

  Map<int, String> indexToMapName = {
    0: 'SCI FI',
    1: 'MOON',
    2: 'RETRO'
    // 3: 'MARTIAN',
    // 4: 'GRIM'
  };
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          heading + " selected. Choose a map :)",
          style: TextStyle(fontSize: 16.0, fontFamily: 'Cinzel'),
        ),
      ),
      body: SafeArea(
          child: Swiper(
        itemCount: images.length,
        itemHeight: 500,
        itemWidth: 500,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: InkWell(
              child: Image.asset(images[index], fit: BoxFit.fill),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => VRintro(
                            sport: heading,
                            map: indexToMapName[index]!,
                          )),
                )
              },
            ),
          );
        },
        viewportFraction: 0.7,
        scale: 0.8,
      )),
    );
  }
}
