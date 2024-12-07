import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milesed/bloc/bloc/dataBloc.dart';
import 'package:milesed/bloc/state/dataState.dart';
class BannerImage extends StatelessWidget {
  const BannerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return     SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: BlocBuilder<DataBloc, DataState>(
                      builder: (context, orderState) {
                        if (orderState is HomeDataloading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (orderState is HomeDataloaded) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  orderState.data.data[0].posts.length,
                              itemBuilder: (context, index) {
                                var data = orderState
                                    .data.data[0].posts[index].files[0];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.90,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fitWidth,
                                            image: NetworkImage(
                                                data.imagePath.toString()))),
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (orderState is HomeDataError) {
                          return Center(
                              child: Text("Error: ${orderState.err}"));
                        } else {
                          return Container(); // Default case
                        }
                      },
                    ),
                  );
              
  }
}