import 'package:flutter/material.dart';
import '../page/page0.dart';

String token = '';
Widget CuPage = const Page0();
int CuPageLV = 0;
// int UserLV = 0;

int PageMemory = 0;

class USERDATA {
  static int UserLV = 0;
  static String NAME = '';
  static String ID = '';
  static String LV = '';
  static String Section = '';
  static String Def = '';
  static String LOCATION = '';

  static List<String> DefList = [];
  static List<String> LOCATIONList = [];
}

// class PageLevel {
//   static int page01 = 1;
//   static int page02 = 1;
//   static int page03 = 4;
//   static int page04 = 1;
//   static int page05 = 1;
//   static int page06 = 1;
//   static int page07 = 1;
//   static int page08 = 1;
//   static int page09 = 1;
//   static int page10 = 1;
// }

class logindata {
  static bool isControl = false;
  static String userID = '';
  static String userPASS = '';
}

// String GLOserver = 'http://127.0.0.1:16010/';
String GLOserver = 'http://172.23.10.40:16010/';

//3310298495
