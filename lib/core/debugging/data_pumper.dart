
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymsmith_web/core/utils/database_paths.dart';
import 'package:gymsmith_web/injection_container.dart';
final size = 10;

Future<void> pumpData() async{
  if((await sl<Firestore>().collection(Products_Path).getDocuments()).documents.length != 0) return;
  for(var i = 0; i < 10 ; i++) {
    await sl<Firestore>().collection(Products_Path).document().setData({
      'description': 'Das beste T-Shirt überhaupt!',
      'name': 'T-Shirt' + i.toString(),
      'images': {
        'black':{
          'low_res':[
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fblack%2Flow_res%2Fvengance_black_lr_0.png?alt=media&token=8db2d1b7-7035-4afd-9168-1235cfbc3928',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fblack%2Flow_res%2Fvengance_black_lr_01.png?alt=media&token=c8a3595c-e97d-46ea-9247-f81c711b5471',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fblack%2Flow_res%2Fvengance_black_lr_02.png?alt=media&token=ae9f573c-aea4-4c84-afe9-75c27ed80c7a',
          ],
          'high_res':[
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fblack%2Fhigh_res%2Fvengance_black_hr_0.png?alt=media&token=72ea0ff3-5d06-442e-8683-72fca648ac9a',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fblack%2Fhigh_res%2Fvengance_black_hr_01.png?alt=media&token=e1488340-bbeb-4e77-b813-90bd2d512cd2',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fblack%2Fhigh_res%2Fvengance_black_hr_02.png?alt=media&token=241bebd7-46db-461c-b4db-4f9ab7306d41',
          ]
        },
        'grey':{
          'low_res':[
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fgrey%2Flow_res%2Fvengance_grey_lr_0.png?alt=media&token=26c9244d-6eeb-449b-ad36-d0f7dd4a9f39',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fgrey%2Flow_res%2Fvengance_grey_lr_01.png?alt=media&token=454c1a02-7846-4028-b0fa-9bd1c91c16c7',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fgrey%2Flow_res%2Fvengance_grey_lr_02.png?alt=media&token=6674b784-8c75-46a7-9951-005f357ee397',
          ],
          'high_res':[
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fgrey%2Fhigh_res%2Fvengance_grey_hr_0.png?alt=media&token=62e5c10a-728b-4e24-ae00-0dddcc2212d9',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fgrey%2Fhigh_res%2Fvengance_grey_hr_01.png?alt=media&token=e18936ac-0702-4d30-8b22-6116743940eb',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fgrey%2Fhigh_res%2Fvengance_grey_hr_02.png?alt=media&token=0c529287-f1fc-455c-82a5-bb92e92fd642',
          ]
        },
        'red':{
          'low_res':[
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fred%2Flow_res%2Fvengance_red_lr_0.png?alt=media&token=377b1961-24b8-4742-8621-3a8dc0bb0709',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fred%2Flow_res%2Fvengance_red_lr_01.png?alt=media&token=96a63728-cc70-4f8c-be87-ffa0613f0b66',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fred%2Flow_res%2Fvengance_red_lr_02.png?alt=media&token=d1d138b1-afbc-46e7-92d8-de87d49d014a',
          ],
          'high_res':[
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fred%2Fhigh_res%2Fvengance_red_hr_0.png?alt=media&token=89004252-7b9b-4e83-bf55-929298e2155f',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fred%2Fhigh_res%2Fvengance_red_hr_01.png?alt=media&token=39441a20-5481-40b0-ab66-4be2cbb56262',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fred%2Fhigh_res%2Fvengance_red_hr_02.png?alt=media&token=b5a1acd3-33b4-446b-9e8e-c02acefee1ef',
          ]
        },
        'white':{
          'low_res':[
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fwhite%2Flow_res%2Fvengance_white_lr_0.png?alt=media&token=f0aed334-c527-408c-a2ff-a7ef3105a775',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fwhite%2Flow_res%2Fvengance_white_lr_01.png?alt=media&token=2d61b336-6098-4ab3-9664-16cc78a939d9',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fwhite%2Flow_res%2Fvengance_white_lr_01.png?alt=media&token=2d61b336-6098-4ab3-9664-16cc78a939d9',
          ],
          'high_res':[
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fwhite%2Fhigh_res%2Fvengance_white_hr_0.png?alt=media&token=613271a1-6b2b-420d-822e-0c2a0342be2d',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fwhite%2Fhigh_res%2Fvengance_white_hr_01.png?alt=media&token=68aa2c7f-4c84-4f47-ab53-522bf9e5dd12',
            'https://firebasestorage.googleapis.com/v0/b/gymsmith-test.appspot.com/o/product_images%2Ft-shirts%2Fvengance%2Fwhite%2Fhigh_res%2Fvengance_white_hr_02.png?alt=media&token=e619b115-b806-4693-a002-9dd5ada95c0f',
          ]
        },
      },
      'price': '29.99',
      'isNew': true,
      'colors': {
        'black':{
          'S':true,
          'M':true,
          'L':true,
          'XL':true
        },
        'red':{
          'S':true,
          'M':false,
          'L':true,
          'XL':true
        },
        'white':{
          'S':false,
          'M':false,
          'L':false,
          'XL':true
        },
        'grey':{
          'S':false,
          'M':false,
          'L':false,
          'XL':false
        },
      },
      'previewColor':['black','grey','red','white'][Random().nextInt(4)],
    });
  }
}