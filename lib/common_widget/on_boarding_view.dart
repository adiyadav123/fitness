import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../common/color_extension.dart';

class OnBoardingPage extends StatelessWidget {
  final Map pObj;
  const OnBoardingPage({super.key, required this.pObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
      SizedBox(
      width: media.width,
      height: media.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(pObj["image"].toString(),
            width: media .width, fit: BoxFit.fitWidth,),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child:  Text(pObj["title"].toString(), style:
            TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
            ),

          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(pObj["desc"].toString(),
              style: TextStyle(
                color: TColor.darkgray,
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
      ],
    );
  }
}
