
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gymsmith_web/core/utils/translation/languages.dart';

class Translator {

  Future<String> translate(String code,Language language) async {
    var translationJson = await _getJsonForTranslationFile(language.toString());
    return translationJson[language.toString()][code];
  }


  Future<String> _getTranslationFileForLanguage(String language) async {
    return await rootBundle.loadString('assets/languages/translations_$language');
  }

  Future<Map<String,dynamic>> _getJsonForTranslationFile(String language) async {
    var source = await _getTranslationFileForLanguage(language);
    return Future.value(json.decode(source));
  }
}