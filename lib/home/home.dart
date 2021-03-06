import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/core/NonScrollBehavior.dart';
import 'package:gymsmith_web/core/common_widgets/app_bar.dart';
import 'package:gymsmith_web/core/common_widgets/bottom_nav_bar.dart';
import 'package:gymsmith_web/core/common_widgets/common_drawer.dart';
import 'package:gymsmith_web/core/navigation/navigation_bloc.dart';
import 'package:gymsmith_web/home_page/home_page.dart';
import 'package:gymsmith_web/injection_container.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class Home extends StatelessWidget {

  final ScrollController _scrollController = ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {

    return ScrollConfiguration(
      behavior: NonScrollBehavior(),
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
            appBar: PreferredSize(
                child: CommonAppBar(),
                preferredSize: Size(MediaQuery.of(context).size.width, 70)),
            drawer : !sizingInformation.isDesktop ? CommonDrawer() : null,
            body : _getCurrentPage()
        ),
      ),
    );
  }

  Widget _getCurrentPage(){
    return ResponsiveBuilder(
      builder:(context, sizingInformation) =>  BlocProvider<NavigationBloc>(
        create:(context) => sl<NavigationBloc>()..add(ChangePageEvent(widget: HomePage())) ,
        child: BlocBuilder<NavigationBloc,NavigationState>(
          builder: (context, state) {
            if(state is LoadedNavigationState) {
              final currentWidget = state.widget ;
              //final previousWidget = state.previous;
              return CustomAnimation<double>(
                control: CustomAnimationControl.PLAY_FROM_START,
                tween: 0.0.tweenTo(1.0),
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOut,
                builder: (context, child, value) =>
                    Opacity(
                      opacity: value,
                      child:  Scrollbar(
                        isAlwaysShown: true,
                        controller: _scrollController,
                        child: SingleChildScrollView(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                currentWidget as Widget,
                                BottomNavBar()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
