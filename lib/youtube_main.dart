import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/screens/home.dart';
import 'package:flutter_youtube_clone/screens/inbox.dart';
import 'package:flutter_youtube_clone/screens/trending.dart';

class YoutubeMain extends StatefulWidget {
  @override
  _YoutubeMainState createState() => _YoutubeMainState();
}

class _YoutubeMainState extends State<YoutubeMain> {
  int _currentIndex = 0;
  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      HomeScreen(),
      TrendingScreen(),
      Center(child: Text("Subscriptions")),
      InboxScreen(),
      Center(child: Text("Library")),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Image.asset(
          "assets/images/youtube_logo.png",
          width: 98.0,
          height: 22.0,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(title: Text("Home"), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text("Trending"), icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              title: Text("Subsciptions"), icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(title: Text("Inbox"), icon: Icon(Icons.mail)),
          BottomNavigationBarItem(
              title: Text("Library"), icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
