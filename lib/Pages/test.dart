import 'package:flutter/material.dart';

enum gender {male, female}

class test extends StatefulWidget {

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  gender? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RadioListTile <gender>(
                    value: gender.male,
                    groupValue: _gender,
                    title: Text("Male"),
                    onChanged: (val) {
                      setState(() {
                        _gender = val;
                      });
                    }
                    ),
                RadioListTile <gender>(
                    value: gender.female,
                    groupValue: _gender,
                    title: Text("Female"),
                    onChanged: (val){
                      setState((){
                        _gender = val;
                      });
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
