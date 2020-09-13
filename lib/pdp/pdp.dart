import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/features/products/presenation/pages/deals_of_the_day_widget.dart';
import 'package:gymsmith_web/pdp/product_image.dart';
import 'package:gymsmith_web/pdp/right_side_product_detail_card.dart';

class PDP extends StatelessWidget{
  final Product product;
  const PDP({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> highResImages = product.images[product.colors[Random().nextInt(product.colors.length)]]['high_res'];

    return Column(
      children: [
        SizedBox(height: 36,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(images: highResImages.map((e) => e.toString()).toList(),duration: Duration(seconds: 1),delay: Duration(seconds: 5),),
            RightSideProductDetailCard(product: product,)
          ],
        ),
        SizedBox(height: 525,),
        DealsOfTheDayWidget(),
        SizedBox(height: 125,),
      ],
    );
  }
}