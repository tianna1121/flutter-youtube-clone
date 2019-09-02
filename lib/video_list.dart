import 'package:flutter/material.dart';

class VideoList extends StatelessWidget {
  final listData;

  const VideoList({this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(listData[index].thumbNail),
                      fit: BoxFit.cover)),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(listData[index].channelAvatar),
              ),
              title: Text(listData[index].title),
              subtitle: Text(
                  "${listData[index].channelTitle} ${listData[index].viewCount} ${listData[index].publishedTime}"),
            )
          ],
        );
      },
      separatorBuilder: (context, index) => Divider(
        height: 1.0,
        color: Colors.grey,
      ),
    );
  }
}
