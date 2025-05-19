import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

//------------------------------------

import '../../bloc/Cubit/Rebuild.dart';

// void GoodPopupTan(BuildContext contextin, String textIn) {
//   showDialog(
//     context: contextin,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         backgroundColor: Colors.transparent,
//         child: _GoodPopupContent(contextin, textIn),
//       );
//     },
//   );
// }

// Widget _GoodPopupContent(BuildContext contextin, String textIn) {
//   return Container(
//     height: 300,
//     width: 300,
//     padding: const EdgeInsets.all(16.0),
//     decoration: BoxDecoration(
//       color: Colors.white.withOpacity(0.9),
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Row(
//           children: [
//             Icon(Icons.Good, color: Colors.red, size: 50),
//             SizedBox(width: 10),
//             Text(
//               "Good",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.red,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 10),
//         Text(
//           textIn,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         SizedBox(height: 10),
//         ElevatedButton(
//           onPressed: () {
//             Navigator.of(contextin).pop();
//           },
//           child: Text("ปิด"),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.red,
//             foregroundColor: Colors.white,
//           ),
//         ),
//       ],
//     ),
//   );
// }
void showGoodPopup(BuildContext context, String GoodMessage) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "",
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (context, anim1, anim2) {
      return _buildGoodDialog(context, GoodMessage);
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -0.2),
          end: Offset(0, 0),
        ).animate(anim1),
        child: FadeTransition(
          opacity: anim1,
          child: child,
        ),
      );
    },
  );
}

Widget _buildGoodDialog(BuildContext context, String textIn) {
  return Center(
    child: Material(
      color: Colors.transparent,
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/lottie/success.json',
              width: 200,
              height: 200,
              repeat: true,
            ),
            SizedBox(height: 10),
            Text(
              "success",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
            SizedBox(height: 8),
            Text(
              textIn,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.shade200,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  "ตกลง",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
