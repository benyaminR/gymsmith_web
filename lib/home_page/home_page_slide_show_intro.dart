import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class HomePageSlideShowIntro extends StatefulWidget {
  final Duration delay;
  final Duration duration;

  const HomePageSlideShowIntro({Key key, @required this.delay,@required this.duration}) : super(key: key);

  @override
  _HomePageSlideShowIntroState createState() => _HomePageSlideShowIntroState(delay: delay,duration: duration);
}

class _HomePageSlideShowIntroState extends State<HomePageSlideShowIntro> {

  final Duration delay;
  final Duration duration;

  CustomAnimationControl customAnimationControl = CustomAnimationControl.PLAY;
  Widget previous = Container();
  Widget current = Container();
  int index = 0;

  List<Widget> slides = [
    Container(
      height: 718,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Preview_00.png',
            fit: BoxFit.cover,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                'Finde deine passende Rüstung.',
                style: GoogleFonts.roboto(textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 46,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      spreadRadius: 20
                    )
                  ]
                )),
              )
          ),
        ],
      ),
    ),
    Container(
      height: 718,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Preview_01.png',
            fit: BoxFit.cover,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                'Finde deine passende Rüstung.',
                style: GoogleFonts.roboto(textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          spreadRadius: 20
                      )
                    ]
                )),
              )
          ),
        ],
      ),
    ),
    Container(
      height: 718,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Preview_02.png',
            fit: BoxFit.cover,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                'Finde deine passende Rüstung.',
                style: GoogleFonts.roboto(textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          spreadRadius: 20
                      )
                    ]
                )),
              )
          ),
        ],
      ),
    ),
  ];

  _HomePageSlideShowIntroState({@required this.delay, @required this.duration});

  @override
  void initState() {
    current = slides[0];
    previous = slides[slides.length-1];
    super.initState();
    _setUp();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<double>(
      control: CustomAnimationControl.PLAY_FROM_START,
      tween: 0.0.tweenTo(1.0),
      builder: (context, child, value) => Stack(
        children: [
          Opacity(
            opacity: value,
            child: current,
          ),
          Opacity(
            opacity: (value-1).abs(),
            child: previous,
          )
        ],
      ),
      duration: duration,
    );
  }

  _setUp(){
    Timer.periodic(delay, (timer) {
      setState(() {
        index++;
        if(index >= slides.length) index = 0;
        current = slides[index];

        final previousIndex = index == 0 ? slides.length-1 : index-1;
        previous = slides[previousIndex];
      });
    });
  }
}

