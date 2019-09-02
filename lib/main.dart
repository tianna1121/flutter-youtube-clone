import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/youtube_main.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Youtube UI",
      debugShowCheckedModeBanner: false,
      home: YoutubeMain(),
    );
  }
}
