// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/Pages/profile.dart';
import 'package:senior_project/Widgets/BackgroundGradient.dart';
import 'package:http/http.dart' as http;

class Existing extends StatefulWidget {
  const Existing({super.key});

  @override
  State<Existing> createState() => _ExistingState();
}

class _ExistingState extends State<Existing> {
  get isChecked => null;
  bool userFound = true;
  TextEditingController id = TextEditingController();

  

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
                  SizedBox(
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Student ID:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                        expands: false,
                        controller: id,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(22))),
                      ),
                    ),
                  ),
                  SizedBox(height: 215),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(horizontal: 123),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      "NEXT",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () async {
                      if (id.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.white,
                          behavior: SnackBarBehavior.floating,
                          padding: EdgeInsets.all(16.0),
                          content: Text(
                            "Ooops!! Enter Full Data",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                          duration: Duration(milliseconds: 1000),
                        ));
                      } else {
                        QuerySnapshot querySnapshotUser =
                            await FirebaseFirestore.instance
                                .collection("students")
                                .get();
                        for (int i = 0;
                            i < querySnapshotUser.docs.length;
                            i++) {
                          var a = querySnapshotUser.docs[i];
                          var dataSaved = a.data() as Map<String, dynamic>;
                          if (id.text == dataSaved['ID']) {
                            setState(() {
                              userFound = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(
                                  age: dataSaved['Age'],
                                  id: id.text,
                                  name: dataSaved['Name'],
                                ),
                              ),
                            );
                          }
                        }
                      }
                      if (userFound) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.white,
                          behavior: SnackBarBehavior.floating,
                          padding: EdgeInsets.all(16.0),
                          content: Text(
                            "Ooops!! Student Not Found",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                          duration: Duration(milliseconds: 1000),
                        ));
                      }
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
