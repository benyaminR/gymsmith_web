import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'slide_show_event.dart';

part 'slide_show_state.dart';

class SlideShowBloc extends Bloc<SlideShowEvent, SlideShowState> {

  final List<Widget> slides;
  final Duration delay;
  final Duration duration;

  int currentIndex = 0;

  SlideShowBloc(SlideShowState initialState,
      {
        @required this.delay,
        @required  this.duration,
        @required this.slides
      })
      : super(initialState){
    currentIndex = 0;
    setUp();
  }

  SlideShowState get initialState => InitialSlideShowState();

  @override
  Stream<SlideShowState> mapEventToState(SlideShowEvent event) async* {
    if(event is Slide){
      if(state is !SlidingState) {
        yield SlidingState(currentSlide: slides[currentIndex]);
        _incrementIndex();
      }
      else if(state is !AnotherSlidingState) {
        yield AnotherSlidingState(currentSlide: slides[currentIndex]);
        _incrementIndex();
      }

    }
  }

  void _incrementIndex() {
    currentIndex++;
    if(currentIndex >= slides.length) currentIndex = 0;
  }

  void _switchSlide(){
    this.add(Slide());
  }

  void setUp(){
    Timer.periodic(delay,(Timer timer)=>{
      _switchSlide()
    });
  }

}



