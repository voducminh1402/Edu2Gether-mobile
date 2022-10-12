import 'package:edu2gether_mobile/screens/userProfile/profile.dart';
import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
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
            Padding(
              padding: EdgeInsets.only(top:0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                        width: 380,
                        height: 70,
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(Dimension.radius12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.mainColor),
                                  borderRadius: BorderRadius.circular(Dimension.radius12)),
                              hintText: 'Hieu Trung',
                              fillColor: AppColors.inputColor,
                              filled: true,
                            ),
                          ),
                        ),

                    ),
                  ),
                ],
              ),
            ),

          ],
        ),

      ),
    );
  }

}