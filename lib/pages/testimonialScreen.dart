import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:milesed/bloc/bloc/dataBloc.dart';
import 'package:milesed/bloc/event/dataEvent.dart';
import 'package:milesed/bloc/state/dataState.dart';
import 'package:milesed/components/storyviewer.dart';
import 'package:milesed/constant/constant.dart';
import 'package:sizer/sizer.dart';

class TestimonialViewer extends StatefulWidget {
  const TestimonialViewer({Key? key}) : super(key: key);

  @override
  State<TestimonialViewer> createState() => _TestimonialViewerState();
}

class _TestimonialViewerState extends State<TestimonialViewer> {
  @override
  void initState() {
    super.initState();
    context.read<TestimonialDataBloc>().add(GetTestimonialData());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Afternoon",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 16.sp),
                  ),
                  Text(
                    "ashitay",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        _showBottomSheet(context);
                      },
                      child: Container(
                          height: 6.5.h,
                          width: 33.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.h),
                            color: Colors.indigo.shade900,
                          ),
                          child: Center(
                              child: Text(
                            "Talk to us!",
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ))),
                    )))
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        BlocBuilder<TestimonialDataBloc, DataState>(
          builder: (context, state) {
            if (state is TestimonialDataloading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is TestimonialDataloaded) {
              return SizedBox(
                height: 17.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.data.data.length,
                  itemBuilder: (context, index) {
                    var data = state.data.data[index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TestimonialStoryScreen(
                                      url: data.videoUrl,
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.red,
                                    Colors.green,
                                    Colors.purple,
                                    Colors.cyan
                                  ]),
                                  shape: BoxShape.circle),
                              child: CircleAvatar(
                                radius: 37,
                                backgroundImage: data.imageUrl == null
                                    ? AssetImage("assets/images/profile.jpg")
                                    : NetworkImage(
                                        '${data.imageUrl.toString().split('.png')[0]}.png'),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              data.firstName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 27.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    spacer50Height,
                    const Text(
                      'Thank you for showing interest in us!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    spacer5Height,
                    const Text(
                      'Our SPOC will be connecting with you shortly on your provided contact details.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Lottie.asset("assets/images/jk.json",
                width: MediaQuery.of(context).size.width * 60),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: EdgeInsets.only(right: 8.w, top: 5.h),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.close),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
