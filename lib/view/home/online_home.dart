import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit/common/color_extension.dart';
import 'package:fit/view/exercise/exercise_view.dart';
import 'package:fit/view/home/home_view.dart';
import 'package:fit/view/login/sign_up_view.dart';
import 'package:fit/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OnlineHomePageView extends StatefulWidget {
  const OnlineHomePageView({super.key});

  @override
  State<OnlineHomePageView> createState() => _OnlineHomePageViewState();
}

class _OnlineHomePageViewState extends State<OnlineHomePageView> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  var auth = FirebaseAuth.instance;
  bool _isHomeActive = true;
  bool _isExerciseActive = true;
  bool _isProfileActive = true;

  Widget currentTab = HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: currentTab,
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: TColor.black),
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    if (_isHomeActive == true) {
                      if (mounted) {
                        setState(() {
                          currentTab = HomeView();
                          _isHomeActive = false;
                          _isExerciseActive = true;
                          _isProfileActive = true;
                        });
                      } else {
                        return;
                      }
                    } else {
                      if (mounted) {
                        setState(() {
                          _isHomeActive = true;
                        });
                      } else {
                        return;
                      }
                    }
                  },
                  icon: Image.asset(
                    _isHomeActive
                        ? "images/home.png"
                        : "images/home_active.png",
                    height: 25,
                    width: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_isExerciseActive == true) {
                      if (mounted) {
                        setState(() {
                          currentTab = ExerciseView();
                          _isExerciseActive = false;
                          _isHomeActive = true;
                          _isProfileActive = true;
                        });
                      } else {
                        return;
                      }
                    } else {
                      if (mounted) {
                        setState(() {
                          _isExerciseActive = true;
                        });
                      } else {
                        return;
                      }
                    }
                  },
                  icon: Image.asset(
                    _isExerciseActive
                        ? "images/exercise.png"
                        : "images/exercise_active.png",
                  ),
                ),
                Transform.scale(
                  scale: 1.2,
                  child: IconButton(
                    onPressed: () {
                      if (_isProfileActive == true) {
                        if (mounted) {
                          setState(() {
                            currentTab = ProfileView();
                            _isProfileActive = false;
                            _isExerciseActive = true;
                            _isHomeActive = true;
                          });
                        } else {
                          return;
                        }
                      } else {
                        if (mounted) {
                          setState(() {
                            _isProfileActive = true;
                          });
                        } else {
                          return;
                        }
                      }
                    },
                    icon: Image.asset(
                      _isProfileActive
                          ? "images/profile.png"
                          : "images/profile_active.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
