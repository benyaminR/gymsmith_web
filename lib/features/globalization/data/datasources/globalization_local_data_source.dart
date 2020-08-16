import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/utils/translation/languages.dart';
import 'package:gymsmith_web/core/utils/translation/translator.dart';
import 'package:gymsmith_web/features/globalization/data/model/GlobalizedFieldModel.dart';

abstract class GlobalizationLocalDataSource{
  Future<GlobalizedFieldModel> translateField(String code, Language language);
}

class GlobalizationLocalDataSourceImpl implements GlobalizationLocalDataSource{
  final Translator translator;

  GlobalizationLocalDataSourceImpl({@required this.translator});


  @override
  Future<GlobalizedFieldModel> translateField(String code, Language language) async{
    var translation = await translator.translate(code, language);
    var globalizedFieldModel = GlobalizedFieldModel(value: translation);
    return Future.value(globalizedFieldModel);
  }

}