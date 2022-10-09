import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class EReceiptBody extends StatefulWidget {
  const EReceiptBody({Key? key}) : super(key: key);

  @override
  State<EReceiptBody> createState() => _EReceiptBodyState();
}

class _EReceiptBodyState extends State<EReceiptBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Container(
            width: 380,
            height: 112,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text: "Course", color: Colors.black, size: 14,),
                      Container(
                        child: BigText(text: "Java-Fullstack", color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text: "Category", color: Colors.black, size: 14,),
                      Container(
                        child: BigText(text: "Back-end Developer", color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            width: 380,
            height: 196,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text: "Name", color: Colors.black, size: 14,),
                      Container(
                        child: BigText(text: "Andrew Ainsley", color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text: "Phone", color: Colors.black, size: 14,),
                      Container(
                        child: BigText(text: "+1 111 467 378 399", color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text: "Email", color: Colors.black, size: 14,),
                      Container(
                        child: BigText(text: "andrew_ainsley@domain.com", color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text: "Country", color: Colors.black, size: 14,),
                      Container(
                        child: BigText(text: "United States", color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            width: 380,
            height: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text: "Price", color: Colors.black, size: 14,),
                      Container(
                        child: BigText(text: "\$40.00", color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text: "Payment Methods", color: Colors.black, size: 14,),
                      Container(
                        child: BigText(text: "Credit Card", color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text: "Date", color: Colors.black, size: 14,),
                      Container(
                        child: BigText(text: "Dec 14, 2024 | 14:27:45 PM", color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text: "Transaction ID", color: Colors.black, size: 14,),
                      Container(
                        child: BigText(text: "SK7263727399", color: Colors.black, fontweight: FontWeight.w600, size: 16,),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text: "Status", color: Colors.black, size: 14,),
                      Container(
                        child: BigText(text: "Paid", color: Colors.blueAccent, fontweight: FontWeight.w600, size: 16,),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
