import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milesed/bloc/bloc/dataBloc.dart';
import 'package:milesed/bloc/event/dataEvent.dart';
import 'package:milesed/bloc/state/dataState.dart';
import 'package:milesed/components/storyviewer.dart';
import 'package:milesed/constant/constant.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<DataBloc>().add(GetHomeData());
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataBloc>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(FontAwesomeIcons.bars),
          backgroundColor: const Color.fromARGB(255, 7, 10, 16),
          title: Image.asset(
            "assets/images/miles.jpg",
            scale: 4,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromARGB(255, 7, 10, 16),
                  Color(0xff101623),
                  Color(0xff2D3446),
                ])),
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: Column(
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
                                  )))))
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  StoryList(),
                  SizedBox(
                    height: 40.h,
                    child: BlocBuilder<DataBloc, DataState>(
                      builder: (context, state) {
                        if (state is HomeDataloading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state is HomeDataloaded) {
                          return Column(
                            children: [
                              Image.network(
                                  '${state.data.data[0].posts[0].files[0].imagePath.toString().split('.png')[0]}.png'),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                  Container(
                    height: 200.h, // Adjusted height of the Container
                    // color: Colors.red,
                    child: BlocBuilder<DataBloc, DataState>(
                      builder: (context, state) {
                        if (state is HomeDataloading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state is HomeDataloaded) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.data.data[1].heading.toString(),
                                style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                              spacer30Height,
                              GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      2,  
                                  mainAxisSpacing: .0,  
                                  crossAxisSpacing:
                                      .0,  
                                ),
                                itemCount: state.data.data[1].posts
                                    .length, // total number of items
                                itemBuilder: (context, index) {
                                  var data = state.data.data[1].posts[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              '${data.files[0].thumbnail.toString().split('.png')[0]}.png',
                                              // Increased height of each image
                                            ),
                                          )),
                                    ),
                                  );
                                },
                              )
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
