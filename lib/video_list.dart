import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/screens/video_detail.dart';

import 'models/youtube_model.dart';

class VideoList extends StatelessWidget {
  final List<YoutubeModel> listData;
  final bool isMinList;
  final bool isHorizontalList;

  const VideoList(
      {this.listData, this.isMinList = false, this.isHorizontalList = false});

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    if (isHorizontalList) {
      return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildHorizontalList(context, index);
        },
        itemCount: listData.length,
      );
    } else {
      return ListView.separated(
        shrinkWrap: true,
        itemCount: listData.length,
        itemBuilder: (context, index) {
          if (isMinList || deviceOrientation == Orientation.landscape) {
            return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VideoDetail(
                            detail: listData[index],
                          )));
                },
                child: _buildLandscapeList(context, index));
          } else {
            return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VideoDetail(
                            detail: listData[index],
                          )));
                },
                child: _buildPortraitList(context, index));
          }
        },
        separatorBuilder: (context, index) => Divider(
          height: 1.0,
          color: Colors.grey,
        ),
      );
    }
  }

  Widget _buildPortraitList(BuildContext context, int index) {
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
          contentPadding: const EdgeInsets.all(8.0),
          dense: true,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(listData[index].channelAvatar),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(listData[index].title),
          ),
          subtitle: Text(
              "${listData[index].channelTitle} ${listData[index].viewCount} ${listData[index].publishedTime}"),
          trailing: Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Icon(Icons.more_vert)),
        )
      ],
    );
  }

  Widget _buildLandscapeList(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            width:
                isMinList ? MediaQuery.of(context).size.width / 2 : 336.0 / 1.5,
            height: isMinList ? 100.0 : 188.0 / 1.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(listData[index].thumbNail),
                    fit: BoxFit.cover)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  dense: isMinList ? true : false,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(listData[index].title),
                  ),
                  subtitle: !isMinList
                      ? Text(
                          "${listData[index].channelTitle} ${listData[index].viewCount} ${listData[index].publishedTime}")
                      : Text(
                          "${listData[index].channelTitle} ${listData[index].viewCount}"),
                  trailing: Container(
                      margin: const EdgeInsets.only(bottom: 30.0),
                      child: Icon(Icons.more_vert)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: !isMinList
                      ? CircleAvatar(
                          backgroundImage:
                              NetworkImage(listData[index].channelAvatar),
                        )
                      : SizedBox(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHorizontalList(BuildContext context, int index) {
    return Container(
      width: 336.0 / 2.2,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 4.0),
            width: 336.0 / 2.0,
            height: 188 / 2.2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(listData[index].thumbNail))),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        listData[index].title,
                        style: TextStyle(fontSize: 12.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      listData[index].channelTitle,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                    )
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                size: 12.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
