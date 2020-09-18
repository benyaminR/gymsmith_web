import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:gymsmith_web/injection_container.dart';
import 'package:gymsmith_web/pdp/PdpData.dart';
import 'package:gymsmith_web/pdp/pdp/pdp_bloc.dart';


class SelectSizeWidget extends StatelessWidget{
  final PdpData pdpData;

  const SelectSizeWidget({Key key,@required this.pdpData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _selectAnAvailableSize();
    return _createSizeSelectBoxes();
  }

  _createSizeSelectBox(String size,Function listener,bool isAvailable) => Padding(
    padding: const EdgeInsets.all(4.0),
    child: GestureDetector(
      onTap: isAvailable ? listener : ()=> print('this size is unavailable!'),
      child: Container(
        alignment: Alignment.center,
        width: 36,
        height: 36,
        child: isAvailable ?( size == pdpData.size ? Text(size,style: roboto16White,):Text(size,style: roboto16Black,)) : Text(size,style: roboto16White,),
        decoration: BoxDecoration(
          color: isAvailable ? (size == pdpData.size ? Black : White) : Grey_Light,
            border: Border.all(color: Black,width: 1)
        ),
      ),
    ),
  );

  _createSizeSelectBoxes(){
    var sizes = (pdpData.colors[pdpData.color] as Map<String,dynamic>);

    return Row(
      children: [
        for(var x = 0; x < sizes.length; x++)
          _createSizeSelectBox(sizes.keys.toList()[x], ()=>sl<PdpBloc>().add(ChangeSizeEvent(size: sizes.keys.toList()[x])),sizes[sizes.keys.toList()[x]])
      ],
    );
  }

  _selectAnAvailableSize(){
    if(!pdpData.isSizeAvailable())
      sl<PdpBloc>().add(ChangeSizeEvent(size: pdpData.getARandomAvailableSize()));
  }
}