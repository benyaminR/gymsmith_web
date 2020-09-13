import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/pdp/pdp/pdp_bloc.dart';

main() {
  final Product product = Product(
    databaseRef: 'ref',
    price: "20.0",
    colors: Map<String,dynamic>(),
    description: 'product',
    images: Map<String,dynamic>(),
    isNew: true,
    name: 'T-Shirt',
  );

  final bloc = PdpBloc(InitialPdpState(product:product));

  group('pdp bloc', (){

    test(' ChangeColorEvent should change the color', () async {
      //arrange

      //act
      bloc.add(ChangeColorEvent(color: 'red'));
      //assert
      //expectLater(bloc, matcher)

    });


  });
}