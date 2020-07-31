import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymsmith_web/core/utils/database_paths.dart';
import 'package:gymsmith_web/injection_container.dart';

final size = 10;

List<String> images = [
  'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/DealsOfTheDay%2FBlue_Shadow.png?alt=media&token=1101d617-f98b-4a51-9f22-76b5d4697030',
  'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/DealsOfTheDay%2FGrey_Shadow.png?alt=media&token=5aa4cf09-f57b-40de-a287-6b383cd26567',
  'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/DealsOfTheDay%2FRed_Shadow.png?alt=media&token=8c8c2b27-9563-49bd-aefc-7520cac48bcc',
  'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/DealsOfTheDay%2FWhite_Shadow.png?alt=media&token=2dbcc16f-5155-4fae-a44b-6d42d59ba3ee'
];


Future<void> pumpData() async{
  if((await sl<Firestore>().collection(Products_Path).getDocuments()).documents.length != 0) return;
  for(var i = 0; i < 10 ; i++) {
    await sl<Firestore>().collection(Products_Path).document().setData({
      'description': 'Das beste T-Shirt überhaupt!',
      'name': 'T-Shirt',
      'images': [images[Random().nextInt(images.length)]],
      'price': '29.99',
      'isAvailable': true,
      'isNew': true,
      'colors': ['Red', 'Black'],
      'sizes': ['S', 'M', 'L', 'XL']
    });
  }
}