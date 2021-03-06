import 'package:flutter/material.dart';
import 'package:nrnr/screens/mainpage/tabs/mypage/MyPage.dart';
import 'package:nrnr/screens/mainpage/tabs/search/Search.dart';
import 'package:nrnr/screens/mainpage/tabs/write/Write.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
// Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  final double tabsIconSize = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[Search(), Write(), MyPage()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Container(
        height: 70,

        // set the color of the bottom navigation bar
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          new BoxShadow(
              color: Colors.black26,
              offset: new Offset(0, -1.0),
              blurRadius: 10)
        ]),
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.search),
              text: "SEARCH",
            ),
            Tab(
              icon: Icon(Icons.create),
              text: "CREATE",
            ),
            Tab(
              icon: Icon(Icons.person),
              text: "ME",
            ),
          ],
          controller: controller,
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.black87,
          labelColor: const Color(0xffff7715),
        ),
      ),
    );
  }
}
