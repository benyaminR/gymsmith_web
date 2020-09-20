import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gymsmith_web/features/products/presenation/deals_of_the_day/products_bloc.dart';
import 'package:gymsmith_web/injection_container.dart';

class CartItemCardUI extends StatelessWidget{
  final CartItemData cartItemData;

  const CartItemCardUI({Key key, @required this.cartItemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<ProductsBloc>()..add(GetProductEvent(documentRef: cartItemData.databaseRef)),
      child: BlocBuilder<ProductsBloc,ProductsState>(
        builder: (context, state){
          if(state is Loading) {
            return CircularProgressIndicator();
          }
          if(state is LoadedProduct)
          {
            var product = state.product;
            var image = product.images[cartItemData.color]['low_res'][0];
            return Container(
              height: 225,
              width: 180,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
                      width: 180,
                      height: 90,
                      decoration: BoxDecoration(
                        color: White,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name,style: roboto12Black,),
                              Text(cartItemData.color,style: roboto12Grey,),
                              Text(cartItemData.size,style: roboto12Grey,)
                            ],
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text(product.price+'€',style: roboto12Black,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Black,width: 0.5)
                                          ),
                                          child: GestureDetector(
                                            child: Icon(Icons.remove,size: 16),
                                            onTap: ()=> sl<CartBloc>().add(RemoveItemFromCartEvent(item: cartItemData)),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Black,width: 0.5)
                                          ),
                                          child: Text(cartItemData.amount.toString(),style: roboto12Black,),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Black,width: 0.5)
                                          ),
                                          child: GestureDetector(
                                            child: Icon(Icons.add,size: 16,),
                                            onTap: ()=> sl<CartBloc>().add(AddItemToCartEvent(item: cartItemData)),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:16.0),
                                      child: Text('remove',style: roboto8Grey,),
                                    ),
                                  ],
                                )
                              ]
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.network(image,
                      height: 180,
                      width: 190,
                    ),
                  ),
                ],

              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}