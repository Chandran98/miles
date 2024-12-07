
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TestimonialStoryScreen extends StatefulWidget {
  String url;
   TestimonialStoryScreen({super.key, required this.url});

  @override
  _TestimonialStoryScreenState createState() => _TestimonialStoryScreenState();
}

class _TestimonialStoryScreenState extends State<TestimonialStoryScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.url);

    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true, 
        mute: false,    
        loop: true,     
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
        builder: (context, player) {
          return player;
        },
      );
  }
}
