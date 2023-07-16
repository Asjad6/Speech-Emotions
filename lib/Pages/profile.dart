import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:senior_project/Widgets/BackgroundGradient.dart';

class Profile extends StatefulWidget {
  String? id;
  String? name;
  String? age;
  Profile({super.key, this.age, this.id, this.name});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  getResponse() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.18.53:5000/predict'));
    var multiPartData = http.MultipartFile.fromBytes(
      'file',
      (await rootBundle.load('assets/test.wav')).buffer.asInt8List(),
      filename: 'test.wav',
    );
    request.files.add(multiPartData);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final extractedData = json.decode(await response.stream.bytesToString());
      log(extractedData['emotion'].toString());
    } else {
      log(response.reasonPhrase.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
                    "Student Profile",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Student Name: ${widget.name}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Student ID: ${widget.id}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Student Age: ${widget.age}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "History Recordings: ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          createElevatedButton(
                            icon: Icons.mic,
                            iconColor: Colors.red,
                            onPressFunc: startRecording,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          createElevatedButton(
                            icon: Icons.stop,
                            iconColor: Colors.red,
                            onPressFunc: stopRecording,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(horizontal: 123),
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      "NEXT",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/Home");
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

  ElevatedButton createElevatedButton(
      {IconData? icon, Color? iconColor, void Function()? onPressFunc}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(6.0),
        side: BorderSide(
          color: Colors.red,
          width: 4.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        primary: Colors.white,
        elevation: 9.0,
      ),
      onPressed: onPressFunc,
      icon: Icon(
        icon,
        color: iconColor,
        size: 38.0,
      ),
      label: Text(''),
    );
  }

  Future<void> startRecording() async {}

  Future<String?> stopRecording() async {}
}
