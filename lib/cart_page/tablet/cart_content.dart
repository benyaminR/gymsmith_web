import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/common_widgets/divider.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';

import 'bottom_amount_and_price_widget.dart' as Tablet;
import 'cart_list.dart' as Tablet;

class CartContent extends StatelessWidget {
  final Cart cart;

  const CartContent({Key key,@required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 56,),

        Text('Dein Einkaufswagen',style: roboto28BlackBold,),

        CommonDivider(),

        Tablet.CartList(cart: cart,),

        SizedBox(height: 56,),

        CommonDivider(),

        SizedBox(height: 96,),

        Container(
          width: 625,
          child: Align(
            child: Tablet.BottomAmountAndPriceWidget(),
            alignment: Alignment.centerRight,
          ),
        ),
        SizedBox(height: 48,),

        MaterialButton(
          child: Text('Bestellen',style: roboto16White,),
          onPressed: ()=> print('Bestellen!'),
          minWidth: 400,
          height: 48,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24)
          ),
          color: Orange,
        ),

        SizedBox(height: 110,),
      ],
    );
  }
}
