import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/custom_icons/custom_icons_icons.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/item.dart';

import '../../injection_container.dart';

class ProductCardUi extends StatelessWidget {
  final Item item;

  const ProductCardUi({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      width: 325,
      height: 485,
      child: Stack(
        children: [
          //bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              width: 325,
              height: 125,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //left
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      item.isNew ? Padding(
                        padding: const EdgeInsets.fromLTRB(16,0,0,8),
                        child: Text('Neu',style: roboto16BlackBold,),
                      ) : Container(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16,0,0,8),
                        child: Text(item.name,style: roboto16Grey,),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16,0,0,0),
                        child: Text(item.colors.toString(),style: roboto16Grey),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,16,8),
                        child: Text(item.price+' €',style: roboto16GreyUnderline,),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: GestureDetector(
                            onTap: ()=> sl<CartBloc>().add(AddItemToCartEvent(item: CartItemData.fromItem(item))),
                            child: Icon(CustomIcons.cart,size: 40,),
                          ),
                        ),
                      )
                    ],
                  )
                  //right
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 375,
              width: 325,
              child: Image.network(
                item.images[0],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
