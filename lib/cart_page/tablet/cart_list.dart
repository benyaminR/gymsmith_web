import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gymsmith_web/injection_container.dart';

import 'cart_card_ui.dart' as Tablet;

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
      cards.add(Tablet.CartItemCardUI(cartItemData: items[x]));
    }
    return cards;
  }
}