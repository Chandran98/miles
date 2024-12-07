import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milesed/bloc/state/dataState.dart';
import 'package:milesed/constant/constant.dart';
import 'package:milesed/utils/youtubevideos.dart';
import 'package:sizer/sizer.dart';

import '../bloc/bloc/dataBloc.dart';

class Youtubevideos extends StatefulWidget {
  const Youtubevideos({super.key});

  @override
  State<Youtubevideos> createState() => _YoutubevideosState();
}

class _YoutubevideosState extends State<Youtubevideos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacer10Height,
        Text(
          "Accounting Unplugged",
          style:
              GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        BlocBuilder<DataBloc, DataState>(
          builder: (context, orderState) {
            if (orderState is HomeDataloading) {
              return const Center(child: CircularProgressIndicator());
            } else if (orderState is HomeDataloaded) {
              return SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: orderState.data.data[4].posts.length,
                  itemBuilder: (context, index) {
                    var data = orderState.data.data[4].posts[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => VideoComponent(
                                      title: data.title,
                                      url: data.files[0].videoUrl.toString(),
                                    )));
                      },
                      child: Card(
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Color(0xff27313B),
                                Color(0xff101623),
                                Color.fromARGB(255, 7, 10, 16),
                                // Color(0xff2D3446),
                              ])),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  data.files[0].thumbnail.toString(),
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  data.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 10.w,
                                      height: 10.h,
                                      decoration: const BoxDecoration(
                                          // color: Colors.white,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              scale: 1,
                                              image: AssetImage(
                                                "assets/images/mqa.jpeg",
                                              ))),
                                    ),
                                    spacer2WidthD,
                                    Row(
                                      children: [
                                        const Icon(Icons.thumb_up),
                                        const SizedBox(width: 5),
                                        Text('${data.likes} Likes'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
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
      ],
    );
  }
}
