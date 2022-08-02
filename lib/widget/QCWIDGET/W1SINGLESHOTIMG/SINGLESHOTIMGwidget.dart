import 'package:flutter/material.dart';

import '../../../styles/TextStyle.dart';

import '../../common/Easydropdown.dart';
import '../consolelayout.dart';

class SINGLESHOTIMGmain extends StatelessWidget {
  SINGLESHOTIMGmain({
    Key? key,
    //------ Left
    this.LABEL,
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
    //------- Top
    required this.ItemPickres,
    this.ItemPick,
    this.PCS,
    this.PCSleft,
    this.POINTs,
    this.UNIT,
    this.INTERSEC,
    this.RESULTFORMAT,
    this.Ghtype,
    //------- Bottom
    required this.ACCEPT,
    required this.FINISH,
    this.preview,
    this.confirmdata,
    this.wchild,
    //------- Right
    required this.CLEAR,
    required this.BACKPAGE,
    required this.RESETVALUE,
    this.ITEMleftUNIT,
    this.ITEMleftVALUE,

    //-------
  }) : super(key: key);

  //Left --------------------------------------------
  String? LABEL;
  String? PO; //ok
  String? CP; //ok
  String? QTY; //ok
  String? PROCESS; //ok
  String? CUSLOT; //ok
  String? TPKLOT; //ok
  String? FG; //ok
  String? CUSTOMER; //ok
  String? PART; //ok
  String? PARTNAME; //ok
  String? MATERIAL; //ok

  //Top --------------------------------------------

  Function ItemPickres; //ok

  List<String>? ItemPick; //ok
  String? PCS; //ok
  String? PCSleft; //ok
  String? POINTs;
  String? UNIT; //ok
  String? Ghtype;
  String? INTERSEC;
  String? RESULTFORMAT;
  //Bottom --------------------------------------------

  Function ACCEPT;
  Function FINISH;

  List<INSDATA>? preview; //ok
  List<INSDATA>? confirmdata; //ok

  Widget? wchild;

  //Right --------------------------------------------
  Function CLEAR;
  Function BACKPAGE;
  Function RESETVALUE;

  List<INSDATA>? ITEMleftUNIT; // ok
  List<INSDATA>? ITEMleftVALUE; // ok

