import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/custom_icons/custom_icons_icons.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:responsive_builder/responsive_builder.dart';


class CommonAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation){
        return AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: ()=> print('gymsmith'),
                  child: Text("GYMSMITH",style: roboto28BoldWhite,)
              ),
              _getCategoriesForSize(sizingInformation),
              Row(
                children: [
                  IconButton(
                    icon: Icon(CustomIcons.search,color: Colors.white,),
                    onPressed: ()=> print('search'),
                  ),
                  IconButton(
                    icon: Icon(CustomIcons.user,color: Colors.white),
                    onPressed: ()=> print('user'),
                  ),
                  IconButton(
                    icon: Icon(CustomIcons.cart,color: Colors.white,size: 40,),
                    onPressed: ()=> print('cart'),
                  ),
                ],
              )
            ],
          ),
          toolbarHeight: 70,
        );
      },
    );
  }

  Widget _getCategoriesForSize(SizingInformation sizingInformation){
    print('Sizing : '+sizingInformation.toString());
    if(sizingInformation.isDesktop) {
      return Row(
        children: [
          FlatButton(
            onPressed: () => print('Alle'),
            child: Text('Alle', style: roboto16WhiteBold,),
          ),
          FlatButton(
            onPressed: () => print('T-Shirts'),
            child: Text('Shirts', style: roboto16WhiteBold,),
          ),
          FlatButton(
            onPressed: () => print('Shorts'),
            child: Text('Shorts', style: roboto16WhiteBold,),
          ),
          FlatButton(
            onPressed: () => print('Hoodies'),
            child: Text('Hoodies', style: roboto16WhiteBold,),
          ),
          FlatButton(
            onPressed: () => print('Stringers'),
            child: Text('Stringers', style: roboto16WhiteBold,),
          ),
        ],
      );
    }
    return Container();
  }
}

/*
title: GestureDetector(
onTap: ()=> print('gymsmith'),
child: Text("GYMSMITH",style: roboto28BlackWhite,)
),
actions: [
IconButton(
icon: Icon(CustomIcons.search,color: core.Colors.white,),
onPressed: ()=> print('search'),
),
IconButton(
icon: Icon(CustomIcons.user,color: core.Colors.white),
onPressed: ()=> print('user'),
),
IconButton(
icon: Icon(CustomIcons.cart,color: core.Colors.white,size: 40,),
onPressed: ()=> print('cart'),
)
],*/
