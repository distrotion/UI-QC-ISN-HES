import 'package:flutter/material.dart';

import 'tablebox.dart';

class FINISHEDGOODTRANFERHStable extends StatelessWidget {
  const FINISHEDGOODTRANFERHStable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "ORDER",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "PRODUCTION NO.",
          ),
        ),
        Expanded(
          flex: 3,
          child: rowbox_type0(
            Head: "CHEMICAL",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "PLANT",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "LOT. NO.",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "Good",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "NOGOOD",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "Store Confirm",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "USER",
          ),
        ),
      ],
    );
  }
}

class FINISHEDGOODTRANFERHSitem extends StatelessWidget {
  FINISHEDGOODTRANFERHSitem({
    super.key,
    this.text01,
    this.text02,
    this.text03,
    this.text04,
    this.text05,
    this.text06,
    this.text07,
    this.text08,
    this.text09,
    this.text10,
    this.text11,
    this.text12,
    this.holding,
    this.Wid01,
  });

  String? text01;
  String? text02;
  String? text03;
  String? text04;
  String? text05;
  String? text06;
  String? text07;
  String? text08;
  String? text09;
  String? text10;
  String? text11;
  String? text12;

  Widget? Wid01;

  bool? holding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Wid01 ?? SizedBox(),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB(
            Head: text01,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB(
            Head: text02,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 3,
          child: rowbox_type0_NB(
            Head: text03,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB(
            Head: text04,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB(
            Head: text05,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB(
            Head: text06,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB(
            Head: text07,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB(
            Head: text08,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB(
            Head: text09,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        // Expanded(
        //   flex: 1,
        //   child: rowbox_type0_NB(
        //     Head: text10,
        //     // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
        //     Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
        //   ),
        // ),
      ],
    );
  }
}
