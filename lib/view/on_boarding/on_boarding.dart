import 'package:fit/common_widget/on_boarding_view.dart';
import 'package:fit/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {




  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;
    });
  }

  List pageList = [
    {
      "title":"Track Your Goal",
      "desc":"Track your fitness goals easily with our app. Stay motivated, make informed choices, and reach your desired destination.",
      "image":"images/on_1.png",
    },
    {
      "title":"Get Burn",
      "desc":"Let’s keep burning, to achieve yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
      "image":"images/on_2.png",
    },
    {
      "title":"Eat Well",
      "desc":"Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
      "image":"images/on_3.png",
    },
    {
      "title":"Improve Sleep  Quality",
      "desc":"Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
      "image":"images/on_4.png",
    },
  ];



  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.black,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            itemCount: pageList.length,
            controller: controller,
              itemBuilder: (context, index){
                var pObj = pageList[index] as Map? ?? {};
            return  OnBoardingPage(pObj: pObj,);
          }),

          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width:70,
                  child: CircularProgressIndicator(
                    color: TColor.primaryColor1,
                    value: (selectPage + 1) / 4,
                    strokeWidth: 2 ,
                  ),
                ),

                Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  decoration: BoxDecoration(
                    color: TColor.primaryColor1,
                    borderRadius: BorderRadius.circular(45)
                  ),
                  child: IconButton(
                    icon: Icon(Icons.navigate_next, color: TColor.white,) ,
                    onPressed: (){

                      if(selectPage < 3){
                        selectPage++;

                        controller.animateToPage(selectPage, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                        // controller.jumpToPage(selectPage);


                        setState(() {

                        });
                      }else{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView()));
                      }
                    },
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}
