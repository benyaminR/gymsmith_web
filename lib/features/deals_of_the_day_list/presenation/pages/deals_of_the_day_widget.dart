import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/core/common_widgets/product_card_ui.dart';
import 'package:gymsmith_web/core/common_widgets/title_bar.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/presenation/deals_of_the_day/deals_of_the_day_bloc.dart';
import 'package:gymsmith_web/injection_container.dart';

class DealsOfTheDayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleBar(title:'Angebote des Tages'),
        BlocProvider(
            create: (context) => sl<DealsOfTheDayBloc>()..add(GetDealsOfTheDay()),
            child: BlocBuilder<DealsOfTheDayBloc,DealsOfTheDayState>(
              builder: (context, state) => _getWidgetForState(state,context),
            )
        )
      ],
    );
  }

  Widget _getWidgetForState(DealsOfTheDayState state,BuildContext context){
    print('Current State : $state');
    if(state is InitialDealsOfTheDayState){
      return Container();
    }else if(state is Loading){
      return CircularProgressIndicator();
    }else if(state is Loaded){
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 450,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: state.items.items.length,
            itemBuilder:(context, index) {
              final item = state.items.items[index];
              return ProductCardUi(item: item,);
            },
        ),
      );
    }else if(state is Error){
      return Text(state.msg);
    }
  }

}



