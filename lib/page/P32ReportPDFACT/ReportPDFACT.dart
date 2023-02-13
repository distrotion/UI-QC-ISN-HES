import 'package:flutter/material.dart';

import '../../widget/common/Loading.dart';
import '../../widget/common/imgset.dart';
import '../../widget/function/helper.dart';

class ReportPDFACT extends StatefulWidget {
  const ReportPDFACT({Key? key}) : super(key: key);

  @override
  State<ReportPDFACT> createState() => _ReportPDFACTState();
}

class _ReportPDFACTState extends State<ReportPDFACT> {
  final GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                onTap: () {
                  PDFloader(context);
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    capture(
                      _globalKey,
                    ).then((value) {
                      print(value);

                      Navigator.pop(context);
                    });
                  });
                },
                child: Container(
                  color: Colors.yellow,
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text("Print"),
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: RepaintBoundary(
              key: _globalKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 2000,
                        width: 1364,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          // color: Colors.red,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Column(
                          children: [
                            HEAD3SLOT(
                              ListFlex: const [5, 4, 1],
                              widget01: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Container(
                                      height: 120,
                                      width: 230,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/logoonly_tpkpng.png",
                                          ),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // PicShow(
                                  //     width: 120, height: 230, base64: tpklogo),
                                  SizedBox(
                                    height: 120,
                                    width: 400,
                                    child: Column(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 20,
                                          ),
                                          child: Text(
                                            "THAI PARKERIZING CO.,LTD.",
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 40,
                                          ),
                                          child: Text(
                                            "Heat & Surface Treatment Division",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              widget02: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 120,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black,
                                              width: 3,
                                              style: BorderStyle.solid),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 20,
                                                  ),
                                                  child: Text(
                                                    "Quality Testing Report (ISONITE ESIE 1)",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 30, bottom: 10),
                                                  child: Text(
                                                    "(ใบรายงานผลการตรวจสอบผลิตภัณฑ์สำหรับกระบวนการ ISN)",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      height: 60,
                                      child: Center(
                                        child: Text(
                                          "FR-HQC-03/028-00-25/10/22",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              widget03: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 40,
                                          ),
                                          child: Text(
                                            "PAGE",
                                            style: TextStyle(
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 30, bottom: 10),
                                          child: Text(
                                            "1/1",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            HEAD4SLOT(
                              ListFlex: [4, 8, 3, 5],
                            ),
                            BODY4SLOT(
                              ListFlex: [4, 8, 3, 5],
                            ),
                            BODY2SLOT(
                              ListFlex: [4, 16],
                            ),
                            BODY6SLOT(
                              ListFlex: [4, 6, 3, 3, 1, 3],
                            ),
                            HEAD1SLOT(),
                            HEAD7SLOT(
                              ListFlex: [6, 1, 4, 2, 2, 2, 2],
                            ),
                            BODY7SLOT(
                              ListFlex: [6, 1, 4, 2, 2, 2, 2],
                            ),
                            BODY7SLOT(
                              ListFlex: [6, 1, 4, 2, 2, 2, 2],
                            ),
                            HEAD1SLOT(),
                            HEAD7SLOT(
                              ListFlex: [5, 1, 3, 2, 3, 4, 4],
                            ),
                            BODY7SLOT(
                              ListFlex: [5, 1, 3, 2, 3, 4, 4],
                            ),
                            BODY7SLOT(
                              ListFlex: [5, 1, 3, 2, 3, 4, 4],
                            ),
                            BODY7SLOT(
                              ListFlex: [5, 1, 3, 2, 3, 4, 4],
                            ),
                            BODY7SLOT(
                              ListFlex: [5, 1, 3, 2, 3, 4, 4],
                            ),
                            BODY7SLOT(
                              ListFlex: [5, 1, 3, 2, 3, 4, 4],
                            ),
                            HEAD1SLOT(),
                            HEAD10SLOT(
                              ListFlex: [20, 4, 12, 8, 6, 6, 4, 4, 4, 4],
                            ),
                            BODY10SLOT(
                              ListFlex: [20, 4, 12, 8, 6, 6, 4, 4, 4, 4],
                            ),
                            BODY10SLOT(
                              ListFlex: [20, 4, 12, 8, 6, 6, 4, 4, 4, 4],
                            ),
                            BODY10SLOT(
                              ListFlex: [20, 4, 12, 8, 6, 6, 4, 4, 4, 4],
                            ),
                            BODY10SLOT(
                              ListFlex: [20, 4, 12, 8, 6, 6, 4, 4, 4, 4],
                            ),
                            PICSLOT(),
                            TAILSLOT(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class HEAD3SLOT extends StatelessWidget {
  HEAD3SLOT({
    Key? key,
    this.ListFlex,
    this.widget01,
    this.widget02,
    this.widget03,
  }) : super(key: key);

  List<int>? ListFlex;
  Widget? widget01;
  Widget? widget02;
  Widget? widget03;

  @override
  Widget build(BuildContext context) {
    List<int> _ListFlex = ListFlex ?? [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: _ListFlex[0],
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
              child: widget01 ?? const SizedBox(),
            ),
          ),
          Expanded(
            flex: _ListFlex[1],
            child: Container(
              height: 180,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
              child: widget02 ?? const SizedBox(),
            ),
          ),
          Expanded(
            flex: _ListFlex[2],
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
              height: 180,
              child: widget03 ?? const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}

class BODY3SLOT extends StatelessWidget {
  BODY3SLOT({
    Key? key,
    this.ListFlex,
    this.widget01,
    this.widget02,
    this.widget03,
  }) : super(key: key);
  List<int>? ListFlex;
  Widget? widget01;
  Widget? widget02;
  Widget? widget03;

  @override
  Widget build(BuildContext context) {
    List<int> _ListFlex = ListFlex ?? [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Row(
        children: [
          Expanded(
            flex: _ListFlex[0],
            child: Container(
              child: widget01 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[1],
            child: Container(
              child: widget02 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[2],
            child: Container(
              child: widget03 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HEAD4SLOT extends StatelessWidget {
  HEAD4SLOT({
    Key? key,
    this.ListFlex,
    this.hig,
    this.padd,
    this.widget01,
    this.widget02,
    this.widget03,
    this.widget04,
  }) : super(key: key);
  List<int>? ListFlex;
  double? hig;
  double? padd;
  Widget? widget01;
  Widget? widget02;
  Widget? widget03;
  Widget? widget04;

  @override
  Widget build(BuildContext context) {
    List<int> _ListFlex = ListFlex ?? [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    return Padding(
      padding: EdgeInsets.only(right: padd ?? 8, left: padd ?? 8),
      child: Row(
        children: [
          Expanded(
            flex: _ListFlex[0],
            child: Container(
              child: widget01 ?? const SizedBox(),
              height: hig ?? 55,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[1],
            child: Container(
              child: widget02 ?? const SizedBox(),
              height: hig ?? 55,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[2],
            child: Container(
              child: widget03 ?? const SizedBox(),
              height: hig ?? 55,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[3],
            child: Container(
              child: widget04 ?? const SizedBox(),
              height: hig ?? 55,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BODY4SLOT extends StatelessWidget {
  BODY4SLOT({
    Key? key,
    this.ListFlex,
    this.hig,
    this.padd,
    this.widget01,
    this.widget02,
    this.widget03,
    this.widget04,
  }) : super(key: key);
  List<int>? ListFlex;
  double? hig;
  double? padd;
  Widget? widget01;
  Widget? widget02;
  Widget? widget03;
  Widget? widget04;

  @override
  Widget build(BuildContext context) {
    List<int> _ListFlex = ListFlex ?? [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    return Padding(
      padding: EdgeInsets.only(right: padd ?? 8, left: padd ?? 8),
      child: Row(
        children: [
          Expanded(
            flex: _ListFlex[0],
            child: Container(
              child: widget01 ?? const SizedBox(),
              height: hig ?? 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[1],
            child: Container(
              child: widget02 ?? const SizedBox(),
              height: hig ?? 47,
              decoration: const BoxDecoration(
                border: Border(
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[2],
            child: Container(
              child: widget03 ?? const SizedBox(),
              height: hig ?? 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[3],
            child: Container(
              child: widget04 ?? const SizedBox(),
              height: hig ?? 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BODY2SLOT extends StatelessWidget {
  BODY2SLOT({
    Key? key,
    this.ListFlex,
    this.widget01,
    this.widget02,
  }) : super(key: key);
  List<int>? ListFlex;
  Widget? widget01;
  Widget? widget02;

  @override
  Widget build(BuildContext context) {
    List<int> _ListFlex = ListFlex ?? [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Row(
        children: [
          Expanded(
            flex: _ListFlex[0],
            child: Container(
              child: widget01 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[1],
            child: Container(
              child: widget02 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BODY6SLOT extends StatelessWidget {
  BODY6SLOT({
    Key? key,
    this.ListFlex,
    this.widget01,
    this.widget02,
    this.widget03,
    this.widget04,
    this.widget05,
    this.widget06,
  }) : super(key: key);
  List<int>? ListFlex;
  Widget? widget01;
  Widget? widget02;
  Widget? widget03;
  Widget? widget04;
  Widget? widget05;
  Widget? widget06;

  @override
  Widget build(BuildContext context) {
    List<int> _ListFlex = ListFlex ?? [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Row(
        children: [
          Expanded(
            flex: _ListFlex[0],
            child: Container(
              child: widget01 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[1],
            child: Container(
              child: widget02 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[2],
            child: Container(
              child: widget03 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[3],
            child: Container(
              child: widget04 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[4],
            child: Container(
              child: widget05 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[5],
            child: Container(
              child: widget06 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HEAD1SLOT extends StatelessWidget {
  HEAD1SLOT({
    Key? key,
    this.widget01,
  }) : super(key: key);
  Widget? widget01;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 8, left: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: widget01 ?? const SizedBox(),
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HEAD7SLOT extends StatelessWidget {
  HEAD7SLOT({
    Key? key,
    this.ListFlex,
    this.widget01,
    this.widget02,
    this.widget03,
    this.widget04,
    this.widget05,
    this.widget06,
    this.widget07,
  }) : super(key: key);
  List<int>? ListFlex;
  Widget? widget01;
  Widget? widget02;
  Widget? widget03;
  Widget? widget04;
  Widget? widget05;
  Widget? widget06;
  Widget? widget07;

  @override
  Widget build(BuildContext context) {
    List<int> _ListFlex = ListFlex ?? [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Row(
        children: [
          Expanded(
            flex: _ListFlex[0],
            child: Container(
              child: widget01 ?? const SizedBox(),
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[1],
            child: Container(
              child: widget02 ?? const SizedBox(),
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[2],
            child: Container(
              child: widget03 ?? const SizedBox(),
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[3],
            child: Container(
              child: widget04 ?? const SizedBox(),
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[4],
            child: Container(
              child: widget05 ?? const SizedBox(),
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[5],
            child: Container(
              child: widget06 ?? const SizedBox(),
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[6],
            child: Container(
              child: widget07 ?? const SizedBox(),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
              height: 55,
            ),
          ),
        ],
      ),
    );
  }
}

class BODY7SLOT extends StatelessWidget {
  BODY7SLOT({
    Key? key,
    this.ListFlex,
    this.widget01,
    this.widget02,
    this.widget03,
    this.widget04,
    this.widget05,
    this.widget06,
    this.widget07,
  }) : super(key: key);
  List<int>? ListFlex;
  Widget? widget01;
  Widget? widget02;
  Widget? widget03;
  Widget? widget04;
  Widget? widget05;
  Widget? widget06;
  Widget? widget07;

  @override
  Widget build(BuildContext context) {
    List<int> _ListFlex = ListFlex ?? [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Row(
        children: [
          Expanded(
            flex: _ListFlex[0],
            child: Container(
              child: widget01 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[1],
            child: Container(
              child: widget02 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[2],
            child: Container(
              child: widget03 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[3],
            child: Container(
              child: widget04 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[4],
            child: Container(
              child: widget05 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[5],
            child: Container(
              child: widget06 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[6],
            child: Container(
              child: widget07 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HEAD10SLOT extends StatelessWidget {
  HEAD10SLOT({
    Key? key,
    this.ListFlex,
    this.widget01,
    this.widget02,
    this.widget03,
    this.widget04,
    this.widget05,
    this.widget06,
    this.widget07,
    this.widget08,
    this.widget09,
    this.widget10,
  }) : super(key: key);
  List<int>? ListFlex;
  Widget? widget01;
  Widget? widget02;
  Widget? widget03;
  Widget? widget04;
  Widget? widget05;
  Widget? widget06;
  Widget? widget07;
  Widget? widget08;
  Widget? widget09;
  Widget? widget10;

  @override
  Widget build(BuildContext context) {
    List<int> _ListFlex = ListFlex ??
        [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Row(
        children: [
          Expanded(
            flex: _ListFlex[0],
            child: Container(
              child: widget01 ?? const SizedBox(),
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[1],
            child: Container(
              child: widget02 ?? const SizedBox(),
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[2],
            child: Container(
              child: widget03 ?? const SizedBox(),
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[3],
            child: Container(
              child: widget04 ?? const SizedBox(),
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[4],
            child: Container(
              child: widget05 ?? const SizedBox(),
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[5],
            child: Container(
              child: widget06 ?? const SizedBox(),
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[6],
            child: Container(
              child: widget07 ?? const SizedBox(),
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[7],
            child: Container(
              child: widget08 ?? const SizedBox(),
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[8],
            child: Container(
              child: widget09 ?? const SizedBox(),
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  top: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[9],
            child: Container(
              child: widget10 ?? const SizedBox(),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
              height: 55,
            ),
          ),
        ],
      ),
    );
  }
}

class BODY10SLOT extends StatelessWidget {
  BODY10SLOT({
    Key? key,
    this.ListFlex,
    this.widget01,
    this.widget02,
    this.widget03,
    this.widget04,
    this.widget05,
    this.widget06,
    this.widget07,
    this.widget08,
    this.widget09,
    this.widget10,
  }) : super(key: key);
  List<int>? ListFlex;
  Widget? widget01;
  Widget? widget02;
  Widget? widget03;
  Widget? widget04;
  Widget? widget05;
  Widget? widget06;
  Widget? widget07;
  Widget? widget08;
  Widget? widget09;
  Widget? widget10;

  @override
  Widget build(BuildContext context) {
    List<int> _ListFlex = ListFlex ?? [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Row(
        children: [
          Expanded(
            flex: _ListFlex[0],
            child: Container(
              child: widget01 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[1],
            child: Container(
              child: widget02 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[2],
            child: Container(
              child: widget03 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[3],
            child: Container(
              child: widget04 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[4],
            child: Container(
              child: widget05 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[5],
            child: Container(
              child: widget06 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[6],
            child: Container(
              child: widget07 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[7],
            child: Container(
              child: widget08 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[8],
            child: Container(
              child: widget09 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  // top: BorderSide(
                  //     color: Colors.black,
                  //     width: 3,
                  //     style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Expanded(
            flex: _ListFlex[9],
            child: Container(
              child: widget10 ?? const SizedBox(),
              height: 47,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.black, width: 3, style: BorderStyle.solid),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PICSLOT extends StatelessWidget {
  PICSLOT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 8, left: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 380,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TAILSLOT extends StatelessWidget {
  TAILSLOT({
    Key? key,
    this.widget01,
    this.widget02,
    this.widget03,
    this.widget04,
    this.widget05,
    this.widget06,
  }) : super(key: key);
  Widget? widget01;
  Widget? widget02;
  Widget? widget03;
  Widget? widget04;
  Widget? widget05;
  Widget? widget06;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        // top: 12,
        bottom: 12,
        right: 8,
        left: 8,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                height: 260,
                child: Column(
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 130,
                            child: Column(
                              children: [
                                HEAD4SLOT(
                                  padd: 0,
                                  hig: 40,
                                  ListFlex: const [1, 1, 1, 1],
                                ),
                                BODY4SLOT(
                                  padd: 0,
                                  hig: 90,
                                  ListFlex: const [1, 1, 1, 1],
                                ),
                              ],
                            ),

                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black, width: 3),
                            // ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 11,
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
