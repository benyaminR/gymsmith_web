
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymsmith_web/core/common_widgets/product_card_ui.dart';
import 'package:gymsmith_web/core/common_widgets/title_bar.dart';
import 'package:gymsmith_web/core/navigation/INavigationWidget.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/features/products/domain/entities/products.dart';
import 'package:gymsmith_web/features/products/presenation/deals_of_the_day/products_bloc.dart';
import 'package:gymsmith_web/injection_container.dart';
import 'package:responsive_builder/src/sizing_information.dart';

class ProductsPage extends StatelessWidget implements INavigationWidget{

  
  final ProductsEvent event;
  final String imageText;
  final String imagePath;
  final String titleText;

  const ProductsPage({Key key,@required this.event,@required this.imageText,@required this.imagePath,@required this.titleText}) : super(key: key);

  @override
  void onResponsiveness(SizingInformation sizingInformation) {
    // TODO: implement onResponsiveness
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) => sl<ProductsBloc>()..add(event),
      child: BlocBuilder<ProductsBloc,ProductsState>(
        builder: (context, state){
          if(state is LoadedDealsOfTheDay)
            return _getBody(state.products);
          return Container(height: 1500,);
        },
      ),
    );
  }

  Widget _getBody(Products items){
    return Column(
      children: [
        SizedBox(height: 38,),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(imagePath,height: 718,),
            Text(imageText,style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 46,
                    color: White,
                    shadows: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0,3)
                      )
                    ]
                )
            ),
            )
          ],
        ),
        SizedBox(height: 36,),
        TitleBar(title: titleText,),
        SizedBox(height: 42,),

        Padding(
          padding: const EdgeInsets.only( left: 36 , right: 36 ),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 325.0 / 375.0
            ),
            itemCount: items.items.length,
            itemBuilder: (context, index) => ProductCardUi(product: items.items[index],),
          ),
        ),

        SizedBox(height: 164,),

      ],
    );
  }



}