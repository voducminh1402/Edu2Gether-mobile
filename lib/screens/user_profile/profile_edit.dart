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

  late List<Mentee>? _mentee = [];

  @override
  void initState(){
    super.initState();
    _getMentee();
  }

  _getMentee() async{
    _mentee = (await MenteeService().getMentee());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }


  String dropdownValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListView.builder(
          itemBuilder: (context, i){
            return GestureDetector(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.white,
                appBar: AppBar(
                  leading: BackButton(
                    color: Colors.black,
                    onPressed: () async{
                      Navigator.pop(context,false);
                      Mentee? mentee = await MenteeService().getMenteeById(_mentee![i].id);
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => Profile(id: '', fullName: '', phone: '', address: '', university: '', country: '', gender: '', image: '',)));
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
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 24, right: 24),
                              child: Container(
                                width: 380,
                                height: 56,
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(12)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: AppColors.mainColor),
                                          borderRadius: BorderRadius.circular(12)),
                                      hintText: 'Hieu Trung',
                                      fillColor: AppColors.inputColor,
                                      filled: true,
                                    ),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Urbanist',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                            child: Container(
                              width: 380,
                              height: 56,
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.mainColor),
                                        borderRadius: BorderRadius.circular(12)),
                                    hintText: 'Tran',
                                    fillColor: AppColors.inputColor,
                                    filled: true,
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                            child: Container(
                              width: 380,
                              height: 56,
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.mainColor),
                                        borderRadius: BorderRadius.circular(12)),
                                    hintText: '10/10/2000',
                                    fillColor: AppColors.inputColor,
                                    filled: true,
                                    suffixIcon: Icon(Icons.edit_calendar),
                                  ),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                            child: Container(
                              width: 380,
                              height: 56,
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.mainColor),
                                        borderRadius: BorderRadius.circular(12)),
                                    hintText: 'hieutrung@gmail.com',
                                    fillColor: AppColors.inputColor,
                                    filled: true,
                                    suffixIcon: Icon(Icons.mail_sharp),
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                            child: Container(
                              width: 380,
                              height: 56,
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(12)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: AppColors.mainColor),
                                          borderRadius: BorderRadius.circular(12)),
                                      hintText: 'VietNam',
                                      fillColor: AppColors.inputColor,
                                      filled: true,
                                      suffixIcon: Icon(Icons.keyboard_arrow_down)
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                            child: Container(
                              width: 380,
                              height: 56,
                              child: Container(
                                  child: IntlPhoneField(
                                    decoration: InputDecoration(
                                      labelText: 'Phone Number',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                    initialCountryCode: 'NP',
                                    onChanged: (phone) {
                                      print(phone.completeNumber);
                                    },
                                  )
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
                            child: Container(
                              width: 380,
                              height: 56,
                              child: Container(
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
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
                                  value: dropdownValue,
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
                                        style: TextStyle(fontSize: 14,fontFamily: 'Urbanist', fontWeight: FontWeight.w600),
                                      ),
                                    );
                                  }).toList(),
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
                            child: Container(
                              width: 380,
                              height: 56,
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(12)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.mainColor),
                                        borderRadius: BorderRadius.circular(12)),
                                    hintText: 'Student',
                                    fillColor: AppColors.inputColor,
                                    filled: true,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
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
            );
          }
      ),
    );
  }

}