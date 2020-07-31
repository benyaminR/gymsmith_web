import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/slideshow/slide_show/slide_show_bloc.dart';

void main(){
  var slides = [Text('Slide_00'),Text('Slide_01'),];
  final slideShowBloc = SlideShowBloc(InitialSlideShowState(),delay: Duration(seconds: 2),duration: Duration(seconds: 1) ,slides: slides);

  test('should emit [Initial, Sliding]', () async{
    //arrange
    //act
    slideShowBloc.add(Slide());
    var expected = [SlidingState()];
    //assert
    expectLater(slideShowBloc, emitsInOrder(expected));
  });
  
  test('should change state every [Duration]', () async{
    //arrange
    slideShowBloc.emit(InitialSlideShowState());

    //act
    await Future.delayed(const Duration(seconds: 3), (){});

    //assert
    expect(slideShowBloc.state, SlidingState());
  });

  test('should return the right widget', () async{
    //arrange
    final slideShowBloc = SlideShowBloc(InitialSlideShowState(),delay: Duration(seconds: 2),duration: Duration(seconds: 1) ,slides: slides);
    //assert
    await Future.delayed(const Duration(seconds: 3), (){});
    expect((slideShowBloc.state as SlidingState).currentSlide, slides[0]);

  });

  test('should rest to zero after reaching the end', () async {
    //arrange
    final slideShowBloc = SlideShowBloc(InitialSlideShowState(),delay: Duration(seconds: 2),duration: Duration(seconds: 1) ,slides: slides);
    //act
    await Future.delayed(const Duration(seconds: 5), (){});
    //assert
    expect(slideShowBloc.currentIndex, 0);
  });

}