import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/pdp/pdp/pdp_bloc.dart';

main() {
  final Product product = Product(
    databaseRef: 'ref',
    price: "20.0",
    colors: {
      'red':['S','M'],
      'white':['S','M']
    },
    description: 'product',
    images: Map<String,dynamic>(),
    isNew: true,
    name: 'T-Shirt',
    previewColor: 'red',
  );

  final bloc = PdpBloc(EmptyPdpState());

  group('pdp bloc', (){

    test(' InitializePdpEvent should init CartItemData', () async {
      //arrange
      //act
      bloc.add(InitializePdpEvent(product: product));
      //assert
      await Future.delayed(Duration(seconds: 1));
      expect(bloc.pdpData.color,product.previewColor);
      expect(bloc.pdpData.databaseRef,product.databaseRef);
      expect(bloc.pdpData.price,product.price);
      expect(bloc.pdpData.description,product.description);
      expect(bloc.pdpData.colors,product.colors);

    });

    test(' ChangeColor should change color', () async {
      //act
      bloc.add(InitializePdpEvent(product: product));
      bloc.add(ChangeColorEvent(color: 'white'));
      //assert
      await Future.delayed(Duration(seconds: 1));
      expect(bloc.pdpData.color,'white');
    });

    test(' ChangeSize should change size', () async{
      //act
      bloc.add(InitializePdpEvent(product: product));
      bloc.add(ChangeSizeEvent(size: 'M'));
      //assert
      await Future.delayed(Duration(seconds: 1));
      expect(bloc.pdpData.size,'M');
    });

  });
}