import 'package:edu2gether_mobile/screens/checkout/momo_checkout.dart';
import 'package:edu2gether_mobile/screens/checkout/tp_bank_checkout.dart';
import 'package:edu2gether_mobile/screens/course_detail/video_course_details.dart';
import 'package:edu2gether_mobile/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ChooseTypeCheckout extends StatefulWidget {
  ChooseTypeCheckout({super.key, required this.id});
  int id;
  

  @override
  State<ChooseTypeCheckout> createState() => _ChooseTypeCheckoutState();
}
enum Options { momo, banking }
class _ChooseTypeCheckoutState extends State<ChooseTypeCheckout> {


Options selectedOption = Options.banking;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
              onPressed: () => Get.to(() => VideoCourseDetails(id: widget.id))
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
              'Choose Payment Method',
            ),
            
          ),
          body: Column(children: [
            RadioListTile<Options>(
    title: ListTile(
  title: Text(
    'Baking',
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
  leading: Image.asset(
    'assets/icons/tpbank_icon.jpg',
    width: 24,
    height: 24,
  ),
),
activeColor: AppColors.mainColor,
      value: Options.banking,
      groupValue: selectedOption,
      controlAffinity: ListTileControlAffinity.trailing,
      onChanged: (Options? value) {
        setState(() {
          selectedOption = value!;
        });
      },
    ),
    RadioListTile<Options>(
      title: ListTile(
  title: Text(
    'Momo',
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
  leading: Image.asset(
    'assets/icons/momo_logo.png',
    width: 24,
    height: 24,
  ),
),
activeColor: AppColors.mainColor,
      value: Options.momo,
      groupValue: selectedOption,
        controlAffinity: ListTileControlAffinity.trailing,
      onChanged: (Options? value) {
        setState(() {
          selectedOption = value!;
        });
      },
    ),
    
          ]),
          persistentFooterButtons: [
            Center(
              child: SizedBox(
                              height: 58,
                              width: 380,
                             
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.mainColor,
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width, 54),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () {
                                    if(selectedOption == Options.banking){
                                      Get.to(() => TPBankCheckOut(id: widget.id,));
                                    }else {
                                      Get.to(() => MomoCheckOut(id: widget.id,));
                                    }
                                  },
                                  child: Text('Check out'),
                                
                              ),
                            ),
            )
          ],
    );
  }
}