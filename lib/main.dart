import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milesed/bloc/bloc/dataBloc.dart';
import 'package:milesed/components/navbar.dart';
import 'package:milesed/constant/constant.dart';
import 'package:sizer/sizer.dart';
import 'package:milesed/pages/home.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => DataBloc(),
      ), BlocProvider(
        create: (context) => TestimonialDataBloc(),
      ),
      
    ],
    child:  MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: dark,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        // home: HomeScreen(),
      );
    });
  }
}
