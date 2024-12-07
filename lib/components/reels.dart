import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milesed/bloc/state/dataState.dart';
import 'package:milesed/constant/constant.dart';
import 'package:sizer/sizer.dart';

import '../bloc/bloc/dataBloc.dart';

class ReelsComponent extends StatefulWidget {
  const ReelsComponent({super.key});

  @override
  State<ReelsComponent> createState() => _ReelsComponentState();
}

class _ReelsComponentState extends State<ReelsComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacer10Height,
        Text(
          "The Global Accountant",
          style:
              GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical:4.h),
          child: BlocBuilder<DataBloc, DataState>(
            builder: (context, orderState) {
              if (orderState is HomeDataloading) {
                return const Center(child: CircularProgressIndicator());
              } else if (orderState is HomeDataloaded) {
                return GridView.builder(
                  shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
          
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    crossAxisSpacing: 10, 
                    mainAxisSpacing: 10, 
                    childAspectRatio: 0.65, 
                  ),
                  itemCount: orderState
                      .data.data[1].posts.length, 
                  itemBuilder: (context, index) {
                    var data = orderState.data.data[1].posts[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50.w,
                        height: 120.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                '${data.files[0].thumbnail.toString().split('.png')[0]}.png',
                              ),
                            )),
                      ),
                    );
                  },
                );
              } else if (orderState is HomeDataError) {
                return Center(child: Text("Error: ${orderState.err}"));
              } else {
                return Container(); // Default case
              }
            },
          ),
        ),
      ],
    );
  }
}
