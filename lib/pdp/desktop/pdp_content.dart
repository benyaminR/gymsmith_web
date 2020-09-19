import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/products/presenation/pages/deals_of_the_day_widget.dart';
import 'package:gymsmith_web/pdp/PdpData.dart';
import 'package:gymsmith_web/pdp/desktop/product_image.dart' as Desktop;
import 'package:gymsmith_web/pdp/desktop/right_side_product_detail_card.dart' as Desktop;
import 'package:responsive_builder/responsive_builder.dart';

class PDPContent extends StatelessWidget{
  final SizingInformation sizingInformation;
  final PdpData pdpData;
  const PDPContent({Key key, @required this.sizingInformation,@required this.pdpData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<dynamic> highResImages = pdpData.images[pdpData.color]['high_res'];
    return Column(
      children: [
        SizedBox(height: 36,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Desktop.ProductImage(images: highResImages.map((e) => e.toString()).toList(),sizingInformation: sizingInformation,),
            Desktop.RightSideProductDetailCard(pdpData:pdpData,sizingInformation: sizingInformation,)
          ],
        ),
        SizedBox(height: 525,),
        DealsOfTheDayWidget(),
        SizedBox(height: 125,),
      ],
    );
  }

}