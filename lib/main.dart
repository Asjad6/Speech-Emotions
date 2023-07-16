import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/Widgets/route_generator.dart';
import 'Widgets/settings.dart';
import 'Pages/MyHomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: navigatorkey,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
          radioTheme: RadioThemeData(
              fillColor:
                  MaterialStateColor.resolveWith((states) => Colors.purple))),
      home: MyHomePage(),
    );
  }
}
