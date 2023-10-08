import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/common/color_extension.dart';
import 'package:fit/common_widget/round_button.dart';
import 'package:fit/view/home/home_view.dart';
import 'package:fit/view/home/online_home.dart';
import 'package:fit/view/login/sign_up_view.dart';
import 'package:fit/view/profile/about_us.dart';
import 'package:fit/view/profile/personal_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var auth = FirebaseAuth.instance;
  var gender = "Male";
  var image = "images/user.png";
  var height = "172";
  var weight = "60";
  var age = "14";

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

    if (snapshot.exists) {
      // Data exists, you can access it using snapshot.data()
      if (!mounted) return;
      gender = snapshot['gender'];
      setState(() {
        weight = snapshot['weight'];
        height = snapshot['height'];
        age = snapshot['age'];
      });

      if (gender == 'male' || gender == "Male") {
        if (!mounted) return;
        setState(() {
          image = "images/male_profile_two.png";
        });
      } else if (gender == "female" || gender == "Female") {
        if (!mounted) return;
        setState(() {
          image = "images/user.png";
        });
      }
    } else {
      // Document doesn't exist
    }
  }

  @override
  Widget build(BuildContext context) {
    var name = auth.currentUser?.displayName;
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Center(
            child: Column(
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
                      Text(
                        "Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("images/about_us.png"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Transform.scale(
                        scale: 1.3,
                        child: Image.asset(
                          image,
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Lose fat program",
                          style: TextStyle(
                            color: TColor.darkgray,
                            fontFamily: "Poppins",
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 80,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              weight,
                              style: TextStyle(
                                  color: TColor.primaryColor1,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            ),
                            Text(
                              "Weight",
                              style: TextStyle(
                                  color: TColor.darkgray,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              height,
                              style: TextStyle(
                                  color: TColor.primaryColor1,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            ),
                            Text(
                              "Height",
                              style: TextStyle(
                                  color: TColor.darkgray,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              age,
                              style: TextStyle(
                                  color: TColor.primaryColor1,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            ),
                            Text(
                              "Age",
                              style: TextStyle(
                                  color: TColor.darkgray,
                                  fontFamily: "Poppins",
                                  fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: media.width * 0.7,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Account",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Transform.scale(
                                  scale: 1.3,
                                  child: Image.asset(
                                    "images/blue_user.png",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PersonalData()));
                                  },
                                  child: Text("Personal Data",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Poppins",
                                          fontSize: 16)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PersonalData()));
                                    },
                                    icon: Icon(Icons.navigate_next)),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Transform.scale(
                                  scale: 1.3,
                                  child: Image.asset(
                                    "images/blue_user.png",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AboutUs()));
                                  },
                                  child: Text("About Us",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Poppins",
                                          fontSize: 16)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AboutUs()));
                                    },
                                    icon: Icon(Icons.navigate_next)),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Transform.scale(
                                  scale: 1.3,
                                  child: Image.asset(
                                    "images/blue_user.png",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpView()));
                                  },
                                  child: Text("Logout",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Poppins",
                                          fontSize: 16)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: IconButton(
                                    onPressed: () {
                                      Fluttertoast.showToast(msg: "Logged out");
                                      _logout();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignUpView()));
                                    },
                                    icon: Icon(Icons.navigate_next)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _logout() async {
    var auth = FirebaseAuth.instance;
    await auth.signOut();
  }
}
