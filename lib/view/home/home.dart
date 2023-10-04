import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/common/color_extension.dart';
import 'package:fit/view/on_boarding/started.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

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
        setState(() {
          message = "You are logged in. \n Currently we are developing the homepage.";
          return;
        });
      }
    });
    return Scaffold(
      backgroundColor: TColor.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style:
              TextStyle(
                color: TColor.white,
                fontSize: 20,
                fontFamily: "Poppins"
              ),),
            SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: (){
                FirebaseAuth.instance.signOut().then((value) {
                  print("Logged out!");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StartedView()));
                });
              },
              icon: Icon(Icons.logout_outlined, color: TColor.white,),

            )
          ],
        ),
      ),
    );
  }
}
