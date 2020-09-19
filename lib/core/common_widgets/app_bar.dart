import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/cart_page/cart_page.dart';
import 'package:gymsmith_web/core/custom_icons/custom_icons_icons.dart';
import 'package:gymsmith_web/core/navigation/navigation_bloc.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:gymsmith_web/core/utils/translation/translation_codes.dart';
import 'package:gymsmith_web/core/utils/translation/translator.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gymsmith_web/features/products/presenation/deals_of_the_day/products_bloc.dart';
import 'package:gymsmith_web/home_page/home_page.dart';
import 'package:gymsmith_web/injection_container.dart';
import 'package:gymsmith_web/products_page/products_page.dart';
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
                  onTap: ()=> sl<NavigationBloc>().add(ChangePageEvent(widget: HomePage())),
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
                    icon: BlocProvider.value(
                      value : sl<CartBloc>()..add(GetCartEvent()),
                      child: BlocBuilder<CartBloc,CartState>(
                        builder: (context, state) {
                          if(state is CartUpdatedState)
                            return _updateCartIcon(state.updatedCart);
                          return CircularProgressIndicator();
                        },
                      ),
                    ),
                    onPressed: () =>  sl<NavigationBloc>().add(ChangePageEvent(widget: CartPage())),
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
    print('Sizing : ' + sizingInformation.toString());
    if(sizingInformation.isDesktop) {
      return Row(
        children: [
          FlatButton(
            onPressed: () => sl<NavigationBloc>().add(ChangePageEvent(
                widget: ProductsPage(
                  event: GetDealsOfTheDayEvent(),
                  imagePath: 'assets/images/Preview_02.png',
                  imageText: sl<Translator>().translate(TranslationCodes.HOMEPAGE_IMAGE_TEXT) ,
                  titleText: sl<Translator>().translate(TranslationCodes.ALL),
                )
            )
            ),
            child: Text(sl<Translator>().translate(TranslationCodes.ALL), style: roboto16WhiteBold,),
          ),
          FlatButton(
            onPressed: () => print('T-Shirts'),
            child: Text(sl<Translator>().translate(TranslationCodes.SHIRTS), style: roboto16WhiteBold,),
          ),
          FlatButton(
            onPressed: () => print('Shorts'),
            child: Text(sl<Translator>().translate(TranslationCodes.SHORTS), style: roboto16WhiteBold,),
          ),
          FlatButton(
            onPressed: () => print('Hoodies'),
            child: Text(sl<Translator>().translate(TranslationCodes.HOODIES), style: roboto16WhiteBold,),
          ),
          FlatButton(
            onPressed: () => print('Stringers'),
            child: Text(sl<Translator>().translate(TranslationCodes.STRINGERS), style: roboto16WhiteBold,),
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
        Icon(CustomIcons.cart,color: Colors.white,size: 28,),
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

