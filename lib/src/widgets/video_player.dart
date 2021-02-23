import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_stream/src/models/video.dart';

class VideoPlayer extends StatefulWidget {
  final Video video;

  const VideoPlayer({Key key, this.video});
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  Future<void> initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.network(widget.video.videoUrl);
    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: _chewieController != null &&
                      _chewieController.videoPlayerController.value.initialized
                  ? Chewie(
                      controller: _chewieController,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Loading Video'),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
