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
  final double tabsIconSize = 35;
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
        height: 60,

        // set the color of the bottom navigation bar
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0, 0.7294270833333343),
                end: Alignment(0.9999999999999998, 0.7294270833333343),
                colors: [const Color(0xffff0100), const Color(0xffff6300), const Color(0xffffc100)])
        ),
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.search, size: tabsIconSize),
            ),
            Tab(
              icon: Icon(Icons.create, size: tabsIconSize),
            ),
            Tab(
              icon: Icon(Icons.person, size: tabsIconSize),
            ),
          ],
          controller: controller,
          indicatorColor: Colors.transparent,
        ),
      ),
    );
  }
}
