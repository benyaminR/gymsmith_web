
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gymsmith_web/core/utils/translation/languages.dart';

class Translator {
  Map<String,String> translationJson;

  init(Language language) async{
    translationJson = await _getJsonForTranslationFile(language.toString().substring((language.toString().length-2)));
  }


  String translate(String code) => translationJson[code];

  Future<String> _getTranslationFileForLanguage(String language) async {
    return await rootBundle.loadString('assets/languages/$language.json');
  }

  Future<Map<String,String>> _getJsonForTranslationFile(String language) async {
    var source = await _getTranslationFileForLanguage(language);
    Map<String,dynamic> rawMap = json.decode(source);
    var converted = rawMap.map((key, value) => MapEntry(key, value.toString()));
    return Future.value(converted);
  }
}