import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';

class SelectSizeWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return _createSizeSelectBoxes();
  }

  _createSizeSelectBox(color,listener) => Padding(
    padding: const EdgeInsets.all(4.0),
    child: GestureDetector(
      onTap: listener,
      child: Container(
        alignment: Alignment.center,
        width: 36,
        height: 36,
        child: Text(color,style: roboto16Black,),
        decoration: BoxDecoration(
            border: Border.all(color: Black,width: 1)
        ),
      ),
    ),
  );

  _createSizeSelectBoxes(){
    var sizes = ['S','M','L','XL'];
    return Row(
      children: [
        for(var x = 0; x < sizes.length; x++)
          _createSizeSelectBox(sizes[x], ()=>print(sizes[x].toString() + ' selected!'))
      ],
    );
  }

}