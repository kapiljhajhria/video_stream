import 'package:flutter/material.dart';
import 'package:video_stream/src/widgets/video_list_tile.dart';
import '../../src/data/video_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos List"),
      ),
      body: ListView.builder(
        itemCount: videosList.length,
        itemBuilder: (BuildContext context, int index) {
          return VideoListTile(
            video: videosList[index],
          );
        },
      ),
    );
  }
}
