import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milesed/bloc/state/dataState.dart';
import 'package:sizer/sizer.dart';

import '../bloc/bloc/dataBloc.dart';

class SilderComponent extends StatefulWidget {
  const SilderComponent({super.key});

  @override
  State<SilderComponent> createState() => _SilderComponentState();
}

class _SilderComponentState extends State<SilderComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        SizedBox(
          height: 20.h,
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
                    itemCount: orderState.data.data[2].posts.length,
                    itemBuilder: (context, index) {
                      var data = orderState.data.data[2].posts[index];
                      return  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.90,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fitWidth,
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
