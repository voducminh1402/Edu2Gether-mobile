import 'package:edu2gether_mobile/models/mentor.dart';
import 'package:edu2gether_mobile/screens/mentor/mentor_profile.dart';
import 'package:edu2gether_mobile/services/mentor_service.dart';
import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:edu2gether_mobile/utilities/dimensions.dart';
import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MentorDetail extends StatefulWidget {
   MentorDetail({super.key, required this.id});
  String id;

  @override
  State<MentorDetail> createState() => _MentorDetailState();
}

class _MentorDetailState extends State<MentorDetail> {

  Mentor? _mentor;

  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    _getData();
  }

  _getData() async {
    _mentor = (await MentorService().getMentorById(widget.id));
    setState(() {
      if(_mentor != null){
        isLoaded = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded ? Scaffold(body: const Center(child: CircularProgressIndicator(),)) :
    Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(

              icon: const Icon(

                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.to(() => MentorProfile(id: "1",));
              },
            ),
            title: BigText(text: "Chi tiết", fontweight: FontWeight.bold, size: Dimension.font12,),
            elevation: 0,
          ),
          body: Padding(padding: EdgeInsets.all(Dimension.width5),child: ListView(
         
            children: [
            Row(
              children: [
                BigText(text: "Thông tin cá nhân", fontweight: FontWeight.bold, size: Dimension.font8,),
              ],
            ),
            SizedBox(height: Dimension.height5,),
            Container(
              height: 196,
              width: 380,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                BigText(text: "Name", color: Colors.black54, size: Dimension.font7,),
                BigText(text: _mentor!.fullName, size: Dimension.font7,),
              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                BigText(text: "Phone", color: Colors.black54, size: Dimension.font7,),
                BigText(text: _mentor!.phone, size: Dimension.font7,),
              ],),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                BigText(text: "Address", color: Colors.black54, size: Dimension.font7,),
                BigText(text: _mentor!.address, size: Dimension.font7,),
              ],),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                BigText(text: "Country", color: Colors.black54, size: Dimension.font7,),
                BigText(text: _mentor!.country, size: Dimension.font7,),
              ],),
                ]),
              ),
            ),
             SizedBox(height: Dimension.height5,),
            Row(
              children: [
                BigText(text: "Học vấn", fontweight: FontWeight.bold, size: Dimension.font8,),
              ],
            ),
            SizedBox(height: Dimension.height5,),
            Container(
              height: 124,
              width: 380,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Trường đại học FPT",  size: Dimension.font8, fontweight: FontWeight.bold,),
              Divider(thickness: 2,),
              BigText(text: "Sinh viên năm 4 - Ngành Kỹ thuật phần mềm",  size: Dimension.font8,),
                ]),
              ),
            ),
            SizedBox(height: Dimension.height5,),
            Row(
              children: [
                BigText(text: "Môn dạy", fontweight: FontWeight.bold, size: Dimension.font8,),
              ],
            ),
            SizedBox(height: Dimension.height5,),
            Container(
              height: 72,
              width: 380,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Toán, Văn, Anh",  size: Dimension.font8, fontweight: FontWeight.bold,),
                ]),
              ),
            ),
            SizedBox(height: Dimension.height5,),
            Row(
              children: [
                BigText(text: "Nơi dạy", fontweight: FontWeight.bold, size: Dimension.font8,),
              ],
            ),
            SizedBox(height: Dimension.height5,),
            Container(
              height: 72,
              width: 380,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Nhà riêng, thư viện, Online",  size: Dimension.font8, fontweight: FontWeight.bold,),
                ]),
              ),
            ),
          ]),),
    );
  }
}