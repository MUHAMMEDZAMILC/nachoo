


import 'package:flutter/material.dart';
import 'package:nachoo/common/colors.dart';

class PowerButton extends StatelessWidget {
  const PowerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
            right: 17,
            top: 245,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
               boxShadow: [BoxShadow(color: greycolor,offset: Offset(2,7),blurRadius: 10)],
                borderRadius:BorderRadius.circular(100) ,
               color: whitecolor
              ),
              child: Icon(Icons.power_settings_new,color: redcolor,),
            ),
          );
  }
}