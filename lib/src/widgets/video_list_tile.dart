import 'package:flutter/material.dart';
import 'package:video_stream/src/models/video.dart';
import 'package:video_stream/src/screens/video_player.dart';

class VideoListTile extends StatefulWidget {
  final Video video;

  const VideoListTile({Key key, this.video});
  @override
  _VideoListTileState createState() => _VideoListTileState();
}

class _VideoListTileState extends State<VideoListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Stack(
          children: [
            Image.network(widget.video.thumbnailUrl),
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.play_arrow,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        elevation: 10.0,
        margin: EdgeInsets.all(12),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
              video: widget.video,
            ),
          ),
        );
      },
    );
  }
}
