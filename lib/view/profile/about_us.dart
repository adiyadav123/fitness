import 'package:fit/common/color_extension.dart';
import 'package:fit/view/home/online_home.dart';
import 'package:fit/view/profile/profile_view.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.black,
      body: SingleChildScrollView(
        child: SafeArea(
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
                                builder: (context) => ProfileView()));
                      },
                      icon: Image.asset("images/before_nav.png"),
                    ),
                    Text(
                      "About Us",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnlineHomePageView()));
                      },
                      icon: Image.asset("images/about_us.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset("images/about_us_two.png"),
              SizedBox(
                height: 20,
              ),
              Text(
                "Backend by - Aditya Yadav",
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontFamily: "Poppins"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "School - Seth Anandram Jaipuria School, Tarna, Varanasi",
                  style: TextStyle(
                      color: Colors.white, fontSize: 18, fontFamily: "Poppins"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
