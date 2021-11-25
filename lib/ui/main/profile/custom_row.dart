import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRow  extends StatelessWidget {
  const  CustomRow({Key? key, required this.icon,required this.text, required this.arrowIcon}) : super(key: key);
 final Icon icon ;
 final Text text ;
 final  Icon arrowIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         icon,
         SizedBox(
           width: 26,
         ),
         text,
         Spacer(),
         arrowIcon,

       ],
      ),
    );
  }
}
