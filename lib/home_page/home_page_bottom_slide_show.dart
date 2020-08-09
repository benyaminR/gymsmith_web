import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
  Timer timer;

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
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: sizingInformation.screenSize.width,
              alignment: Alignment.center,
              child: Column(
                children:[
                  MirrorAnimation(
                    duration: Duration(seconds: 3),
                    curve: Curves.linear,
                    tween: 0.tweenTo(topText.length),
                    builder: (context, child, value) => Text(topText.substring(0,value),style: GoogleFonts.roboto(textStyle: TextStyle(
                        color: Colors.grey[600],
                        fontSize: sizingInformation.isDesktop ? 46 : 26
                    )),),
                  ),
                  CustomAnimation<double>(
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
                )
                ],
              ),
            ),
          ),

          ButtonTheme(
            height: sizingInformation.isDesktop ? 103 : 50,
            minWidth: sizingInformation.isDesktop ? 321 : 150,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
            ),
            child: MaterialButton(
              child: Text('Erkunden',style: sizingInformation.isDesktop ? roboto28BoldWhite : roboto16WhiteBold,),
              onPressed: ()=> print('Erkunden'),
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  _setUp(){
    timer = Timer.periodic(widget.delay, (timer) {
      setState(() {
        index++;
        if(index >= slides.length) index = 0;
        current = slides[index];

        final previousIndex = index == 0 ? slides.length-1 : index-1;
        previous = slides[previousIndex];
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

