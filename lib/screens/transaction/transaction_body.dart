import 'package:edu2gether_mobile/widgets/big_text.dart';
import 'package:edu2gether_mobile/widgets/defination_bottom_nav_text.dart';
import 'package:edu2gether_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionBody extends StatelessWidget {
  const TransactionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //list transaction
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 700,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(left: 30, right: 20),
                child: Row(
                  children: [
                    //image section
                    Container(
                      width:140,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color:Colors.white38,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/image/advancedjava.png"
                              )
                          )
                      ),
                    ),
                    //text container
                    Expanded(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: "Advanced Java Development"),
                              SizedBox(height: 10,),
                              SmallText(text: "A basic course for Dev"),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    margin: EdgeInsets.only(right: 15, bottom: 10),
                                    child: Icon(Icons.paid, color: Colors.blueAccent, size: 20),
                                  ),
                                  DefinationBottomNavText(text: "Paid")
                                ],
                              ),
                              SizedBox(height: 15,),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
