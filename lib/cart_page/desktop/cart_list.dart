import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';

import 'cart_card_ui.dart' as Desktop;

class CartList extends StatelessWidget{

  final Cart cart;

  const CartList({Key key,@required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: getCartItemCartUIs(cart.items),);
  }

  List<Widget> getCartItemCartUIs( List<CartItemData> items){

    List<Widget> cards = List<Widget>();
    for(var x = 0 ; x < items.length; x++){
      cards.add(Desktop.CartItemCardUI(cartItemData: items[x]));
    }
    return cards;
  }
}