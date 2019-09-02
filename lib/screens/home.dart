import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/models/youtube_model.dart';

import '../video_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VideoList(
      listData: youtubeData,
    );
  }
}
