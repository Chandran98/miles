import 'package:flutter/material.dart';

class Tasksscreen extends StatelessWidget {
  const Tasksscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container( decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromARGB(255, 7, 10, 16),
                  Color(0xff101623),
                  // Color(0xff2D3446),
                  Color(0xff27313B),
                ])),
        child: Center(
          child: Text("Task"),
        ),
      ),
    );
  }
}


class Trendingscreen extends StatelessWidget {
  const Trendingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container( decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromARGB(255, 7, 10, 16),
                  Color(0xff101623),
                  // Color(0xff2D3446),
                  Color(0xff27313B),
                ])),
        child: Center(
          child: Text("Trending"),
        ),
      ),
    );
  }
}


class Videosscreen extends StatelessWidget {
  const Videosscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container( decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromARGB(255, 7, 10, 16),
                  Color(0xff101623),
                  // Color(0xff2D3446),
                  Color(0xff27313B),
                ])),
        child: Center(
          child: Text("Videos"),
        ),
      ),
    );
  }
}
