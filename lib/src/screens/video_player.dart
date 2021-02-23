import 'package:flutter/material.dart';
import 'package:video_stream/src/models/video.dart';
import 'package:video_stream/src/widgets/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final Video video;

  const VideoPlayerScreen({Key key, this.video});
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoPlayer(
        video: widget.video,
      ),
    );
  }
}
