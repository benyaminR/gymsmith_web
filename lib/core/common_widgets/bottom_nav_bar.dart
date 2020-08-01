import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BottomNavBar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation){
        if(sizingInformation.isDesktop)
          return BottomNavBarHorizontal();
        return BottomNavBarVertical();
      }
    );
  }
}

class BottomNavBarHorizontal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Black,
      height: 260,
      child: Padding(
        padding: const EdgeInsets.only(top: 60,left: 16,right: 16,bottom: 16),
        child: Column(
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
                  width: 125,
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
                  width: 125,
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
                alignment: Alignment.centerRight,
                child: Text('©GYMSMITH',
                  style: roboto8White,))
          ],
        ),
      ),
    );
  }
}

class BottomNavBarVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Black,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                //header
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text('Konaktdaten', style: roboto12WhiteBold,),
                ),
                //content
                Text('+4901771870990', style: roboto16White,),
                Text('bussiness.benyamin@gmail.com', style: roboto16White,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text('Kundenservice', style: roboto12WhiteBold,),
                ),

                Text('Kontakt', style: roboto16White,),
                Text('Bestellungen und Zahlungen', style: roboto16White,),
                Text('Lieferung', style: roboto16White,),
                Text('Retoure', style: roboto16White,),
                Text('FAQ', style: roboto16White,),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text('Information', style: roboto12WhiteBold,),
                ),

                Text('Über GYMSMITH', style: roboto16White,),
                Text('Kooperation', style: roboto16White,),
                Text('Datenschutzerklärung', style: roboto16White,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('©GYMSMITH',
                  style: roboto8White,)),
          )
        ],
      ),
    );
  }
}