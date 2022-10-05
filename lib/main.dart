import 'package:edu2gether_mobile/screens/blog/blog.dart';
import 'package:edu2gether_mobile/screens/blog/blog_post.dart';
import 'package:edu2gether_mobile/screens/mentor/top_mentor.dart';
import 'package:edu2gether_mobile/screens/mostpopularcourse/mostpopularcourse.dart';
import 'package:edu2gether_mobile/screens/mybookmark/mybookmark.dart';
import 'package:edu2gether_mobile/screens/nofitication/notification.dart';
import 'package:edu2gether_mobile/screens/transaction/transaction.dart';
import 'package:flutter/material.dart';
import 'package:edu2gether_mobile/screens/transaction/transaction.dart';
import 'package:edu2gether_mobile/screens/transaction/ereceipt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlogPage(),
    );
  }
}
