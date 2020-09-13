import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/pdp/pdp/pdp_bloc.dart';

main() {
  final Product product = Product(
    databaseRef: 'ref',
    price: "20.0",
    colors: ['red','grey'],
    description: 'product',
    images: null,
    isAvailable: true,
    isNew: true,
    name: 'T-Shirt',
    sizes: ['M','L','XL'],
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