  @override
  Widget build(BuildContext context) {
    return SINGLESHITLAYOUT(
      LABEL: LABEL ?? '',
      cocover: Colors.blue,
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
      childBOT: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                // Row(
                //   children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: InkWell(
                      onTap: () {
                        ACCEPT(PO) ?? () {};
                      },
                      child: Container(
                        height: 40,
                        color: Colors.blue,
                        child: const Center(
                          child: Text("ACCEPT",
                              style: TxtStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                ),
                // Expanded(
                //   flex: 1,
                //   child: Padding(
                //     padding: const EdgeInsets.all(1.0),
                //     child: InkWell(
                //       onTap: () {
                //         FINISH(PO) ?? () {};
                //       },
                //       child: Container(
                //         height: 40,
                //         color: Colors.green,
                //         child: const Center(
                //           child: Text("FINISH",
                //               style: TxtStyle(
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold)),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // ],
                // ),
                // SizedBox(
                //   height: 25,
                //   child: Row(
                //     children: [
                //       Expanded(
                //         flex: 1,
                //         child: Container(
                //           decoration: BoxDecoration(
                //             border: Border.all(color: Colors.black),
                //             color: Colors.grey,
                //             borderRadius:
                //                 const BorderRadius.all(Radius.circular(0)),
                //           ),
                //           child: const Text(
                //             "Preview value",
                //             style: TxtStyle(color: Colors.white),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 40,
                //   child: _tabtableB3(
                //     height: 40,
                //     value: preview ?? [INSDATA()],
                //   ),
                // ),
                // SizedBox(
                //   height: 25,
                //   child: Row(
                //     children: [
                //       Expanded(
                //         flex: 1,
                //         child: Container(
                //           decoration: BoxDecoration(
                //             border: Border.all(color: Colors.black),
                //             color: Colors.grey,
                //             borderRadius:
                //                 const BorderRadius.all(Radius.circular(0)),
                //           ),
                //           child: const Text(
                //             "Value",
                //             style: TxtStyle(color: Colors.white),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    child: SingleChildScrollView(
                      controller: ScrollController(
                        initialScrollOffset: 0.0,
                        keepScrollOffset: true,
                      ),
                      child: wchild,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
      childTOP: [
        _topboxfull(
          outfn: (input) {
            ItemPickres(input) ?? () {};
          },
          dropdown: ItemPick ?? [''],
          PCS: PCS,
          PCSleft: PCSleft,
          POINTs: POINTs,
          UNIT: UNIT,
          Ghtype: Ghtype,
          INTERSEC: INTERSEC,
          RESULTFORMAT: RESULTFORMAT,
        )
      ],
      childRIGHT: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () {
                    CLEAR(PO) ?? () {};
                  },
                  child: Container(
                    height: 40,
                    color: Colors.orange,
                    child: const Center(
                      child: Text("CLEAR",
                          style: TxtStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () {
                    BACKPAGE(PO) ?? () {};
                  },
                  child: Container(
                    height: 40,
                    color: Colors.blue,
                    child: const Center(
                      child: Text("BACK PAGE",
                          style: TxtStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () {
                    RESETVALUE(PO) ?? () {};
                  },
                  child: Container(
                    height: 40,
                    color: Colors.red,
                    child: const Center(
                      child: Text("RESET VALUE",
                          style: TxtStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 25,
                  color: Colors.grey,
                  child: _tabtableB2(
                    value: [INSDATA(V1: "M FOR", V2: "ITEMs")],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  height: 50,
                  child: SingleChildScrollView(
                    controller: ScrollController(
                      initialScrollOffset: 0.0,
                      keepScrollOffset: true,
                    ),
                    child: _tabtableB2(
                      value: ITEMleftUNIT ?? [INSDATA()],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 25,
                  color: Colors.grey,
                  child: _tabtableB2(
                    value: [
                      INSDATA(
                        V1: "ITEM",
                        V2: "Values",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  height: 100,
                  child: SingleChildScrollView(
                      controller: ScrollController(
                        initialScrollOffset: 0.0,
                        keepScrollOffset: true,
                      ),
                      child: _tabtableB2(
                        value: ITEMleftVALUE ?? [INSDATA()],
                      )),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _topboxfull extends StatefulWidget {
  _topboxfull({
    Key? key,
    required this.outfn,
    required this.dropdown,
    this.PCS,
    this.PCSleft,
    this.POINTs,
    this.UNIT,
    this.Ghtype,
    this.INTERSEC,
    this.RESULTFORMAT,
  }) : super(key: key);
  Function outfn;
  List<String> dropdown;
  String? PCS;
  String? PCSleft;
  String? POINTs;
  String? UNIT;
  String? Ghtype;
  String? INTERSEC;
  String? RESULTFORMAT;

  @override
  State<_topboxfull> createState() => __topboxfullState();
}

class __topboxfullState extends State<_topboxfull> {
  String show = '';
  @override
  Widget build(BuildContext context) {
    Function _outfn = widget.outfn;
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Container(
                height: 38,
                width: 100,
                color: Colors.blueGrey,
                child: const Center(
                  child: Text('FINAL'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              EasyDropDown(
                borderRaio: 0,
                imgpath: 'assets/icons/icon-down_4@3x.png',
                listdropdown: widget.dropdown,
                onChangeinside: (d) {
                  setState(() {
                    show = d;
                    _outfn(d);
                  });
                },
                value: show,
                height: 38,
                width: 200,
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 38,
                width: 100,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          'POINTs',
                          style: TxtStyle(
                            color: Colors.black,
                            // fontSize: 12
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Expanded(flex: 1, child: Text(widget.POINTs ?? '')),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              SizedBox(
                height: 38,
                width: 125,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: Text('PSC',
                            style: TxtStyle(
                              color: Colors.black,
                              // fontSize: 12
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(flex: 1, child: Text(widget.PCS ?? '')),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 38,
                width: 125,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: Text('PSC left',
                            style: TxtStyle(
                              color: Colors.black,
                              // fontSize: 12
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(flex: 1, child: Text(widget.PCSleft ?? '')),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 38,
                width: 150,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text('UNIT',
                            style: TxtStyle(
                              color: Colors.black,
                              // fontSize: 12
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(flex: 2, child: Text(widget.UNIT ?? '')),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              SizedBox(
                height: 38,
                width: 150,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: Text('FORMAT',
                            style: TxtStyle(
                              color: Colors.black,
                              // fontSize: 12
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(flex: 1, child: Text(widget.RESULTFORMAT ?? '')),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 38,
                width: 125,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 2,
                        child: Text('Gh type',
                            style: TxtStyle(
                              color: Colors.black,
                              // fontSize: 12
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(flex: 1, child: Text(widget.Ghtype ?? '')),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 38,
                width: 125,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text('Intersec @',
                            style: TxtStyle(
                              color: Colors.black,
                              // fontSize: 12
                              fontWeight: FontWeight.bold,
                            ))),
                    Expanded(flex: 1, child: Text(widget.INTERSEC ?? '')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _tabtableB2 extends StatelessWidget {
  _tabtableB2({
    Key? key,
    this.value,
    this.txtsize,
    this.txtcolor,
    this.height,
  }) : super(key: key);
  List<INSDATA>? value;
  double? txtsize;
  Color? txtcolor;
  double? height;

  @override
  Widget build(BuildContext context) {
    List<INSDATA> _value = value ?? [];
    return SizedBox(
      child: Column(
        children: [
          for (int i = 0; i < _value.length; i++)
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V1 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V2 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _tabtableB3 extends StatelessWidget {
  _tabtableB3({
    Key? key,
    this.value,
    this.txtsize,
    this.txtcolor,
    this.height,
  }) : super(key: key);
  List<INSDATA>? value;
  double? txtsize;
  Color? txtcolor;
  double? height;

  @override
  Widget build(BuildContext context) {
    List<INSDATA> _value = value ?? [];
    return SizedBox(
      child: Column(
        children: [
          for (int i = 0; i < _value.length; i++)
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V5 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V1 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V2 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V3 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height ?? 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Center(
                      child: Text(
                        value?[i].V4 ?? '',
                        style: TxtStyle(
                            color: txtcolor ?? Colors.black,
                            fontSize: txtsize ?? 12
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
