
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {

  const Profile({super.key});

  @override
  State<Profile> createState() => _profileState();
}

class _profileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {

    bool _switchValue = true;

     return MaterialApp(
       home: Scaffold(
         backgroundColor: Colors.white,
         appBar: AppBar(
           leading: BackButton(
             color: Colors.black,
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
               'Profile',
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
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Container(
                    width: 120,
                    height: 120,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatarFBdefault.png'),
                    ),
                  )
                ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget> [
                 Padding(
                     padding: EdgeInsets.only(top: 24),
                    child: Text(
                      'Hieu Trung',
                      style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                 ),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget> [
                 Padding(
                   padding: EdgeInsets.only(top: 8),
                   child: Text(
                     'hieutrung0510@gmail.com',
                     style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w600, fontSize: 14),
                   ),
                 ),
               ],
             ),
            Padding(
                padding:EdgeInsets.only(top: 24, left: 24, right: 24),
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
            ),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Container(
                    width: 380,
                    height: 28,
                    child: ListTile(
                      leading: Icon(Icons.person_outlined,color: Colors.black,),
                      title: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      trailing: Icon(Icons.navigate_next, color: Colors.black,)
                    ),
                  )
                ],
              ),
             Padding(
               padding: EdgeInsets.only(top:20),
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget> [
                   Container(
                     width: 380,
                     height: 28,
                     child: ListTile(
                         leading: Icon(Icons.notifications_none_sharp,color: Colors.black,),
                         title: Text(
                           'Notification',
                           style: TextStyle(
                               fontFamily: 'Urbanist',
                               fontSize: 18,
                               fontWeight: FontWeight.w600,
                           ),
                         ),
                         trailing: Icon(Icons.navigate_next, color: Colors.black,)
                     ),
                   )
                 ],
               ),
             ),
             Padding(
               padding: EdgeInsets.only(top:20),
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget> [
                   Container(
                     width: 380,
                     height: 28,
                     child: ListTile(
                         leading: Icon(Icons.account_balance_wallet_sharp,color: Colors.black,),
                         title: Text(
                           'Payment',
                           style: TextStyle(
                             fontFamily: 'Urbanist',
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         trailing: Icon(Icons.navigate_next, color: Colors.black,)
                     ),
                   )
                 ],
               ),
             ),
             Padding(
               padding: EdgeInsets.only(top:20),
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget> [
                   Container(
                     width: 380,
                     height: 28,
                     child: ListTile(
                         leading: Icon(Icons.verified_user_sharp,color: Colors.black,),
                         title: Text(
                           'Security',
                           style: TextStyle(
                             fontFamily: 'Urbanist',
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         trailing: Icon(Icons.navigate_next, color: Colors.black,)
                     ),
                   )
                 ],
               ),
             ),
             Padding(
               padding: EdgeInsets.only(top:20),
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget> [
                   Container(
                     width: 380,
                     height: 28,
                     child: ListTile(
                         leading: Icon(Icons.language_sharp,color: Colors.black,),
                         title: Text(
                           'Language',
                           style: TextStyle(
                             fontFamily: 'Urbanist',
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         trailing: Icon(Icons.navigate_next, color: Colors.black,)
                     ),
                   )
                 ],
               ),
             ),
             Padding(
               padding: EdgeInsets.only(top:20),
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget> [
                   Container(
                     width: 380,
                     height: 28,
                     child: ListTile(
                         leading: Icon(Icons.visibility_sharp,color: Colors.black,),
                         title: Text(
                           'Dark Mode',
                           style: TextStyle(
                             fontFamily: 'Urbanist',
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         trailing:
                            CupertinoSwitch(
                                value: true,
                                onChanged: (value){
                                  setState(() {
                                    _switchValue = false;
                                  });
                                })
                     ),
                   )
                 ],
               ),
             ),
             Padding(
               padding: EdgeInsets.only(top:20),
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget> [
                   Container(
                     width: 380,
                     height: 28,
                     child: ListTile(
                         leading: Icon(Icons.lock_outline_sharp,color: Colors.black,),
                         title: Text(
                           'Privacy Policy',
                           style: TextStyle(
                             fontFamily: 'Urbanist',
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         trailing: Icon(Icons.navigate_next, color: Colors.black,)
                     ),
                   )
                 ],
               ),
             ),
             Padding(
               padding: EdgeInsets.only(top:20),
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget> [
                   Container(
                     width: 380,
                     height: 28,
                     child: ListTile(
                         leading: Icon(Icons.info_outline_sharp,color: Colors.black,),
                         title: Text(
                           'Help Center',
                           style: TextStyle(
                             fontFamily: 'Urbanist',
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         trailing: Icon(Icons.navigate_next, color: Colors.black,)
                     ),
                   )
                 ],
               ),
             ),
             Padding(
               padding: EdgeInsets.only(top:20),
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget> [
                   Container(
                     width: 380,
                     height: 28,
                     child: ListTile(
                         leading: Icon(Icons.people_outline_sharp,color: Colors.black,),
                         title: Text(
                           'Invite Friends',
                           style: TextStyle(
                             fontFamily: 'Urbanist',
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         trailing: Icon(Icons.navigate_next, color: Colors.black,)
                     ),
                   )
                 ],
               ),
             ),
             Padding(
               padding: EdgeInsets.only(top:20),
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget> [
                   Container(
                     width: 380,
                     height: 28,
                     child: ListTile(
                         leading: Icon(Icons.person_outlined,color: Colors.black,),
                         title: Text(
                           'Logout',
                           style: TextStyle(
                             fontFamily: 'Urbanist',
                             fontSize: 18,
                             fontWeight: FontWeight.w600,
                           ),
                         ),
                         trailing: Icon(Icons.navigate_next, color: Colors.black,)
                     ),
                   )
                 ],
               ),
             ),

           ],

         ),
       ),
     );
  }
}
