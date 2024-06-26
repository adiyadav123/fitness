import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/common/color_extension.dart';
import 'package:fit/common_widget/round_button.dart';
import 'package:fit/view/home/home_view.dart';
import 'package:fit/view/home/online_home.dart';
import 'package:fit/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JumpingJackView extends StatefulWidget {
  const JumpingJackView({super.key});

  @override
  State<JumpingJackView> createState() => _JumpingJackViewState();
}

class _JumpingJackViewState extends State<JumpingJackView> {
  var cal = 0;
  var time = 0;
  var btn_text = "Start";
  var _isBtnClicked = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser?.displayName;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final DocumentSnapshot snapshot =
        await firestore.collection('users').doc(user).get();

    if (snapshot['calorie'] == null) {
      firestore.collection('users').doc(user).set({
        'calorie': '1',
      }, SetOptions(merge: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnlineHomePageView()));
                      },
                      icon: Image.asset("images/before_nav.png"),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileView()));
                      },
                      icon: Image.asset("images/about_us.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset(
                "images/jumping_jack_back.gif",
                height: media.width * 0.6,
                width: double.maxFinite,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Jumping Jack",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Poppins", fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Easy | 180 calories | 20 minutes",
                  style: TextStyle(
                      color: TColor.darkgray,
                      fontFamily: "Poppins",
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Poppins", fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide",
                  style: TextStyle(
                      color: TColor.darkgray,
                      fontFamily: "Poppins",
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "You will need 20 minutes to complete it. After that press complete it button.",
                  style: TextStyle(
                      color: TColor.darkgray,
                      fontFamily: "Poppins",
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Time: ${(time / 60).toStringAsFixed(2)} minutes",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Poppins", fontSize: 20),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: RoundButton(
                    title: btn_text,
                    onPressed: () {
                      Fluttertoast.showToast(msg: "Exercise Started");
                      _startTimer();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  _startTimer() {
    if (_isBtnClicked) {
      setState(() {
        btn_text = "Start";
        _isBtnClicked = false;
      });
      _calorie(time);
      time = 0;
    } else {
      setState(() {
        btn_text = "Complete";
        _isBtnClicked = true;
      });
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          time++;
        });
      });
    }
  }

  _calorie(timee) async {
    var db = FirebaseFirestore.instance;
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser?.displayName;
    final DocumentSnapshot snapshot =
        await db.collection('users').doc(user).get();
    var calorie = int.parse(snapshot['calorie']);

    db
        .collection('users')
        .doc(user)
        .update({"calorie": (calorie + 180).toString()});
  }
}
