
import 'package:edu2gether_mobile/models/mentee.dart';

import 'package:edu2gether_mobile/services/mentee_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../../utilities/dimensions.dart';
import 'package:get/get.dart';


class Profile extends StatefulWidget {

  String id;
  String fullName;
  String phone;
  String address;
  String university;
  String country;
  String gender;
  String image;

  Profile({required this.id,
  required this.fullName,
  required this.phone,
  required this.address,
  required this.university,
  required this.country,
  required this.gender,
  required this.image,Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _profileState();
}

class _profileState extends State<Profile>{

  Mentee? mentee;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    getData();
  }

  getData() async{
    mentee = await MenteeService().getMenteeById(mentee?.id ?? 0);
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
           icon: const Icon(
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
               icon: const Icon(
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
             margin: const EdgeInsets.only(left: 30, right: 24),
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: const <Widget> [
                     SizedBox(
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
                       padding: const EdgeInsets.only(top: 24),
                       child: Text(
                         mentee!.fullName,

                         style: const TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w700, fontSize: 24),
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget> [
                     Padding(
                       padding: const EdgeInsets.only(top: 8),
                       child: Text(
                         mentee!.university,
                         style: const TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w600, fontSize: 14),
                       ),
                     ),
                   ],
                 ),
                 const Padding(
                   padding:EdgeInsets.only(top: 0, left: 24, right: 24),
                   child: Divider(
                     thickness: 1,
                     color: Colors.black,
                   ),
                 ),
                 GestureDetector(
                   onTap: () async{
                     Get.toNamed(RoutesClass.getProfileEditRoute());
                   } ,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: const <Widget> [
                       Expanded(

                         child: SizedBox(
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
                   padding: const EdgeInsets.only(top:10),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: const <Widget> [
                       Expanded(
                         child: SizedBox(
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
                   padding: const EdgeInsets.only(top:10),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: <Widget> [
                       Expanded(
                         child: GestureDetector(
                           onTap: (){
                             Get.toNamed(RoutesClass.getProfilePaymentRoute());
                           },
                           child:  const SizedBox(
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
                   padding: const EdgeInsets.only(top:10),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: const <Widget> [
                       Expanded(
                         child:  SizedBox(
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
                   padding: const EdgeInsets.only(top:10),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: const <Widget> [
                       Expanded(
                         child: SizedBox(
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
                   padding: const EdgeInsets.only(top:10),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: <Widget> [
                       Expanded(
                         child: SizedBox(
                           width: 380,
                           height: 28,
                           child: ListTile(
                               leading: const Icon(Icons.visibility_sharp,color: Colors.black,),
                               title: const Text(
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
                   padding: const EdgeInsets.only(top:10),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: const <Widget> [
                       Expanded(
                         child: SizedBox(
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
                   padding: const EdgeInsets.only(top:10),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: const <Widget> [
                       Expanded(
                         child: SizedBox(
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
                   padding: const EdgeInsets.only(top:10),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: const <Widget> [
                       Expanded(
                         child: SizedBox(
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
                   padding: const EdgeInsets.only(top:10),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: const <Widget> [
                       Expanded(
                         child:  SizedBox(
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

             ),
           ),
         ),
       ),
     );
  }
}
