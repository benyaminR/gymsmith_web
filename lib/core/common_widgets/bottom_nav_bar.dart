import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';

class BottomNavBar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Black,
      height: 260,
      child: Padding(
        padding: const EdgeInsets.only(left: 60,right: 60,top: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //header
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text('Konaktdaten',style: roboto12WhiteBold,),
                    ),
                    //content
                    Text('+4901771870990',style: roboto16White,),
                    Text('bussiness.benyamin@gmail.com',style: roboto16White,)
                  ],
                ),
                SizedBox(
                  width: 150,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text('Kundenservice',style: roboto12WhiteBold,),
                    ),

                    Text('Kontakt',style: roboto16White,),
                    Text('Bestellungen und Zahlungen',style: roboto16White,),
                    Text('Lieferung',style: roboto16White,),
                    Text('Retoure',style: roboto16White,),
                    Text('FAQ',style: roboto16White,),

                  ],
                ),
                SizedBox(
                  width: 150,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text('Information',style: roboto12WhiteBold,),
                    ),

                    Text('Über GYMSMITH',style: roboto16White,),
                    Text('Kooperation',style: roboto16White,),
                    Text('Datenschutzerklärung',style: roboto16White,),

                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.lerp(Alignment.topLeft, Alignment.bottomLeft, 0.75),
                child: Text('©GYMSMITH',
              style: roboto8White,))
          ],
        ),
      ),
    );
  }

}