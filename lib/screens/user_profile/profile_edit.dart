import 'package:edu2gether_mobile/screens/user_profile/profile.dart';
import 'package:edu2gether_mobile/services/mentee_service.dart';
import 'package:edu2gether_mobile/utilities/colors.dart';

import 'package:edu2gether_mobile/widgets/button_update.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../models/mentee.dart';

import '../../routes/routes.dart';
import '../../widgets/button_login.dart';


class ProfileEdit extends StatefulWidget{

  String id;
  String fullName;
  String phone;
  String address;
  String university;
  String country;
  String gender;
  String image;

  ProfileEdit({required this.id,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.university,
    required this.country,
    required this.gender,
    required this.image,Key? key}) : super(key: key);


  @override
  State<ProfileEdit> createState() => _profileEditState();

}

class _profileEditState extends State<ProfileEdit> {

  Mentee? _mentee;

  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    _getMentee();
    _patchMenteeById();
  }

  _patchMenteeById() async{
    _mentee = await MenteeService().updateMenteeById(_mentee!, _mentee!.id);
  }

  _getMentee() async{
    _mentee = (await MenteeService().getMenteeById(_mentee?.id ?? 0));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_mentee != null){
      isLoaded = true;
    }
  }


  String dropdownValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:GestureDetector(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
              onPressed: () async{
                Navigator.pop(context,false);
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => Profile(id: '', fullName: '', phone: '', address: '', university: '', country: '', gender: '', image: '',)));
              },
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: const TextStyle(
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
                  icon: const Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.black,
                  ))
            ],
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: SizedBox(
                          width: 380,
                          height: 56,

                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.mainColor),
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: _mentee!.fullName,
                              fillColor: AppColors.inputColor,
                              filled: true,
                            ),
                            style: const TextStyle(

                              color: Colors.black,
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
                      child: SizedBox(
                        width: 380,
                        height: 56,

                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius.circular(12)),
                            hintText:  _mentee!.university,
                            fillColor: AppColors.inputColor,
                            filled: true,
                          ),
                          style: const TextStyle(

                            color: Colors.black,
                            fontFamily: 'Urbanist',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: <Widget>[
              //     Expanded(
              //       child: Padding(
              //         padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
              //         child: Container(
              //           width: 380,
              //           height: 56,
              //           child: Container(
              //             child: TextField(
              //               decoration: InputDecoration(
              //                 border: OutlineInputBorder(
              //                     borderSide: BorderSide.none,
              //                     borderRadius: BorderRadius.circular(12)),
              //                 focusedBorder: OutlineInputBorder(
              //                     borderSide: BorderSide(color: AppColors.mainColor),
              //                     borderRadius: BorderRadius.circular(12)),
              //                 hintText: '10/10/2000',
              //                 fillColor: AppColors.inputColor,
              //                 filled: true,
              //                 suffixIcon: Icon(Icons.edit_calendar),
              //               ),
              //               style: TextStyle(
              //                 color: Colors.black,
              //                 fontFamily: 'Urbanist',
              //                 fontSize: 14,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
                      child: SizedBox(
                        width: 380,
                        height: 56,
 
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: _mentee!.address,
                            fillColor: AppColors.inputColor,
                            filled: true,
                            suffixIcon: const Icon(Icons.mail_sharp),
                          ),
                          style: const TextStyle(

                            fontFamily: 'Urbanist',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
                      child: SizedBox(
                        width: 380,
                        height: 56,

                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.mainColor),
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: _mentee!.country,
                              fillColor: AppColors.inputColor,
                              filled: true,
                              suffixIcon: const Icon(Icons.keyboard_arrow_down)
                          ),
                          style: const TextStyle(

                            fontFamily: 'Urbanist',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
                      child: SizedBox(
                        width: 380,
                        height: 56,
                        child: IntlPhoneField(
                          decoration: InputDecoration(
                            labelText: _mentee!.phone,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          initialCountryCode: 'NP',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),

                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
                      child: SizedBox(
                        width: 380,
                        height: 56,
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(

                            enabledBorder: OutlineInputBorder( //<-- SEE HERE
                              borderSide: BorderSide(color: Colors.white24, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder( //<-- SEE HERE
                              borderSide: BorderSide(color: Colors.white24, width: 2),
                            ),
                            filled: true,
                            fillColor: Colors.white12,
                          ),
                          dropdownColor: Colors.white,
                          value: dropdownValue ,

                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>['Male', 'Female', 'LGBT', 'Hide'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 14,fontFamily: 'Urbanist', fontWeight: FontWeight.w600),

                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
                      child: SizedBox(
                        width: 380,
                        height: 56,

                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius.circular(12)),
                            hintText: _mentee!.image,
                            fillColor: AppColors.inputColor,
                            filled: true,
                          ),
                          style: const TextStyle(

                            fontFamily: 'Urbanist',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: SizedBox(
                        height: 58,
                        width: 380,
                        child:  Card(
                          child: ButtonUpdate(route: RoutesClass.getProfileRoute(), title: 'Update',),
                        ),
                      ),
                    ),
                  )
              ),
            ],
          ),

        ),
      ),
    );
  }

}