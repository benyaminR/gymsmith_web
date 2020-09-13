import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/features/products/presenation/pages/deals_of_the_day_widget.dart';
import 'package:gymsmith_web/pdp/pdp/pdp_bloc.dart';
import 'package:gymsmith_web/pdp/product_image.dart';
import 'package:gymsmith_web/pdp/right_side_product_detail_card.dart';

import '../injection_container.dart';

class PDP extends StatelessWidget{
  final Product product;
  const PDP({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    sl<PdpBloc>().add(InitializePdpEvent(product: product));

    return BlocProvider.value(value: sl<PdpBloc>(),
      child: BlocBuilder<PdpBloc,PdpState>(
      builder: (context, state){
        if(state is UpdatedPdpState){
          print(state.pdpData.color);
          List<dynamic> highResImages = state.pdpData.images[state.pdpData.color]['high_res'];
          print(highResImages);
          return Column(
            children: [
              SizedBox(height: 36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new ProductImage(images: highResImages.map((e) => e.toString()).toList(),duration: Duration(seconds: 1),delay: Duration(seconds: 5),),
                  RightSideProductDetailCard(pdpData:state.pdpData,)
                ],
              ),
              SizedBox(height: 525,),
              DealsOfTheDayWidget(),
              SizedBox(height: 125,),
            ],
          );
        }
        return Container();
      },
    ),
    );
  }
}