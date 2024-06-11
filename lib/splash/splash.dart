import 'dart:async';

import 'package:bmi_calculator/colors.dart';
import 'package:bmi_calculator/firebase/firebase_servies.dart';
import 'package:bmi_calculator/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
   void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      body: Stack(
        children: [
          const Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        'BMI Calculator',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: kwhite,
                            fontSize: 30,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 30,),
                     Center(
                      child: Text(
                        'Developed by Farhan',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: kwhite,
                            fontSize: 15,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              left: 220,
              bottom: 650,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 4, 4, 4).withOpacity(0.9),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(5, 5), // Offset
                    ),
                  ],
                  shape: BoxShape.circle, // Shape as circle
                ),
                child: Container(
                  width: 230,
                  height: 230,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(14, 11, 7, 93).withOpacity(0.9),
                  ),
                ),
              )),
          Positioned(
              right: 300,
              bottom: 700,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 23, 23, 23).withOpacity(0.9),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(5, 5), // Offset
                    ),
                  ],
                  shape: BoxShape.circle, // Shape as circle
                ),
                child: Container(
                  width: 230,
                  height: 230,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(14, 11, 7, 93).withOpacity(0.9),
                  ),
                ),
              )),
                  Positioned(
              right: 10,
              bottom: 10,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 31, 31, 31).withOpacity(0.9),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(5, 5), // Offset
                    ),
                  ],
                  shape: BoxShape.circle, // Shape as circle
                ),
                child: Container(
                  width: 230,
                  height: 230,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(14, 11, 7, 93).withOpacity(0.9),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
