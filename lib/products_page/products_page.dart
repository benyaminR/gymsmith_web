import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/features/products/presenation/deals_of_the_day/products_bloc.dart';
import 'package:gymsmith_web/injection_container.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop/products_page_content.dart' as Desktop;
import 'tablet/products_page_content.dart' as Tablet;
import 'mobile/products_page_content.dart' as Mobile;

class ProductsPage extends StatelessWidget{

  final ProductsEvent event;
  final String imageText;
  final String imagePath;
  final String titleText;

  ProductsPage({Key key,@required this.event,@required this.imageText,@required this.imagePath,@required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation){
        return BlocProvider.value(
          value: sl<ProductsBloc>()..add(event),
          child: BlocBuilder<ProductsBloc,ProductsState>(
            builder: (context, state){
              if(state is LoadedDealsOfTheDay){
                print(sizingInformation.toString());
                if(sizingInformation.isDesktop)
                  return Desktop.ProductsPageContent(titleText: titleText,imageText: imageText,event: event,imagePath: imagePath,products: state.products,);
                else if(sizingInformation.isTablet)
                  return Tablet.ProductsPageContent(titleText: titleText,imageText: imageText,event: event,imagePath: imagePath,products: state.products,);
                else if(sizingInformation.isMobile)
                  return Mobile.ProductsPageContent(titleText: titleText,imageText: imageText,event: event,imagePath: imagePath,products: state.products,);
                else
                  return Mobile.ProductsPageContent(titleText: titleText,imageText: imageText,event: event,imagePath: imagePath,products: state.products,);
              }
              return Center(child: CircularProgressIndicator(),);
            },
          ),
        );
      },
    );
  }

}