import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milesed/bloc/state/dataState.dart';
import 'package:milesed/constant/constant.dart';
import 'package:sizer/sizer.dart';

import '../bloc/bloc/dataBloc.dart';

/// Our program

class OurProgramComponent extends StatefulWidget {
  const OurProgramComponent({super.key});

  @override
  State<OurProgramComponent> createState() => _OurProgramComponentState();
}

class _OurProgramComponentState extends State<OurProgramComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacer30Height,
        Text(
          "Our Programs",
          style:
              GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        spacer20Height,
        SizedBox(
          height: 50.h,
          child: BlocBuilder<DataBloc, DataState>(
            builder: (context, orderState) {
              if (orderState is HomeDataloading) {
                return const Center(child: CircularProgressIndicator());
              } else if (orderState is HomeDataloaded) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: orderState.data.data[5].posts.length,
                    itemBuilder: (context, index) {
                      var data = orderState.data.data[5].posts[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: NetworkImage(
                                      data.files[0].imagePath.toString()))),
                        ),
                      );
                    },
                  ),
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
