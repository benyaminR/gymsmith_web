
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/core/navigation/INavigationWidget.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/pdp/desktop/pdp_content.dart' as Desktop;
import 'package:gymsmith_web/pdp/mobile/pdp_content.dart' as Mobile;
import 'package:gymsmith_web/pdp/tablet/pdp_content.dart' as Tablet;

import 'package:gymsmith_web/pdp/pdp/pdp_bloc.dart';
import 'package:responsive_builder/src/sizing_information.dart';

import '../injection_container.dart';

class PDP extends StatelessWidget implements INavigationWidget{
  final Product product;
  SizingInformation sizingInformation;

  PDP({Key key, @required this.product}) : super(key: key);

  @override
  void onResponsiveness(SizingInformation sizingInformation) {
    print('adapting to sizing information!');
    this.sizingInformation = sizingInformation;
    sl<PdpBloc>().add(InitializePdpEvent(product: product));
  }

  @override
  Widget build(BuildContext context) {
    sl<PdpBloc>().add(InitializePdpEvent(product: product));
    return BlocProvider.value(value: sl<PdpBloc>(),
      child: BlocBuilder<PdpBloc,PdpState>(
      builder: (context, state){
        if(state is UpdatedPdpState){
          if(sizingInformation.isDesktop)
            return Desktop.PDPContent(sizingInformation: sizingInformation,pdpData: state.pdpData,);
          else if(sizingInformation.isMobile)
            return Mobile.PDPContent(sizingInformation: sizingInformation, pdpData: state.pdpData);
          else if(sizingInformation.isTablet)
            return Tablet.PDPContent(sizingInformation: sizingInformation,pdpData: state.pdpData,);
        }
        return Container();
      },
    ),
    );
  }


}