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
        child: size == pdpData.size ? Text(size,style: roboto16White,):Text(size,style: roboto16Black,),
        decoration: BoxDecoration(
          color: size == pdpData.size ? Black : White,
            border: Border.all(color: Black,width: 1)
        ),
      ),
    ),
  );

  _createSizeSelectBoxes(){
    var sizes = (pdpData.colors[pdpData.color] as List<dynamic>).map((e) => e.toString()).toList();

    return Row(
      children: [
        for(var x = 0; x < sizes.length; x++)
          _createSizeSelectBox(sizes[x], ()=>sl<PdpBloc>().add(ChangeSizeEvent(size: sizes[x])))
      ],
    );
  }
}