import 'package:fit/common/color_extension.dart';
import 'package:fit/common_widget/round_button.dart';
import 'package:fit/view/home/online_home.dart';
import 'package:fit/view/login/register.dart';
import 'package:fit/view/login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isCheck = false;

  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isSigningUp = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hey there,",
                  style: TextStyle(
                      color: TColor.gray, fontSize: 16, fontFamily: "Poppins"),
                ),
                Text(
                  "Create an Account",
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ),
                SizedBox(
                  height: media.width * 0.05,
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
                          controller: _firstNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name must not be empty!";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            focusedBorder: InputBorder.none,
                            hintText: "First Name",
                            prefixIcon: Image.asset("images/person.png"),
                            prefixIconColor: TColor.darkgray,
                            hintStyle: TextStyle(
                                color: TColor.darkgray,
                                fontSize: 18,
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
                          controller: _lastnameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Last name must not be empty!";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            focusedBorder: InputBorder.none,
                            hintText: "last Name",
                            prefixIcon: Image.asset("images/person.png"),
                            prefixIconColor: TColor.darkgray,
                            hintStyle: TextStyle(
                                color: TColor.darkgray,
                                fontSize: 18,
                                fontFamily: "Poppins"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email must not be empty";
                            } else if (!value.contains("@")) {
                              return "Please enter a valid email.";
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
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password must not be empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            focusedBorder: InputBorder.none,
                            hintText: "Password",
                            prefixIcon: Image.asset("images/lock.png"),
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
                SizedBox(
                  height: media.width * 0.04,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      icon: Icon(
                        isCheck
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        size: 30,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      "By continuing you accept our Privacy Policy and Term of Use.",
                      style: TextStyle(color: TColor.darkgray, fontSize: 13),
                    )),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.1,
                ),
                GestureDetector(
                  onTap: _signUp,
                  child: _isSigningUp == true
                      ? CircularProgressIndicator(
                          color: TColor.white,
                        )
                      : RoundButton(
                          title: "Register",
                          onPressed: () {
                            _signUp();
                          }),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.darkgray,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "Or",
                        style: TextStyle(
                            color: TColor.darkgray,
                            fontSize: 13,
                            fontFamily: "Poppins"),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.darkgray,
                      ),
                    )
                  ],
                ),
                TextButton(
                    onPressed: () {
                      print("object");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                              color: TColor.darkgray,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins"),
                        ),
                        GestureDetector(
                          onTap: _loginred,
                          child: Text(
                            " Login",
                            style: TextStyle(
                                color: TColor.primaryColor2,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSigningUp = true);
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser;

      try {
        await auth
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((value) async {
          await auth.currentUser?.updateDisplayName(
              "${_firstNameController.text} ${_lastnameController.text}");
          print(auth.currentUser?.displayName);
          setState(() => _isSigningUp = false);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterView()));
        });
      } on FirebaseAuthException catch (e) {
        setState(() => _isSigningUp = false);
        if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(msg: "Account already created. Please Login!");
        } else if (e.code == 'invalid-email') {
          Fluttertoast.showToast(
              msg: "Invalid email. Please check your email.");
        } else if (e.code == 'weak-password') {
          Fluttertoast.showToast(msg: "The password is not strong enough!");
        } else {
          Fluttertoast.showToast(msg: "Error: ${e.message}");
        }
      }
    } else {
      return null;
    }
  }

  _loginred() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LoginViewPage()));
  }
}
