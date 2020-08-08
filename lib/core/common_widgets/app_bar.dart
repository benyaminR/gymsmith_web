import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/core/custom_icons/custom_icons_icons.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gymsmith_web/injection_container.dart';
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
                    icon: BlocProvider<CartBloc>(
                      create: (context) => sl<CartBloc>()..add(GetCartEvent()),
                      child: BlocBuilder<CartBloc,CartState>(
                        builder: (context, state) {
                          print('current State of CartBloc is $state');
                          if(state is CartUpdatedState)
                            return _updateCartIcon(state.updatedCart);
                          return CircularProgressIndicator();
                        } ,
                      ),
                    ),
                    onPressed: () => print('cart'),
                  )
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

  Widget _updateCartIcon(Cart cart){
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(CustomIcons.cart,color: Colors.white,size: 40,),
        Align(
          alignment: Alignment.lerp(Alignment.topLeft, Alignment.bottomRight, 1.5),
          child: Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(180)
              ),
              color: White,
              shadows: [
                BoxShadow(
                  color: Black,
                  blurRadius: 2,
                  offset: Offset(0,2),
                )
              ]
            ),
            child: Text('${cart.items != null ? cart.items.length : 0}',
              style: TextStyle(
              color: Black,
              fontSize: 10,
                fontWeight: FontWeight.bold
            ),
            ),
          ),
        )
      ],
    );
  }
}

