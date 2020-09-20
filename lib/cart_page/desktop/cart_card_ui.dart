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
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 280,
                  width: 625,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 625,
                        height: 180,
                        decoration: BoxDecoration(
                            color: White,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                              )
                            ]
                        ),
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Image.network(image,
                              height: 280,
                              width: 280,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.only(top: 36,right: 20,bottom: 8),
                              width: 625-280.0,
                              height: 180,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(product.name,style: roboto16Black,),
                                      Text(cartItemData.color,style: roboto16Grey,),
                                      Text(cartItemData.size,style: roboto16Grey,)
                                    ],
                                  ),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:[
                                        Text(product.price+'€',style: roboto16Black,),
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
                          )
                        ],
                      ),
                    ],

                  ),
                )
            );
          }
          return Container();
        },
      ),
    );
  }
}