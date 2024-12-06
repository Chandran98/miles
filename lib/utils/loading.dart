import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 7, 10, 16),
            Color(0xff101623),
            Color(0xff2D3446),
          ])),
      child: Center(
        child: Lottie.asset("assets/images/plane2.json"),
      ),
    ));
  }
}
