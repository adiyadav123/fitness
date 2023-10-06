import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/common/color_extension.dart';
import 'package:fit/view/on_boarding/started.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfflineHomePageView extends StatefulWidget {
  const OfflineHomePageView({Key? key}) : super(key: key);

  @override
  State<OfflineHomePageView> createState() => _OfflineHomePageViewState();
}

class _OfflineHomePageViewState extends State<OfflineHomePageView> {

   String message = "";


  @override
  Widget build(BuildContext context) {



    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        setState(() {
          message = "You are not logged in. \n Currently we are developing the homepage.";
        });
        print('User is currently signed out!');
        return;

      } else {
        setState(() async {
          message = "Welcome ${user.displayName}\nYour email-${user.email}\nThis page is currently under development. Come back later :)\nClick the button below to logout.";
          return;
        });
      }
    });
    return Scaffold(
      backgroundColor: TColor.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
        child: SafeArea(
          child: Column(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text("Hey there,",
                       style: TextStyle(
                           color: TColor.white,
                           fontFamily: "Poppins",
                           fontSize: 12
                       ),),
                     Text("Welcome back,",
                       style: TextStyle(
                           color: TColor.white,
                           fontFamily: "Poppins",
                           fontSize: 20
                       ),),
                   ],
                 ),
                 SizedBox(
                   width: 100,
                 ),
                 Transform.scale(
                   scale: 1.2,
                   child: IconButton(
                     onPressed: (){
                       print("pressed");
                     },
                     icon: Icon(Icons.notification_important, color: TColor.white,),
                   ),
                 )
               ],
             ),
           ],
          ),
        ),
      ),
    );
  }
}
