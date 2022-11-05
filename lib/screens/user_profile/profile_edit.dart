import 'package:edu2gether_mobile/screens/user_profile/profile.dart';
import 'package:edu2gether_mobile/services/mentee_service.dart';
import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../models/mentee.dart';

import 'package:edu2gether_mobile/models/authen_response.dart';
import 'package:get/get.dart';


class ProfileEdit extends StatefulWidget{

  String id;
  AuthenResponse user;


  ProfileEdit({required this.id, required this.user, Key? key}) : super(key: key);


  @override
  State<ProfileEdit> createState() => _profileEditState();

}

class _profileEditState extends State<ProfileEdit> {

  Mentee? _mentee;

  var isLoaded = false;

  late String? _fullName;
  late String _phone;
  late String _address;
  late String _university;
  late String _country = "VN";
  late String _gender = "Male";
  late String _image;

  @override
  void initState(){
    super.initState();
    _getMentee();
  }


  _getMentee() async{
    if(widget.user!.isConfirmedInfo){
      _mentee = (await MenteeService().getMenteeById(widget.id));
    }
    else {
      isLoaded = true;
      _fullName = widget.user!.name;
      _image = widget.user!.image ?? "";
      _phone = widget.user!.phone ?? "";
    }
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if(_mentee != null){
      _country = _mentee!.country;
      _fullName = _mentee!.fullName;
      _address = _mentee!.address;
      _phone = _mentee!.phone;
      _university = _mentee!.university;
      _image = _mentee!.image;
      dropdownValue = _mentee!.gender;
      isLoaded = true;
    }
  }

  String dropdownValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          maxHeight: MediaQuery.of(context).size.height + 300
        ),
        child: Scaffold(
          //resizeToAvoidBottomInset: false,
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
          body: isLoaded == false ? Center(child: CircularProgressIndicator(),): Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24,top: 5),
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
                              labelText: 'Full Name',
                              hintText: _mentee?.fullName ?? widget.user!.name,
                              fillColor: AppColors.inputColor,
                              filled: true,
                            ),
                            style: const TextStyle(

                              color: Colors.black,
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            onChanged: (value){
                              setState(() {
                                _fullName = value.trim();
                              });

                            },
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
                            labelText: 'University',
                            hintText:  _mentee?.university,
                            fillColor: AppColors.inputColor,
                            filled: true,
                          ),
                          style: const TextStyle(

                            color: Colors.black,
                            fontFamily: 'Urbanist',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          onChanged: (value){
                            _university = value.trim();
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

                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius.circular(12)),
                            labelText: 'Address',
                            hintText: _mentee?.address,
                            fillColor: AppColors.inputColor,
                            filled: true,
                            suffixIcon: const Icon(Icons.mail_sharp),
                          ),
                          style: const TextStyle(

                            fontFamily: 'Urbanist',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          onChanged: (value){
                            _address = value.trim();
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
                        child: IntlPhoneField(
                          decoration: InputDecoration(
                            labelText: 'Phone',
                            hintText: _mentee?.phone ?? widget.user?.phone,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          initialCountryCode: 'VN',
                          onChanged: (phone) {
                            _phone = phone.completeNumber.toString().trim();
                          },
                          onCountryChanged: (country) {
                            _country = country.name.toString().trim();
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
                              _gender = dropdownValue.trim();
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
                            labelText: 'Image Link',
                            hintText: _mentee?.image,
                            fillColor: AppColors.inputColor,
                            filled: true,
                          ),
                          style: const TextStyle(

                            fontFamily: 'Urbanist',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          onChanged: (value){
                            _image = value.trim();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimension.height50,
              ),
              SizedBox(
                            height: 58,
                            width: 380,
                            child:  Card(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    minimumSize: Size(MediaQuery.of(context).size.width, 54),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    textStyle:
                                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  Mentee mentee = Mentee(id: widget.id, fullName: _fullName, phone: _phone, address: _address, university: _university, country: _country, gender: _gender, image: _image);
                                  MenteeService().editMentee(mentee, !widget.user!.isConfirmedInfo);
                                },
                                child: Text(
                                    'Update'
                                ),
                              ),
                            ),
                          ),
            ],
          ),

        ),
      ),
    );


  }

}