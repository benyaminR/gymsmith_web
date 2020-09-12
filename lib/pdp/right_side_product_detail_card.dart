import 'package:flutter/material.dart';
import 'package:gymsmith_web/cart_page/cart_page.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';

import '../injection_container.dart';

class RightSideProductDetailCard extends StatelessWidget {
  final Product product;
  const RightSideProductDetailCard({Key key,@required this.product}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right : 32.0),
    child: Container(
      padding: EdgeInsets.only(left: 42,right: 42),
      height: 975,
      width: 555,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0,3),
            blurRadius: 6,
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 36,),
          Text(product.description,style: roboto28BlackBold,),
          SizedBox(height: 36,),
          Text(product.price+'€',style: roboto28Grey),
          SizedBox(height: 90,),
          MaterialButton(
            child: Text('Hinzufügen',style: roboto16White,),
            onPressed: ()=> sl<CartBloc>().add(AddItemToCartEvent(item: CartItemData.fromItem(product))),
            minWidth: 471,
            height: 48,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24)
            ),
            color: Orange,
          ),
          SizedBox(height: 70,),
          Text('Größe',style: roboto28Grey,),
          SizedBox(height: 16,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 36,
                  height: 36,
                  child: Text('S',style: roboto16Black,),
                  decoration: BoxDecoration(
                    border: Border.all(color: Black,width: 1)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 36,
                  height: 36,
                  child: Text('M',style: roboto16Black,),
                  decoration: BoxDecoration(
                      border: Border.all(color: Black,width: 1)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 36,
                  height: 36,
                  child: Text('L',style: roboto16Black,),
                  decoration: BoxDecoration(
                      border: Border.all(color: Black,width: 1)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 36,
                  height: 36,
                  child: Text('XL',style: roboto16Black,),
                  decoration: BoxDecoration(
                      border: Border.all(color: Black,width: 1)
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 36,),
          Text('Farbe',style: roboto28Grey),
          SizedBox(height: 16,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.red,
                      border: Border.all(color: Black,width: 1)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Black,width: 1)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Black,width: 1)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Black,width: 1)
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 100,)
          ,
          Container(
            color: Colors.grey[300],
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Beschreibung',style: roboto28Grey,),
                Icon(Icons.add,color: Colors.grey[500],size: 46)
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Lieferung und Retoure',style: roboto28Grey,),
                Icon(Icons.add,color: Colors.grey[500],size: 46)
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rezension',style: roboto28Grey,),
                Icon(Icons.add,color: Colors.grey[500],size: 46,)
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            height: 1,
          ),
        ],
      ),
    ),
  );
}}
