import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymsmith_web/core/utils/database_paths.dart';
import 'package:gymsmith_web/injection_container.dart';

final size = 10;

Future<void> pumpData() async{
  if((await sl<Firestore>().collection(Products_Path).getDocuments()).documents.length != 0) return;
  for(var i = 0; i < 10 ; i++) {
    await sl<Firestore>().collection(Products_Path).document().setData({
      'description': 'Das beste T-Shirt überhaupt!',
      'name': 'T-Shirt',
      'images': ['https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/t-SHIRT_05_Red_1.png?alt=media&token=79028fe6-c272-4c45-b8ba-186c993fda7b',
        'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/t-SHIRT_05_Grey_1.png?alt=media&token=aff9c6cc-7c1e-45e5-9999-369fa806bb35'],
      'price': '29.99',
      'isAvailable': true,
      'isNew': true,
      'colors': ['Red', 'Black'],
      'sizes': ['S', 'M', 'L', 'XL']
    });
  }
}