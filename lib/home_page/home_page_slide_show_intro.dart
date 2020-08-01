import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class HomePageSlideShowIntro extends StatefulWidget {
  final Duration delay;
  final Duration duration;
  final SizingInformation sizingInformation;

  const HomePageSlideShowIntro({Key key, @required this.delay,@required this.duration, @required this.sizingInformation}) : super(key: key);

  @override
  _HomePageSlideShowIntroState createState() => _HomePageSlideShowIntroState(delay: delay,duration: duration,sizingInformation: sizingInformation);
}

class _HomePageSlideShowIntroState extends State<HomePageSlideShowIntro> {

  final Duration delay;
  final Duration duration;
  final SizingInformation sizingInformation;

  Widget previous = Container();
  Widget current = Container();

  int index = 0;
  int max = 2;

  _HomePageSlideShowIntroState({@required this.delay, @required this.duration, @required this.sizingInformation});

  @override
  void initState() {
    current = HomePageIntroSlide(index: 0);
    previous = HomePageIntroSlide(index: 2);
    super.initState();
    _setUp();
  }

  @override
  Widget build(BuildContext context) {
    widget.sizingInformation.isDesktop;

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
        if(index >= max) index = 0;
        current = HomePageIntroSlide(index: index);

        final previousIndex = index == 0 ? max : index-1;
        previous = HomePageIntroSlide(index: previousIndex);
      });
    });
  }
}

class HomePageIntroSlide extends StatelessWidget{

  final List<String> images = [
    'assets/images/Preview_00.png',
    'assets/images/Preview_01.png',
    'assets/images/Preview_02.png',
  ];
  final int index;

  HomePageIntroSlide({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ResponsiveBuilder(
      builder: (context, sizingInformation)=>Container(
        height: 718,
        //width: sizingInformation.screenSize.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Finde deine passende Rüstung.',
                    textAlign: TextAlign.center,
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
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

}

