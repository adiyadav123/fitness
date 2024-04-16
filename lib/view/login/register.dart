import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/common/color_extension.dart';
import 'package:fit/common_widget/round_button.dart';
import 'package:fit/view/home/online_home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("images/details.png"),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  "Let’s complete your profile",
                  style: TextStyle(
                      color: TColor.white, fontSize: 27, fontFamily: "Poppins"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  "It will help us to know more about you!",
                  style: TextStyle(
                      color: TColor.darkgray,
                      fontSize: 15,
                      fontFamily: "Poppins"),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Form(
                key: _formKey,
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: _genderController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Gender must not be empty!";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            focusedBorder: InputBorder.none,
                            hintText: "Gender",
                            prefixIcon: Icon(Icons.person_4_outlined),
                            prefixIconColor: TColor.darkgray,
                            hintStyle: TextStyle(
                                color: TColor.darkgray,
                                fontSize: 16,
                                fontFamily: "Poppins"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: _dateOfBirthController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Age must not be empty!";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            focusedBorder: InputBorder.none,
                            hintText: "Age in years",
                            prefixIcon: Icon(Icons.calendar_month_outlined),
                            prefixIconColor: TColor.darkgray,
                            hintStyle: TextStyle(
                                color: TColor.darkgray,
                                fontSize: 16,
                                fontFamily: "Poppins"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: _weightController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Weight must not be empty!";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            focusedBorder: InputBorder.none,
                            hintText: "Your Weight in Kg",
                            prefixIcon: Image.asset("images/weight.png"),
                            prefixIconColor: TColor.darkgray,
                            hintStyle: TextStyle(
                                color: TColor.darkgray,
                                fontSize: 16,
                                fontFamily: "Poppins"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: _heightController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Height must not be empty!";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            focusedBorder: InputBorder.none,
                            hintText: "Your Height in CM",
                            prefixIcon: Icon(Icons.height_outlined),
                            prefixIconColor: TColor.darkgray,
                            hintStyle: TextStyle(
                                color: TColor.darkgray,
                                fontSize: 16,
                                fontFamily: "Poppins"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: _welcome,
                        child: _isCompleted == true
                            ? CircularProgressIndicator(
                                color: TColor.white,
                              )
                            : RoundButton(
                                title: "Register",
                                onPressed: () {
                                  _welcome();
                                }),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _welcome() async {
    var db = FirebaseFirestore.instance;
    var auth = FirebaseAuth.instance.currentUser;
    var eml = auth?.email;
    var name = auth?.displayName;
    var height = int.parse(_heightController.text) / 100;
    var heightSq = pow(height, 2);
    var we = int.parse(_weightController.text);
    var bmi = (we / heightSq).toStringAsFixed(2);

    if (_formKey.currentState!.validate()) {
      setState(() {
        _isCompleted = true;
      });
      final users = <String, dynamic>{
        "email": eml,
        "name": name,
        "age": _dateOfBirthController.text,
        "height": _heightController.text,
        "weight": _weightController.text,
        "gender": _genderController.text,
        "bmi": bmi,
        "calorie": "0"
      };

      try {
        db.collection("users").doc("${name}").set(users)
          ..onError((e, _) => print("Error writing document: $e"));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OnlineHomePageView()));
      } on FirebaseException catch (e) {
        Fluttertoast.showToast(msg: "Error: ${e.message}");
      }
    }
  }
}
