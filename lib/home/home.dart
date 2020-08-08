import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/core/NonScrollBehavior.dart';
import 'package:gymsmith_web/core/common_widgets/app_bar.dart';
import 'package:gymsmith_web/core/common_widgets/bottom_nav_bar.dart';
import 'package:gymsmith_web/core/common_widgets/common_drawer.dart';
import 'package:gymsmith_web/core/navigation/navigation_bloc.dart';
import 'package:gymsmith_web/home_page/home_page.dart';
import 'package:gymsmith_web/injection_container.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatelessWidget {
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
            body:SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _getCurrentPage(),
                    BottomNavBar()
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }

  Widget _getCurrentPage(){
    return ResponsiveBuilder(
      builder:(context, sizingInformation) =>  BlocProvider<NavigationBloc>(
        create:(context) => sl<NavigationBloc>()..add(ChangePageEvent(widget: HomePage(sizingInformation: sizingInformation,))) ,
        child: BlocBuilder<NavigationBloc,NavigationState>(
          builder: (context, state) {
            if(state is LoadedNavigationState)
              return state.widget;
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
