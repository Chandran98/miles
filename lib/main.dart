import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milesed/bloc/bloc/dataBloc.dart';
import 'package:milesed/constant/constant.dart';
import 'package:milesed/pages/MainDashboard.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => DataBloc(),
      ),
      BlocProvider(
        create: (context) => TestimonialDataBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: dark,
        debugShowCheckedModeBanner: false,
        home: MainDashboard(),
      );
    });
  }
}
