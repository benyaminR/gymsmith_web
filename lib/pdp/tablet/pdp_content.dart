import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/common_widgets/title_bar.dart';
import 'package:gymsmith_web/features/products/presenation/pages/deals_of_the_day_widget.dart';
import 'package:gymsmith_web/pdp/PdpData.dart';
import 'package:gymsmith_web/pdp/tablet/product_image.dart' as Tablet;
import 'package:gymsmith_web/pdp/tablet/right_side_product_detail_card.dart' as Tablet;
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
        SizedBox(height: 30,),
        TitleBar(title: pdpData.name,),
        SizedBox(height: 18,),
        Tablet.ProductImage(images: highResImages.map((e) => e.toString()).toList(),sizingInformation: sizingInformation,),
        SizedBox(height: 26,),
        Tablet.RightSideProductDetailCard(pdpData:pdpData,sizingInformation: sizingInformation,),
        SizedBox(height: 66,),
        DealsOfTheDayWidget(),
        SizedBox(height: 125,),
      ],
    );
  }

}