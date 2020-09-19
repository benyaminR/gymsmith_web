import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/core/navigation/INavigationWidget.dart';
import 'package:gymsmith_web/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gymsmith_web/injection_container.dart';
import 'package:responsive_builder/src/sizing_information.dart';
import 'desktop/cart_content.dart' as Desktop;
import 'tablet/cart_content.dart' as Tablet;
import 'mobile/cart_content.dart' as Mobile;

class CartPage extends StatelessWidget implements INavigationWidget{

  SizingInformation sizingInformation;
  @override
  void onResponsiveness(SizingInformation sizingInformation) {
    this.sizingInformation = sizingInformation;
    sl<CartBloc>().add(GetCartEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<CartBloc>()..add(GetCartEvent()),
      child: BlocBuilder<CartBloc,CartState>(
        builder: (context, state) {
          if(state is CartGetState || state is CartRemoveState || state is CartAddState)
            return CircularProgressIndicator();
          if(state is CartUpdatedState) {
            if(sizingInformation.isDesktop)
              return Desktop.CartContent(cart: state.updatedCart,);
            else if(sizingInformation.isTablet)
              return Tablet.CartContent(cart: state.updatedCart,);
            else if(sizingInformation.isMobile)
              return Mobile.CartContent(cart: state.updatedCart,);
          }
          return Container();
        },
      ),
    );
  }
}