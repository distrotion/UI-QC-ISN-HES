import 'package:flutter/material.dart';

import 'tablebox.dart';

class QMMAASTERtable extends StatelessWidget {
  const QMMAASTERtable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "MATCP",
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "CUS NAME",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "PART NAME/NO",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "Material",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "Received Lot",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "Inspection Lot",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "QTY",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "STATUS",
          ),
        ),
      ],
    );
  }
}

class QMMAASTERitem extends StatelessWidget {
  QMMAASTERitem({
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
    this.holding,
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
  bool? holding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text01,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 2,
          child: rowbox_type0_NB_BIG(
            Head: text02,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text03,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text04,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text05,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text06,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text07,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0_NB_BIG(
            Head: text08,
            Colorss: holding ?? false ? Colors.grey.shade300 : Colors.white,
          ),
        ),
      ],
    );
  }
}
