import 'dart:async';

import 'package:flutter/material.dart';

import '../../data/global.dart';
import '../../model/model.dart';
import 'FIRSTuiVAR.dart';
import 'P1-2TABLE/p1maintable.dart';
import 'P1-3INSTRUMENT/p1mainseins.dart';

late BuildContext FIRSTUIMAINcontext;

class FIRSTUIMAIN extends StatelessWidget {
  FIRSTUIMAIN({
    Key? key,
    this.sapdata,
    this.INSlist,
  }) : super(key: key);
  List<dataset>? sapdata;
  List<String>? INSlist;
  @override
  Widget build(BuildContext context) {
    FIRSTUIMAINcontext = context;
    return FIRSTUIMAINbody(
      sapdata: sapdata,
      INSlist: INSlist,
    );
  }
}

class FIRSTUIMAINbody extends StatelessWidget {
  FIRSTUIMAINbody({
    Key? key,
    this.sapdata,
    this.INSlist,
  }) : super(key: key);
  List<dataset>? sapdata;
  List<String>? INSlist;
  @override
  Widget build(BuildContext context) {
    PageMemory = 1;
    double maxwidth = 1000;
    double maxheight = 450;
    return Container(
      width: maxwidth,
      height: maxheight,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(0)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 2, bottom: 1, start: 2, end: 2),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(0)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 1, bottom: 2, start: 2, end: 1),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(0)),
                      ),
                      child: MAINTABLEP1(
                        sapdata: sapdata,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 2, bottom: 2, start: 1, end: 2),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                ),
                child: SELECtINSTRUMENT(
                  INSlist: INSlist,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
