import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  Widget child;
  BackgroundGradient({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.7,0.95],
          colors: [Colors.purpleAccent.withOpacity(0.75) , Colors.lightBlueAccent.withOpacity(0.75)]
        )
      ),
    );
  }
}
