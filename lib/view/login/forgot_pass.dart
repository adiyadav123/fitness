import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/common/color_extension.dart';
import 'package:fit/common_widget/round_button.dart';
import 'package:fit/view/login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassView extends StatefulWidget {
  const ForgotPassView({Key? key}) : super(key: key);

  @override
  State<ForgotPassView> createState() => _ForgotPassViewState();
}

class _ForgotPassViewState extends State<ForgotPassView> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  bool _forgoting = false;

  FutureOr Function()? get doStuffCallback => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 58.0, horizontal: 10),
        child: Center(
          child: Column(
            children: [
              Text(
                "Reset Your Password",
                style: TextStyle(
                    color: TColor.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins"),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email must not be empty!";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          focusedBorder: InputBorder.none,
                          hintText: "Email",
                          prefixIcon: Image.asset("images/message_mail.png"),
                          prefixIconColor: TColor.darkgray,
                          hintStyle: TextStyle(
                              color: TColor.darkgray,
                              fontSize: 18,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 160,
              ),
              GestureDetector(
                onTap: _forgotEmail,
                child: _forgoting == true
                    ? CircularProgressIndicator(
                        color: TColor.white,
                      )
                    : RoundButton(
                        title: "Send Email",
                        onPressed: () {
                          _forgotEmail();
                          print("pressed");
                        }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _forgotEmail() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text);

        setState(() {
          _forgoting = false;
        });

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginViewPage(),
            ));
      } on FirebaseException catch (e) {
        setState(() {
          _forgoting = false;
        });
        Fluttertoast.showToast(msg: "Error: ${e.message}");
      }
    }
  }
}