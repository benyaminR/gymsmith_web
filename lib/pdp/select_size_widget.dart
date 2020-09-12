import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';

class SelectSizeWidget extends StatefulWidget{
  @override
  _SelectSizeWidgetState createState() => _SelectSizeWidgetState();
}

class _SelectSizeWidgetState extends State<SelectSizeWidget> {
  var sizes = ['S','M','L','XL'];
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return _createSizeSelectBoxes();
  }

  _createSizeSelectBox(size,listener) => Padding(
    padding: const EdgeInsets.all(4.0),
    child: GestureDetector(
      onTap: listener,
      child: Container(
        alignment: Alignment.center,
        width: 36,
        height: 36,
        child: size == sizes[selected] ? Text(size,style: roboto16White,):Text(size,style: roboto16Black,),
        decoration: BoxDecoration(
          color: size == sizes[selected] ? Black : White,
            border: Border.all(color: Black,width: 1)
        ),
      ),
    ),
  );

  _createSizeSelectBoxes(){
    return Row(
      children: [
        for(var x = 0; x < sizes.length; x++)
          _createSizeSelectBox(sizes[x], ()=>setState(()=>selected=x))
      ],
    );
  }
}