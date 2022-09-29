import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatelessWidget {

  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Profile',
            style: TextStyle(
              fontFamily: 'Urbanist',
              color: Colors.black,

            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            IconButton(onPressed: (){
                //do something in hear
            }, icon: Icon(
              Icons.more_horiz,
              color: Colors.black,

            ))
          ],
        ),
        body: Material(
          elevation: 1,
          child:  Stack(
            children: [
              Positioned(
                left: 90,
                child:  Column(
                  children: [
                    Container(
                      width: 230,
                      height: 170,
                      child: Center(child: Image.asset('assets/images/avatarFBdefault.png'),),
                    ),
                    new Text('Username'),
                    new Text('Email'),
                  ],
                ),
              ),
          ],),
        )

      ),
    );
  }
}
