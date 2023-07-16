import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:senior_project/Pages/profile.dart';
import 'package:senior_project/Widgets/BackgroundGradient.dart';

enum gender { male, female }

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  gender? _gender;
  CollectionReference userEntry =
      FirebaseFirestore.instance.collection('students');

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
                  SizedBox(height: MediaQuery.of(context).size.height / 27),
                  Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 27,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Name of the Student:",
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: TextField(
                        expands: false,
                        controller: name,
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
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Student ID:",
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: TextField(
                        controller: id,
                        expands: false,
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Gender:",
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: (RadioListTile<gender>(
                        value: gender.male,
                        groupValue: _gender,
                        title: Text(
                          "Male",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _gender = val;
                          });
                        })),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RadioListTile<gender>(
                        value: gender.female,
                        groupValue: _gender,
                        title: Text("Female",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        onChanged: (val) {
                          setState(() {
                            _gender = val;
                          });
                        }),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Age:",
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: TextField(
                        controller: age,
                        expands: false,
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
                  SizedBox(
                    height: 50,
                  ),
                  OutlineGradientButton(
                    padding: EdgeInsets.symmetric(horizontal: 85, vertical: 25),
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
                      if (_gender.toString().isEmpty ||
                          id.text.isEmpty ||
                          name.text.isEmpty ||
                          age.text.isEmpty) {
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
                        userEntry.doc().set({
                          'Name': name.text,
                          'ID': id.text,
                          'Gender': _gender == gender.male ? "Male" : "Female",
                          'Age': age.text,
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(
                                      age: age.text,
                                      id: id.text,
                                      name: name.text,
                                    )));
                      }
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
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
