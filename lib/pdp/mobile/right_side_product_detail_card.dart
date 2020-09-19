import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/common_widgets/title_bar.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gymsmith_web/pdp/mobile/pdp_card_bottom_widget.dart' as Mobile;
import 'package:gymsmith_web/pdp/mobile/select_color_widget.dart' as Mobile;
import 'package:gymsmith_web/pdp/mobile/select_size_widget.dart' as Mobile;
import 'package:responsive_builder/responsive_builder.dart';

import '../../injection_container.dart';
import '../PdpData.dart';

class RightSideProductDetailCard extends StatelessWidget {
  final PdpData pdpData;
  final SizingInformation sizingInformation;
  const RightSideProductDetailCard({Key key,@required this.pdpData,@required this.sizingInformation}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right : 32.0),
    child: Container(
      height: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Size Selector
              TitleBar(title: 'Größe',mobileWidth: 75,mobilePadding: 11,),
              Mobile.SelectSizeWidget(pdpData: pdpData,),
              SizedBox(height: 16,),
              //Color Selector
              TitleBar(title: 'Farbe',mobileWidth: 75,mobilePadding: 11,),
              Mobile.SelectColorWidget(pdpData: pdpData,),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(pdpData.price+'€',style: roboto28Grey),
              //Add Button
              MaterialButton(
                child: Text(pdpData.isSizeAvailable() ? 'Hinzufügen' : 'Ausverkauft!',style: roboto16White,),
                onPressed: ()=> pdpData.isSizeAvailable() ?
                sl<CartBloc>().add(AddItemToCartEvent(item: CartItemData.fromPdpData(pdpData))) :
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('Dieses Produkt ist leider ausverkauft!'))),
                minWidth: 150,
                height: 48,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)
                ),
                color: pdpData.isSizeAvailable() ? Orange : Grey_Dark,
              ),
            ],
          )
        ],
      ),
    ),
  );
}}
