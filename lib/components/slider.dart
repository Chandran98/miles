
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:milesed/bloc/bloc/dataBloc.dart';
import 'package:milesed/bloc/event/dataEvent.dart';
import 'package:milesed/model/homedataModel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CheckoutCourse extends StatefulWidget {
  Datum data;
   CheckoutCourse({ required this.data});


  @override
  _CheckoutCourseState createState() => _CheckoutCourseState();
}

class _CheckoutCourseState extends State<CheckoutCourse> {


  @override
  Widget build(BuildContext context) {
        final counterValue = context.watch<DataBloc>().state;

    return  
    
    
    
    
       CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {});
                  },
                  height: 14.4.h,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: widget.data.posts.map((data) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                        ),
                        child: Image.network(
                          data.files[0].imagePath.toString(),
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              );
  }
}
