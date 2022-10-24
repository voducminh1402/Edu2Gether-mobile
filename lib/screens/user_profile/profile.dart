
import 'package:edu2gether_mobile/models/mentee.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile_edit.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile_payment.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile_edit.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile_payment.dart';
import 'package:edu2gether_mobile/services/mentee_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../../utilities/dimensions.dart';
import 'package:get/get.dart';


class Profile extends StatefulWidget {

  const Profile({super.key});

  @override
  State<Profile> createState() => _profileState();
}

class _profileState extends State<Profile>{

  List<Mentee>? mentee;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    getData();
  }

  getData() async{
    mentee = (await MenteeService().getMentee())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(mentee != null){
      isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {

    bool _switchValue = true;

     return MaterialApp(
       home: Scaffold(
         backgroundColor: Colors.white,
         appBar: AppBar(
         backgroundColor: Colors.white,
         leading: IconButton(
           icon: Icon(
             Icons.arrow_back,
             color: Colors.black,
           ),
           onPressed: () {
             Get.back();
           },
         ),
         title: Text(
           'Profile',
           style: TextStyle(
               color: Colors.black,
               fontWeight: FontWeight.bold,
               fontSize: Dimension.font8),
         ),
         actions: [
           IconButton(
               onPressed: () {},
               icon: Icon(
                 Icons.more_horiz_rounded,
                 color: Colors.black,
               )),
         ],
         elevation: 0
       ),
         body: Visibility(
           visible: isLoaded,
           replacement: const Center(
             child: CircularProgressIndicator(),
           ),
           child: Container(
             width: 380,
             height: 700,
             margin: EdgeInsets.only(left: 30, right: 24),
             child: ListView.builder(
                 itemCount: mentee?.length,
                 itemBuilder: (context, index){
                   return Column(
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
                               mentee![index].fullName,
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
                         padding:EdgeInsets.only(top: 0, left: 24, right: 24),
                         child: Divider(
                           thickness: 1,
                           color: Colors.black,
                         ),
                       ),
                       GestureDetector(
                         onTap: () => Get.toNamed(RoutesClass.getProfileEditRoute()),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget> [
                             Expanded(

                               child: Container(
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
                               ),

                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top:10),
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget> [
                             Expanded(
                               child: Container(
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
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top:10),
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget> [
                             Expanded(
                               child: GestureDetector(
                                 onTap: (){
                                   Get.toNamed(RoutesClass.getProfilePaymentRoute());
                                 },
                                 child:  Container(
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
                                     trailing: Icon(Icons.navigate_next, color: Colors.black,),
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top:10),
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget> [
                             Expanded(
                               child:  Container(
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
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top:10),
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget> [
                             Expanded(
                               child: Container(
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
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top:10),
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget> [
                             Expanded(
                               child: Container(
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
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top:10),
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget> [
                             Expanded(
                               child: Container(
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
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top:10),
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget> [
                             Expanded(
                               child: Container(
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
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top:10),
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget> [
                             Expanded(
                               child: Container(
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
                               ),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top:10),
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget> [
                             Expanded(
                               child:  Container(
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
                                         color: Colors.red,
                                       ),
                                     ),
                                     trailing: Icon(Icons.navigate_next, color: Colors.black,)
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),

                     ],

                   );
                 }
             ),
           ),
         ),
       ),
     );
  }
}
