import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/common/color_extension.dart';
import 'package:fit/view/on_boarding/on_boarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartedView extends StatefulWidget {
  const StartedView({Key? key}) : super(key: key);

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.black,
      body: Container(
        width: media.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text("FitnessX",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 45,
                  fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Unlock your potential.",
                  style: TextStyle(
                      color: TColor.gray,
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),
                ),
                const Spacer(),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child:  MaterialButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      const OnBoardingView()));
                    },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      textColor: TColor.white,
                      height: 50,
                      minWidth: double.maxFinite,
                      color: TColor.primaryColor1,
                      child: const Text("Get Started",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  )
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
