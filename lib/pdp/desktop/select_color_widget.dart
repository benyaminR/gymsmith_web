import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/injection_container.dart';
import 'package:gymsmith_web/pdp/PdpData.dart';
import 'package:gymsmith_web/pdp/pdp/pdp_bloc.dart';

class SelectColorWidget extends StatelessWidget {
  final PdpData pdpData;

  const SelectColorWidget({Key key,@required this.pdpData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _createColorSelectBoxes();
  }
  _createColorSelectBox(Color color,Function listener) => Padding(
    padding: const EdgeInsets.all(4.0),
    child: GestureDetector(
      onTap:listener,
      child: Container(
        alignment: Alignment.center,
        width: 36,
        height: 36,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Black,width: 1)
        ),
        child: color == convertColorStringToColor(pdpData.color) ? Icon(Icons.check,size: 36,color: Colors.black54,) : Container(),
      ),
    ),
  );

  _createColorSelectBoxes(){
    var colors = convertColorStringsToColors(pdpData.colors.keys.toList());

    return Row(
      children: [
        for(var x = 0; x < colors.length; x++)
            _createColorSelectBox(
                colors[x],
                ()=> sl<PdpBloc>().add(ChangeColorEvent(color: convertColorToColorString(colors[x]))),
            )
      ],
    );
  }


  List<Color> convertColorStringsToColors(List<String> colorStrings){
    return colorStrings.map((e) => convertColorStringToColor(e)).toList();
  }

/*  bool _isThisColorAvailable(Color color){
    var colorString = convertColorToColorString(color);
    return (pdpData.colors[colorString] as Map<String,dynamic>).length != 0;
  }*/

  Color convertColorStringToColor(String color){
    if(color == 'red')
      return Colors.red;
    if(color == 'blue')
      return Colors.blue;
    if(color == 'white')
      return Colors.white;
    if(color == 'black')
      return Colors.black;
    if(color == 'grey')
      return Colors.grey;
    print('Color Not Found!');
    return Colors.yellow;
  }

  String convertColorToColorString(Color color){
    if(color == Colors.red)
      return 'red';
    if(color == Colors.blue)
      return 'blue';
    if(color == Colors.white)
      return 'white';
    if(color == Colors.black)
      return 'black';
    if(color == Colors.grey)
      return 'grey';
    print('Color Not Found!');
    return 'black';
  }
}