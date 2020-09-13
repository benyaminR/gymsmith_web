import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gymsmith_web/pdp/pdp_card_bottom_widget.dart';
import 'package:gymsmith_web/pdp/select_color_widget.dart';
import 'package:gymsmith_web/pdp/select_size_widget.dart';

import '../injection_container.dart';
import 'PdpData.dart';

class RightSideProductDetailCard extends StatelessWidget {
  final PdpData pdpData;
  const RightSideProductDetailCard({Key key,@required this.pdpData}) : super(key: key);

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
      //Card Content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 36,),

          Text(pdpData.description,style: roboto28BlackBold,),

          SizedBox(height: 36,),

          Text(pdpData.price+'€',style: roboto28Grey),

          SizedBox(height: 90,),
          //Add Button
          MaterialButton(
            child: Text('Hinzufügen',style: roboto16White,),
            onPressed: ()=> sl<CartBloc>().add(AddItemToCartEvent(item: CartItemData.fromPdpData(pdpData))),
            minWidth: 471,
            height: 48,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24)
            ),
            color: Orange,
          ),

          SizedBox(height: 70,),
          //Size Selector
          Text('Größe',style: roboto28Grey,),

          SizedBox(height: 16,),

          SelectSizeWidget(),

          SizedBox(height: 36,),
          //Color Selector
          Text('Farbe',style: roboto28Grey),

          SizedBox(height: 16,),

          SelectColorWidget(pdpData: pdpData,),

          SizedBox(height: 100,),
          //bottom stuff(Description, Retoure, Reviews)
          PDPCardBottomWidget()
        ],
      ),
    ),
  );
}}
