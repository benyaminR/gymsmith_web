import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';

class SelectColorWidget extends StatefulWidget{

  @override
  _SelectColorWidgetState createState() => _SelectColorWidgetState();
}

class _SelectColorWidgetState extends State<SelectColorWidget> {
  var colors = [Colors.red,Colors.black,Colors.grey,Colors.white];

  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return _createColorSelectBoxes();
  }

  _createColorSelectBox(color,listener) => Padding(
    padding: const EdgeInsets.all(4.0),
    child: GestureDetector(
      onTap: listener,
      child: Container(
        alignment: Alignment.center,
        width: 36,
        height: 36,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Black,width: 1)
        ),
        child: color == colors[selected] ? Icon(Icons.cancel,size: 10,) : Container(),
      ),
    ),
  );

  _createColorSelectBoxes(){
    return Row(
      children: [
        for(var x = 0; x < colors.length; x++)
          _createColorSelectBox(colors[x], ()=>{setState(()=> selected = x)})
      ],
    );
  }
}