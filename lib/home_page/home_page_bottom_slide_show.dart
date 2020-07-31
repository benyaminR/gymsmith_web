import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class HomePageBottomSlideShow extends StatefulWidget {
  final Duration delay;
  final Duration duration;
  HomePageBottomSlideShow({Key key, @required this.delay, @required this.duration}) : super(key: key);

  @override
  _HomePageBottomSlideShowState createState() => _HomePageBottomSlideShowState();
}

class _HomePageBottomSlideShowState extends State<HomePageBottomSlideShow> {
  Widget previous = Container();
  Widget current = Container();
  int index = 0;
  String topText = 'Steigere deine Leistung.';

  List<Widget> slides = [
    Image.asset(
      'assets/images/HomePageBottomSlide_00.png',
      fit: BoxFit.cover,),
    Image.asset(
      'assets/images/HomePageBottomSlide_01.png',
      fit: BoxFit.cover,),
    Image.asset(
      'assets/images/HomePageBottomSlide_02.png',
      fit: BoxFit.cover,),

  ];

  @override
  void initState() {
    current = slides[0];
    previous = slides[slides.length-1];
    super.initState();
    _setUp();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1857,
          height: 1724,
          alignment: Alignment.center,
          child: Stack(
            children:[ CustomAnimation<double>(
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
              duration: widget.duration,
            ),
            Align(
              alignment: Alignment.lerp(Alignment.topLeft, Alignment.bottomLeft, 0.15),
              child: MirrorAnimation(
                duration: Duration(seconds: 3),
                curve: Curves.linear,
                tween: 0.tweenTo(topText.length),
                builder: (context, child, value) => Text(topText.substring(0,value),style: GoogleFonts.roboto(textStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 46
                )),),
              ),
            )
            ],
          ),
        ),

        ButtonTheme(
          height: 103,
          minWidth: 321,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
          ),
          child: MaterialButton(
            child: Text('Erkunden',style: roboto28BlackWhite,),
            onPressed: ()=> print('Erkunden'),
            color: Colors.black,
          ),
        )
      ],
    );
  }

  _setUp(){
    Timer.periodic(widget.delay, (timer) {
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

