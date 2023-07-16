import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:senior_project/Pages/MyHomePage.dart';
import 'package:senior_project/Pages/existing.dart';
import 'package:senior_project/Pages/profile.dart';
import 'package:senior_project/Pages/register.dart';
import 'package:senior_project/Pages/s_choose.dart';

class RouteGenerator {
  static ValueNotifier currentRoute = ValueNotifier("");

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute.value = settings.name;

    switch (settings.name) {
      case "/Home":
        return PageTransition(
            child: MyHomePage(), type: PageTransitionType.rightToLeft);
      case "/s_choose":
        return PageTransition(
            child: Student_Choose(),
            type: PageTransitionType
                .rightToLeft); //Choosing which student you are
      case "/Register":
        return PageTransition(
            child: Register(), type: PageTransitionType.rightToLeft);
      case "/Existing":
        return PageTransition(
            child: Existing(), type: PageTransitionType.rightToLeft);
      case "/Profile":
        return PageTransition(
            child: Profile(), type: PageTransitionType.rightToLeft);

      default:
        return PageTransition(
            child: const Scaffold(
              body: Center(
                child: Text("Error in Navigation"),
              ),
            ),
            type: PageTransitionType.rightToLeft);
    }
  }
}
