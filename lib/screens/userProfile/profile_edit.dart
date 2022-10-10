import 'package:edu2gether_mobile/screens/userProfile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ProfileEdit extends StatefulWidget{

  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _profileEditState();

}

class _profileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: (){
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ) ,
          title: const Text(
            'Edit Profile',
          ),
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          children: <Widget>[

          ],
        ),

      ),
    );
  }

}