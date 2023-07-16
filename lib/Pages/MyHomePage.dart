import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:senior_project/Pages/s_choose.dart';
import 'package:senior_project/Widgets/BackgroundGradient.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  Text(
                    "EVOT",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      expands: false,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "ID",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 17),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(22))),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                      expands: false,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Password",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 17),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(22))),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(horizontal: 123),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/s_choose");
                    },
                  ),
                ],
              )),
        ),
      ),
    ));
  }
}
