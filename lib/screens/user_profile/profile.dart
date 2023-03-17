import 'package:edu2gether_mobile/models/authen_response.dart';
import 'package:edu2gether_mobile/models/mentee.dart';
import 'package:edu2gether_mobile/screens/main_page/main_page.dart';
import 'package:edu2gether_mobile/screens/user_profile/profile_edit.dart';
import 'package:edu2gether_mobile/services/auth_service.dart';

import 'package:edu2gether_mobile/services/mentee_service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../../utilities/dimensions.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  String? id;

  Profile({this.id, Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _profileState();
}

class _profileState extends State<Profile> {
  Mentee? mentee;
  var isLoaded = false;

  late String id;
  late AuthenResponse user;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await AuthService().getUserLogin().then((value) async {
      id = value.id;
      user = value;
      mentee = await MenteeService().getMenteeById(id);
      setState(() {
        if (mentee != null) {
          isLoaded = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool switchValue = true;

    return !isLoaded
        ? const Scaffold(
            body: Center(
            child: CircularProgressIndicator(),
          ))
        : MaterialApp(
            home: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.white,
                appBar: AppBar(
                    backgroundColor: Colors.white,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Get.to(() => MainPage());
                      },
                    ),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimension.font8),
                    ),
                    elevation: 0),
                body: Container(
                  width: 380,
                  height: 700,
                  margin: const EdgeInsets.only(left: 30, right: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(mentee!.image!),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Text(
                              mentee?.fullName! ?? '',
                              style: const TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              mentee?.university! ?? '',
                              style: const TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 0, left: 24, right: 24),
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          Get.to(() => ProfileEdit(id: id, user: user));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const <Widget>[
                            Expanded(
                              child: SizedBox(
                                width: 380,
                                height: 28,
                                child: ListTile(
                                    leading: Icon(
                                      Icons.person_outlined,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                          fontFamily: 'Urbanist',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    trailing: Icon(
                                      Icons.navigate_next,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top:10),
                      //   child:  Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: const <Widget> [
                      //       Expanded(
                      //         child: SizedBox(
                      //
                      //           width: 380,
                      //           height: 28,
                      //           child: ListTile(
                      //               leading: Icon(Icons.notifications_none_sharp,color: Colors.black,),
                      //               title: Text(
                      //                 'Notification',
                      //                 style: TextStyle(
                      //                   fontFamily: 'Urbanist',
                      //                   fontSize: 18,
                      //                   fontWeight: FontWeight.w600,
                      //                 ),
                      //               ),
                      //               trailing: Icon(Icons.navigate_next, color: Colors.black,)
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top:10),
                      //   child:  Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: <Widget> [
                      //       Expanded(
                      //         child: GestureDetector(
                      //           onTap: (){
                      //             Get.toNamed(RoutesClass.getProfilePaymentRoute());
                      //           },
                      //           child:  const SizedBox(
                      //             width: 380,
                      //             height: 28,
                      //             child: ListTile(
                      //               leading: Icon(Icons.account_balance_wallet_sharp,color: Colors.black,),
                      //               title: Text(
                      //                 'Payment',
                      //                 style: TextStyle(
                      //                   fontFamily: 'Urbanist',
                      //                   fontSize: 18,
                      //                   fontWeight: FontWeight.w600,
                      //                 ),
                      //               ),
                      //               trailing: Icon(Icons.navigate_next, color: Colors.black,),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top:10),
                      //   child:  Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: const <Widget> [
                      //       Expanded(
                      //         child:  SizedBox(
                      //           width: 380,
                      //           height: 28,
                      //           child: ListTile(
                      //               leading: Icon(Icons.verified_user_sharp,color: Colors.black,),
                      //               title: Text(
                      //                 'Security',
                      //                 style: TextStyle(
                      //                   fontFamily: 'Urbanist',
                      //                   fontSize: 18,
                      //                   fontWeight: FontWeight.w600,
                      //                 ),
                      //               ),
                      //               trailing: Icon(Icons.navigate_next, color: Colors.black,)
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top:10),
                      //   child:  Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: const <Widget> [
                      //       Expanded(
                      //         child: SizedBox(
                      //           width: 380,
                      //           height: 28,
                      //           child: ListTile(
                      //               leading: Icon(Icons.language_sharp,color: Colors.black,),
                      //               title: Text(
                      //                 'Language',
                      //                 style: TextStyle(
                      //                   fontFamily: 'Urbanist',
                      //                   fontSize: 18,
                      //                   fontWeight: FontWeight.w600,
                      //                 ),
                      //               ),
                      //               trailing: Icon(Icons.navigate_next, color: Colors.black,)
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top:10),
                      //   child:  Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: <Widget> [
                      //       Expanded(
                      //         child: SizedBox(
                      //           width: 380,
                      //           height: 28,
                      //           child: ListTile(
                      //               leading: const Icon(Icons.visibility_sharp,color: Colors.black,),
                      //               title: const Text(
                      //                 'Dark Mode',
                      //                 style: TextStyle(
                      //                   fontFamily: 'Urbanist',
                      //                   fontSize: 18,
                      //                   fontWeight: FontWeight.w600,
                      //                 ),
                      //               ),
                      //               trailing:
                      //               CupertinoSwitch(
                      //                   value: true,
                      //                   onChanged: (value){
                      //                     setState(() {
                      //                       _switchValue = false;
                      //                     });
                      //                   })
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top:10),
                      //   child:  Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: const <Widget> [
                      //       Expanded(
                      //         child: SizedBox(
                      //           width: 380,
                      //           height: 28,
                      //           child: ListTile(
                      //               leading: Icon(Icons.lock_outline_sharp,color: Colors.black,),
                      //               title: Text(
                      //                 'Privacy Policy',
                      //                 style: TextStyle(
                      //                   fontFamily: 'Urbanist',
                      //                   fontSize: 18,
                      //                   fontWeight: FontWeight.w600,
                      //                 ),
                      //               ),
                      //               trailing: Icon(Icons.navigate_next, color: Colors.black,)
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top:10),
                      //   child:  Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: const <Widget> [
                      //       Expanded(
                      //         child: SizedBox(
                      //           width: 380,
                      //           height: 28,
                      //           child: ListTile(
                      //               leading: Icon(Icons.people_outline_sharp,color: Colors.black,),
                      //               title: Text(
                      //                 'Invite Friends',
                      //                 style: TextStyle(
                      //                   fontFamily: 'Urbanist',
                      //                   fontSize: 18,
                      //                   fontWeight: FontWeight.w600,
                      //                 ),
                      //               ),
                      //               trailing: Icon(Icons.navigate_next, color: Colors.black,)
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () => AuthService().signOut(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const <Widget>[
                              Expanded(
                                child: SizedBox(
                                  width: 380,
                                  height: 28,
                                  child: ListTile(
                                      leading: Icon(
                                        Icons.logout,
                                        color: Colors.black,
                                      ),
                                      title: Text(
                                        'Logout',
                                        style: TextStyle(
                                          fontFamily: 'Urbanist',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.red,
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.navigate_next,
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
  }
}
