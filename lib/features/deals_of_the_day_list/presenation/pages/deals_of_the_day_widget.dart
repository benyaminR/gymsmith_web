import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/TextStyles/text_styles.dart';
import 'package:gymsmith_web/custom_icons/custom_icons_icons.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/presenation/deals_of_the_day/deals_of_the_day_bloc.dart';
import 'package:gymsmith_web/injection_container.dart';
import 'package:gymsmith_web/title_bar.dart';

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
              return Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  width: 325,
                  height: 450,
                  child: Stack(
                    children: [
                      //bottom
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.white,
                          width: 325,
                          height: 125,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //left
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  item.isNew ? Padding(
                                    padding: const EdgeInsets.fromLTRB(16,0,0,8),
                                    child: Text('Neu',style: roboto16BlackBold,),
                                  ) : Container(),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(16,0,0,8),
                                    child: Text(item.name,style: roboto16Grey,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(16,0,0,0),
                                    child: Text(item.colors.toString(),style: roboto16Grey),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,16,8),
                                    child: Text(item.price,style: roboto16GreyUnderline,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: GestureDetector(
                                        onTap: ()=> print(item.name),
                                        child: Icon(CustomIcons.cart,size: 40,),
                                      ),
                                    ),
                                  )
                                ],
                              )
                              //right
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 375,
                          width: 325,
                          child: Image.network(
                            item.images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
        ),
      );
    }else if(state is Error){
      return Text(state.msg);
    }
  }
}



