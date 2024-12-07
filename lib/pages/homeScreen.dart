import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milesed/bloc/bloc/dataBloc.dart';
import 'package:milesed/bloc/event/dataEvent.dart';
import 'package:milesed/components/banner.dart';
import 'package:milesed/components/footer.dart';
import 'package:milesed/components/ourProgram.dart';
import 'package:milesed/components/reels.dart';
import 'package:milesed/components/silder.dart';
import 'package:milesed/components/upcomingEvents.dart';
import 'package:milesed/components/youtube.dart';
import 'package:milesed/constant/constant.dart';
import 'package:milesed/pages/testimonialScreen.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    load();
    super.initState();
  }

  load() {
    context.read<DataBloc>().add(GetHomeData());
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/images/miles.jpg",
            scale: 0.5.h,
          ),
          backgroundColor: const Color.fromARGB(255, 7, 10, 16),
          actions: [
            Icon(
              Icons.notifications,
              color: Colors.white,
              size: 4.h,
            )
          ],
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
                  Color(0xff27313B),
                ])),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 1.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TestimonialViewer(),
    
                  // Bannner
                  const BannerImage(),
                  spacer30Height,
                  const ReelsComponent(),
                  const SilderComponent(),
                  spacer10Height,
                  const UpcomingEventsComponent(),
                  spacer10Height,
    
                  const Youtubevideos(),
    
                  const OurProgramComponent(),
    
                  spacer50Height,
                  const FooterContent()
                ],
              ),
            ),
          ),
        ));
  }
}
