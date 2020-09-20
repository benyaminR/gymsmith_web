import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/common_widgets/divider.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';

import 'bottom_amount_and_price_widget.dart' as Mobile;
import 'cart_list.dart' as Mobile;

class CartContent extends StatelessWidget {
  final Cart cart;

  const CartContent({Key key,@required this.cart}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 16,),

        Text('Dein Einkaufswagen',style: roboto16BlackBold,),

        SizedBox(height: 8,),

        CommonDivider(),

        Mobile.CartList(cart: cart,),

        SizedBox(height: 16,),

        CommonDivider(),

        SizedBox(height: 16,),

        Container(
          width: 625,
          child: Align(
            child: Mobile.BottomAmountAndPriceWidget(),
            alignment: Alignment.centerRight,
          ),
        ),
        SizedBox(height: 16,),

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
