import 'package:flutter/material.dart';
import 'package:travel_app/pages/HomePage.dart';
import 'package:travel_app/pages/navPages/bar_page.dart';
import 'package:travel_app/pages/navPages/my_page.dart';
import 'package:travel_app/pages/navPages/search_page.dart';
// ignore: unused_import
import 'package:travel_app/main.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages=[const HomePage(),
    const BarPage(),
    const SearchPage(),
    const MyPage(),
  ];
  int currentIndex=0;
  void onTap(int idx){
    setState(() {
      currentIndex=idx;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black54,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(140, 202, 193, 227).withOpacity(0.5),
        items: [
          const BottomNavigationBarItem(label:"Home",icon: Icon(Icons.apps)),
          const BottomNavigationBarItem(label:"Bar",icon: Icon(Icons.bar_chart_sharp)),
          const BottomNavigationBarItem(label:"Search",icon: Icon(Icons.search)),
          const BottomNavigationBarItem(label:"My",icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}