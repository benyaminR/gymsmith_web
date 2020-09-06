import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:gymsmith_web/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:gymsmith_web/injection_container.dart';

class BottomAmountAndPriceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider.value(
        value: sl<CartBloc>(),
        child: BlocBuilder<CartBloc,CartState>(
          builder: (context, state){
            print('Hello!');
            if(state is CartUpdatedState){
              var amount = 0;
              var total = 0.0;
              state.updatedCart.items.forEach((element) {
                amount += element.amount;
                total += element.amount * double.parse(element.price);
              });
              return Text('Summe ($amount Artikel) : $total€',style: roboto28Grey,);
            }
            return Container();
          },
        ),
      ),
    );
  }

}
