import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/common/color_extension.dart';
import 'package:fit/common_widget/round_button.dart';
import 'package:fit/view/home/online_home.dart';
import 'package:fit/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SquatsView extends StatefulWidget {
  const SquatsView({super.key});

  @override
  State<SquatsView> createState() => _SquatsViewState();
}

class _SquatsViewState extends State<SquatsView> {
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
                "images/squats_back.gif",
                height: media.width * 0.6,
                width: double.maxFinite,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Squats",
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Poppins", fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Medium | 200 calories",
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
                  "Squats are a fundamental lower body exercise that primarily targets the quadriceps, hamstrings, and glutes while engaging the core. To perform a bodyweight squat, stand with your feet shoulder-width apart, then lower yourself by bending your knees and pushing your hips back. Keep your back straight and return to the starting position by pushing through your heels. Squats are versatile and can be intensified with weights as needed.",
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
                  "You will need 30 minutes to complete it. After that press complete it button.",
                  style: TextStyle(
                      color: TColor.darkgray,
                      fontFamily: "Poppins",
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: RoundButton(
                    title: "Complete it",
                    onPressed: () {
                      _squat();
                      Fluttertoast.showToast(msg: "Good Job");
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  _squat() async {
    var db = FirebaseFirestore.instance;
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser?.displayName;
    final DocumentSnapshot snapshot =
        await db.collection('users').doc(user).get();

    var calorie = int.parse(snapshot['calorie']);

    db.collection('users').doc(user).update({"calorie": (calorie + 180).toString()});
  }
}
