import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Dimension {
  // static double screenHeight = window.physicalSize.height;
  // static double screenWidth = window.physicalSize.width;
  static Size screenSize = WidgetsBinding.instance.window.physicalSize;
  static double screenHeight = screenSize.height;
  static double screenWidth = screenSize.width;


  // static double pageView = screenHeight / 2.64;
  // static double pageViewContainer = screenHeight / 3.84;
  // static double pageViewTextContainer = screenHeight / 7.03;


  static double height3 = screenHeight / 294;
  static double height5 = screenHeight / 176.4;
  static double height8 = screenHeight / 110.25;
  static double height10 = screenHeight / 88.2;
  static double height12 = screenHeight / 73.5;
  static double height16 = screenHeight / 55.125;
  static double height18 = screenHeight / 49;
  static double height20 = screenHeight / 44.1;
  static double height24 = screenHeight / 36.75;
  static double height28 = screenHeight / 31.5;
  static double height50 = screenHeight / 17.64;
  static double height100 = screenHeight / 8.82;

  static double height200 = screenHeight / 4.41;
  static double width5 = screenHeight / 176.4;
  static double width3 = screenHeight / 294;

  static double width10 = screenHeight / 88.2;
  static double width13 = screenHeight / 67.8;
  static double width15 = screenHeight / 58.8;
  static double width16 = screenHeight / 55.125;
  static double width18 = screenHeight / 49;
  static double width24 = screenHeight / 36.75;
  static double width28 = screenHeight / 31.5;

  static double width50 = screenHeight / 17.64;
  static double width100 = screenHeight / 8.82;
  static double width200 = screenHeight / 4.41;

  static double font5 = screenHeight / 170;
  static double font6 = screenHeight / 147.33;
  static double font8 = screenHeight / 110.25;

  static double font10 = screenHeight / 88.2;
  static double font12 = screenHeight / 73.5;
  static double font14 = screenHeight / 63;
  static double font16 = screenHeight / 52.75;
  static double font18 = screenHeight / 55.125;
  static double font20 = screenHeight / 44.1;
  static double font24 = screenHeight / 36.75;
  static double font32 = screenHeight / 27.5625;
  static double font40 = screenHeight / 22.05;
  static double font48 = screenHeight / 18.375;

  static String fontBold = 'Bold';
  static String fontSemiBold = 'Semibold';
  static String fontMedium = 'Medium';
  static String fontRegular = 'Regular';


  static double radius12 = screenHeight / 73.5;
  static double radius16 = screenHeight / 55.125;
  static double radius100 = screenHeight / 8.82;

  // static double listViewImgSize = screenWidth / 3.25;
  // static double listViewTextSize = screenWidth / 3.9;
  //
  // static double popularFoodImgSize = screenHeight / 2.41;
  //
  // static double iconSize16 = screenWidth / 52.75;
  // static double iconSize24 = screenWidth / 35.17;
  //
  // static double bottomHeight = screenHeight / 7.03;

}
