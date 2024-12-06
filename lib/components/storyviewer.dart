import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milesed/bloc/bloc/dataBloc.dart';
import 'package:milesed/bloc/event/dataEvent.dart';
import 'package:milesed/bloc/state/dataState.dart';
import 'package:milesed/main.dart';
import 'package:sizer/sizer.dart';

class StoryList extends StatefulWidget {
  const StoryList({Key? key}) : super(key: key);



  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        context.read<TestimonialDataBloc>().add(GetTestimonialData());

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestimonialDataBloc, DataState>(
      builder: (context, state) {
        if (state is TestimonialDataloading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is TestimonialDataloaded) {
          print(state.data.data[0].firstName);
          return Container(
            height: 17.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.data.data.length,
              itemBuilder: (context, index) {
                var data = state.data.data[index];

                return Padding(
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
                          // backgroundImage: data.imageUrl == null
                          //     ?  AssetImage("assets/images/profile.jpg")
                          //     : NetworkImage(
                          //         '${data.imageUrl.toString().split('.png')[0]}.png'),
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
                );
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
