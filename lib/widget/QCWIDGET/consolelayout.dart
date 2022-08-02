import 'package:flutter/material.dart';

import '../../styles/TextStyle.dart';

class SINGLESHITLAYOUT extends StatelessWidget {
  SINGLESHITLAYOUT({
    Key? key,
    this.childTOP,
    this.childBOT,
    this.childRIGHT,
    this.PO,
    this.CP,
    this.QTY,
    this.PROCESS,
    this.CUSLOT,
    this.TPKLOT,
    this.FG,
    this.CUSTOMER,
    this.PART,
    this.PARTNAME,
    this.MATERIAL,
    this.cocover,
    this.LABEL,
  }) : super(key: key);
  List<Widget>? childTOP;
  List<Widget>? childBOT;
  List<Widget>? childRIGHT;
  String? PO;
  String? CP;
  String? QTY;
  String? PROCESS;
  String? CUSLOT;
  String? TPKLOT;
  String? FG;
  String? CUSTOMER;
  String? PART;
  String? PARTNAME;
  String? MATERIAL;
  String? LABEL;

  Color? cocover;

  @override
  Widget build(BuildContext context) {
    double maxwidth = 850;
    double maxheight = 450;
    return Center(
      child: Container(
        width: maxwidth,
        height: maxheight,
        decoration: BoxDecoration(
          border: Border.all(color: cocover ?? Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(0)),
        ),
        child: Row(
          children: [
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
                  child: _dataDH(
                    LABEL: LABEL ?? '',
                    PO: PO ?? '',
                    CP: CP ?? '',
                    QTY: QTY ?? '',
                    PROCESS: PROCESS ?? '',
                    CUSLOT: CUSLOT ?? '',
                    TPKLOT: TPKLOT ?? '',
                    FG: FG ?? '',
                    CUSTOMER: CUSTOMER ?? '',
                    PART: PART ?? '',
                    PARTNAME: PARTNAME ?? '',
                    MATERIAL: MATERIAL ?? '',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 2, bottom: 2, start: 1, end: 1),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: childTOP ?? [],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 1, bottom: 2, start: 1, end: 1),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Row(
                          children: childBOT ?? [],
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
                  child: Column(
                    children: childRIGHT ?? [],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _dataDH extends StatelessWidget {
  _dataDH({
    Key? key,
    this.PO,
    this.CP,
    this.QTY,
    this.PROCESS,
    this.CUSLOT,
    this.TPKLOT,
    this.FG,
    this.CUSTOMER,
    this.PART,
    this.PARTNAME,
    this.MATERIAL,
    this.LABEL,
  }) : super(key: key);
  String? PO;
  String? CP;
  String? QTY;
  String? PROCESS;
  String? CUSLOT;
  String? TPKLOT;
  String? FG;
  String? CUSTOMER;
  String? PART;
  String? PARTNAME;
  String? MATERIAL;
  String? LABEL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(LABEL ?? "ITEM DESCRIPTION",
                style: const TxtStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Expanded(
                flex: 4,
                child: Text("PO",
                    style: TxtStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 6,
                child: Text(PO ?? ''),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Expanded(
                flex: 4,
                child: Text("CP",
                    style: TxtStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 6,
                child: Text(CP ?? ''),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Expanded(
                flex: 4,
                child: Text("QTY",
                    style: TxtStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 6,
                child: Text(QTY ?? ''),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Expanded(
                flex: 4,
                child: Text("PROCESS",
                    style: TxtStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 6,
                child: Text(PROCESS ?? ''),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Expanded(
                flex: 4,
                child: Text("CUS.LOT.",
                    style: TxtStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 6,
                child: Text(CUSLOT ?? ''),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),

          Row(
            children: [
              const Expanded(
                flex: 4,
                child: Text("TPK.LOT.",
                    style: TxtStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 6,
                child: Text(TPKLOT ?? ''),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),

          Row(
            children: [
              const Expanded(
                flex: 4,
                child: Text("FG",
                    style: TxtStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 6,
                child: Text(FG ?? ''),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),

          Row(
            children: [
              const Expanded(
                flex: 4,
                child: Text("CUSTOMER",
                    style: TxtStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 6,
                child: Text(CUSTOMER ?? ''),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
//
          Row(
            children: [
              const Expanded(
                flex: 4,
                child: Text("PART",
                    style: TxtStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 6,
                child: Text(PART ?? ''),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Expanded(
                flex: 4,
                child: Text("PARTNAME",
                    style: TxtStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 6,
                child: Text(PARTNAME ?? ''),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Expanded(
                flex: 4,
                child: Text("MATERIAL",
                    style: TxtStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 6,
                child: Text(MATERIAL ?? ''),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class INSDATA {
  INSDATA({
    this.V1 = '',
    this.V2 = '',
    this.V3 = '',
    this.V4 = '',
    this.V5 = '',
    this.V6 = '',
    this.V7 = '',
    this.V8 = '',
    this.V9 = '',
  });

  String V1;
  String V2;
  String V3;
  String V4;
  String V5;
  String V6;
  String V7;
  String V8;
  String V9;
}
