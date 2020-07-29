import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/presenation/deals_of_the_day/deals_of_the_day_bloc.dart';
import 'package:gymsmith_web/injection_container.dart';

class DealsOfTheDayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DealsOfTheDayBloc>(),
      child: BlocBuilder<DealsOfTheDayBloc,DealsOfTheDayState>(
        builder: (context,state){
          if(state is Empty){
            return Text("empty");
          }else if(state is Loading){
            return Text("Loading");
          }else if(state is Loaded){
            return Text("Loaded");
          }else if(state is Error){
            return Text(state.msg);
          }
          return Text('Unknown state!');
        },
      ),
    );
  }
}
