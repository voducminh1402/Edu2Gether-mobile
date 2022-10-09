import 'package:edu2gether_mobile/screens/my_course/my_home_page.dart';
import 'package:edu2gether_mobile/screens/transaction/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../my_course/my_course.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    MyHomePage(),
    MyCourse(),
    MyHomePage(),
    TransactionPage(),
    MyHomePage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: "My Course"),
            BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "Inbox"),
            BottomNavigationBarItem(icon: Icon(Icons.transcribe), label: "Transaction"),
            BottomNavigationBarItem(icon: Icon(Icons.person_off), label: "Profile"),
          ]
      ),
    );
  }
}
