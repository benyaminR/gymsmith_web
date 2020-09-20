import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';

import 'cart_card_ui.dart' as Mobile;

class CartList extends StatelessWidget{
  final Cart cart;

  const CartList({Key key,@required this.cart}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var items = getCartItemCartUIs(cart.items);
    return Container(
              height: (280 * items.length) / 2,
              child: GridView.builder(
                itemBuilder: (context, index) => items[index],
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
            );
  }

  List<Widget> getCartItemCartUIs( List<CartItemData> items){

    List<Widget> cards = List<Widget>();
    for(var x = 0 ; x < items.length; x++){
      cards.add(Mobile.CartItemCardUI(cartItemData: items[x]));
    }
    return cards;
  }
}