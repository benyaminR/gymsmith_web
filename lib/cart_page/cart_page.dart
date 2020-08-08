

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/common_widgets/divider.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';

class CartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 56,),

        Text('Dein Einkaufswagen',style: roboto28BlackBold,),

        CommonDivider(),

        CartList(),

        SizedBox(height: 56,),

        CommonDivider(),

        SizedBox(height: 96,),
        Container(
          width: 625,
          child: Align(
              child: Text('Summe (8 Artikel) : 299.99€',
                style: roboto28Grey,
              ),
            alignment: Alignment.centerRight,
          ),
        ),
        SizedBox(height: 48,),

        MaterialButton(
          child: Text('Bestellen',style: roboto16White,),
          onPressed: ()=> print('Bestellen!'),
          minWidth: 400,
          height: 48,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
          ),
          color: Orange,
        ),

        SizedBox(height: 110,),

      ],
    );
  }
}


class CartList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        for(int i = 0; i < 5 ; i++)
          CartItem(),
      ],
    );
  }

}

class CartItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset('assets/images/HomePageBottomSlide_00.png',
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
                            Text('T-Shirt',style: roboto16Black,),
                            Text('Grey',style: roboto16Grey,)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Text('29.99€',style: roboto16Black,),
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
                                      child: Icon(Icons.remove,size: 16),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Black,width: 0.5)
                                      ),
                                      child: Text('10',style: roboto12Black,),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Black,width: 0.5)
                                      ),
                                      child: Icon(Icons.add,size: 16,),
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

}