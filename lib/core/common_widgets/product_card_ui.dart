import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/custom_icons/custom_icons_icons.dart';
import 'package:gymsmith_web/core/navigation/navigation_bloc.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/pdp/pdp.dart';

import '../../injection_container.dart';

class ProductCardUi extends StatelessWidget {
  final Product product;

  const ProductCardUi({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<dynamic> lowResImages = product.images[product.previewColor]['low_res'];
    return GestureDetector(
      onTap: () => sl<NavigationBloc>().add(ChangePageEvent(widget: PDP(product: product,))),
      child: Container(
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
                        product.isNew ? Padding(
                          padding: const EdgeInsets.fromLTRB(16,0,0,8),
                          child: Text('Neu',style: roboto16BlackBold,),
                        ) : Container(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16,0,0,8),
                          child: Text(product.name,style: roboto16Grey,),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16,0,0,0),
                          child: Text(product.colors.keys.join(', '),style: roboto16Grey),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,16,8),
                          child: Text(product.price+' €',style: roboto16GreyUnderline,),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: GestureDetector(
                              onTap: ()=> sl<CartBloc>().add(AddItemToCartEvent(item: CartItemData.fromItem(product))),
                              child: Icon(CustomIcons.cart,size: 28,),
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
                  lowResImages[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
