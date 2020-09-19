import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';

class PDPCardBottomWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return _createPDPBottomSections();
  }
  _createPDPBottomSection(title,listener) => Padding(
    padding: const EdgeInsets.only(top: 20,bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: roboto28Grey,),
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.grey[500],
            size: 36,
          ),
          onPressed: listener,
        )
      ],
    ),
  );

  _createPDPBottomSections(){
    var items = ['Beschreibung','Lieferung und Retoure','Rezension'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.grey[300],
          height: 1,
        ),
        for(var i = 0; i < 3 ; i++)...{
          _createPDPBottomSection(items[i], ()=>print(items[i]+ ' clicked!')),
          Container(
            color: Colors.grey[300],
            height: 1,
          ),
        }
      ],
    );
  }

}