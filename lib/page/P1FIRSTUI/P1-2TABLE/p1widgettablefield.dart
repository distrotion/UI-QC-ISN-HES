import 'package:flutter/material.dart';

import '../../../styles/TextStyle.dart';

class P1WIDGETFIELD extends StatefulWidget {
  P1WIDGETFIELD({
    Key? key,
    this.height,
    this.SELECTFUNC,
    this.isSELECTFUNC,
    this.B01,
    this.B02,
    this.B03,
    this.B04,
    this.B05,
    this.B06,
    this.B07,
    this.B08,
    this.B09,
    this.B10,
    this.B11,
    this.B12,
    this.CB01,
    this.CB02,
    this.CB03,
    this.CB04,
    this.CB05,
    this.CB06,
    this.CB07,
    this.CB08,
    this.FCB,
    this.forntsize,
  }) : super(key: key);
  double? height;
  Function? SELECTFUNC;
  bool? isSELECTFUNC;
  double? forntsize;
  String? B01;
  String? B02;
  String? B03;
  String? B04;
  String? B05;
  String? B06;
  String? B07;
  String? B08;
  String? B09;
  String? B10;
  String? B11;
  String? B12;

  Color? CB01;
  Color? CB02;
  Color? CB03;
  Color? CB04;
  Color? CB05;
  Color? CB06;
  Color? CB07;
  Color? CB08;

  Color? FCB;

  @override
  State<P1WIDGETFIELD> createState() => _P1WIDGETFIELDState();
}

class _P1WIDGETFIELDState extends State<P1WIDGETFIELD> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: widget.height ?? 35,
              decoration: BoxDecoration(
                color: widget.CB01 ?? Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(0)),
              ),
              child: Center(
                child: Text(widget.B01 ?? '',
                    style: TxtStyle(
                        color: widget.FCB ?? Colors.black,
                        fontSize: widget.forntsize ?? 14)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: widget.height ?? 35,
              decoration: BoxDecoration(
                color: widget.CB02 ?? Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(0)),
              ),
              child: Center(
                child: Text(widget.B02 ?? '',
                    style: TxtStyle(
                        color: widget.FCB ?? Colors.black,
                        fontSize: widget.forntsize ?? 14)),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: widget.height ?? 35,
              decoration: BoxDecoration(
                color: widget.CB03 ?? Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(0)),
              ),
              child: Center(
                child: Text(widget.B03 ?? '',
                    style: TxtStyle(
                        color: widget.FCB ?? Colors.black,
                        fontSize: widget.forntsize ?? 14)),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: widget.height ?? 35,
              decoration: BoxDecoration(
                color: widget.CB04 ?? Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(0)),
              ),
              child: Center(
                child: Text(widget.B04 ?? '',
                    style: TxtStyle(
                        color: widget.FCB ?? Colors.black,
                        fontSize: widget.forntsize ?? 14)),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: widget.height ?? 35,
              decoration: BoxDecoration(
                color: widget.CB05 ?? Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(0)),
              ),
              child: Center(
                child: Text(widget.B05 ?? '',
                    style: TxtStyle(
                        color: widget.FCB ?? Colors.black,
                        fontSize: widget.forntsize ?? 14)),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: widget.height ?? 35,
              decoration: BoxDecoration(
                color: widget.CB06 ?? Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(0)),
              ),
              child: Center(
                child: Text(widget.B06 ?? '',
                    style: TxtStyle(
                        color: widget.FCB ?? Colors.black,
                        fontSize: widget.forntsize ?? 14)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: widget.height ?? 35,
              decoration: BoxDecoration(
                color: widget.CB07 ?? Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(0)),
              ),
              child: Center(
                child: Text(widget.B07 ?? '',
                    style: TxtStyle(
                        color: widget.FCB ?? Colors.black,
                        fontSize: widget.forntsize ?? 14)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: widget.height ?? 35,
              decoration: BoxDecoration(
                color: widget.CB08 ?? Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(0)),
              ),
              child: widget.isSELECTFUNC ?? false
                  ? Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: () {
                          widget.SELECTFUNC!(
                                widget.B01,
                                widget.B11,
                                widget.B12,
                              ) ??
                              () {};
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: const Center(
                            child: Text("SELECT"),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(widget.B08 ?? '',
                          style: TxtStyle(
                              color: widget.FCB ?? Colors.black,
                              fontSize: widget.forntsize ?? 14)),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
