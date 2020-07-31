part of 'slide_show_bloc.dart';

@immutable
abstract class SlideShowState extends Equatable{}

class InitialSlideShowState extends SlideShowState {
  @override
  List<Object> get props =>[];
}

class SlidingState extends SlideShowState {
  final Widget currentSlide;

  SlidingState({@required this.currentSlide});

  @override
  List<Object> get props =>[];
}
class AnotherSlidingState extends SlideShowState {
  final Widget currentSlide;

  AnotherSlidingState({@required this.currentSlide});

  @override
  List<Object> get props =>[];
}