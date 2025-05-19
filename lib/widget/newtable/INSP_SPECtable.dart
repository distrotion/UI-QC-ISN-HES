import 'package:flutter/material.dart';

import 'tablebox.dart';

class INSP_SPECtable extends StatelessWidget {
  const INSP_SPECtable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: rowbox_type0(
            Head: "MIC_SHORTTEXT",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "REC_TYPE",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "MIC",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "ANSWER",
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: "ANSWER_CODE",
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

class INSP_SPECitem extends StatelessWidget {
  INSP_SPECitem({
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
          flex: 2,
          child: rowbox_type0(
            Head: text01,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text02,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text03,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text04,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text05,
          ),
        ),
        Expanded(
          flex: 1,
          child: rowbox_type0(
            Head: text06,
          ),
        ),
      ],
    );
  }
}
