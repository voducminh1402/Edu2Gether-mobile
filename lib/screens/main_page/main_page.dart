import 'package:edu2gether_mobile/main.dart';

import 'package:edu2gether_mobile/models/mentee.dart';
import 'package:edu2gether_mobile/screens/home_page/home_page.dart';
import 'package:edu2gether_mobile/screens/my_book_mark/my_book_mark.dart';
import 'package:edu2gether_mobile/screens/transaction/transaction.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile.dart';
import 'package:edu2gether_mobile/services/mentee_service.dart';

import 'package:edu2gether_mobile/screens/transaction/transaction.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../my_course/my_course.dart';
import '../user_profile/profile.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    MainHomePage(),
    MyCourse(),
    TransactionPage(),
    MyBookmarkPage(),
    Profile(),
  ];
  int currentIndex = 0;

  void onTap(int index){
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
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: "My Course"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Transaction"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "My Bookmark"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]
      ),
    );
  }
}
