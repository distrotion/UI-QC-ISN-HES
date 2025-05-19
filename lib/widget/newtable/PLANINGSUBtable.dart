import 'package:flutter/material.dart';

import 'tablebox.dart';

class PLANINGSUBtable extends StatelessWidget {
  const PLANINGSUBtable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "ITEM",
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "MATERIAL",
          ),
        ),
        Expanded(
          flex: 3,
          child: rowbox_type0(
            Head: "MATERIAL_TEXT",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "REQ_QTY",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "BATCH_QTY",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "BATCH",
          ),
        ),
      ],
    );
  }
}

class PLANINGSUBitem extends StatelessWidget {
  PLANINGSUBitem({
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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text01,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            // Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: text02,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            // Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 3,
          child: rowbox_type0(
            Head: text03,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            // Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text04,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            // Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text05,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            // Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text06,
            // Colorss: (holding ?? 0) % 2 == 0 ? Colors.white : Colors.grey,
            // Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
      ],
    );
  }
}
