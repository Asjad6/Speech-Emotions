// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:senior_project/Pages/MyHomePage.dart';
import 'package:senior_project/Widgets/BackgroundGradient.dart';

class Student_Choose extends StatefulWidget {
  @override
  State<Student_Choose> createState() => _Student_ChooseState();
}

class _Student_ChooseState extends State<Student_Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundGradient(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Text(
                    "EVOT",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 8),
                  OutlineGradientButton(
                    child: Text(
                      "New Student",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 65, vertical: 25),
                    gradient: LinearGradient(
                      colors: [Colors.indigo, Colors.blueAccent],
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight,
                    ),
                    strokeWidth: 4,
                    backgroundColor: Colors.blue,
                    corners: Corners(
                        topRight: Radius.elliptical(150, 150),
                        bottomRight: Radius.elliptical(150, 150)),
                    onTap: () {
                      Navigator.of(context).pushNamed("/Register");
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4.5,
                  ),
                  OutlineGradientButton(
                    child: Text(
                      "Already Registered",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                    gradient: LinearGradient(
                      colors: [Colors.indigo, Colors.blueAccent],
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight,
                    ),
                    strokeWidth: 4,
                    backgroundColor: Colors.blue,
                    corners: Corners(
                        topRight: Radius.elliptical(150, 150),
                        bottomRight: Radius.elliptical(150, 150)),
                    onTap: () {
                      Navigator.of(context).pushNamed("/Existing");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
