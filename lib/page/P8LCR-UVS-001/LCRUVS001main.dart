import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/08-01-LCRUVS001.dart';
import '../../bloc/BlocEvent/08-02-TrickLCRUVS001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTKEY/SINGLESHOTKEYwidget.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'LCRUVS001var.dart';

class MICROVICKER_LCRUVS001main extends StatelessWidget {
  MICROVICKER_LCRUVS001main({Key? key, this.data}) : super(key: key);
  LCRUVS001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_LCRUVS001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_LCRUVS001_BlocBuffer extends StatelessWidget {
  _TRICKER_LCRUVS001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  LCRUVS001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_LCRUVS001_Bloc(),
        child: BlocBuilder<TRICKER_LCRUVS001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_LCRUVS001body(data: data);
          },
        ));
  }
}

class ROCKWELL_LCRUVS001body extends StatefulWidget {
  ROCKWELL_LCRUVS001body({Key? key, this.data}) : super(key: key);
  LCRUVS001SCHEMA? data;

  @override
  State<ROCKWELL_LCRUVS001body> createState() => _ROCKWELL_LCRUVS001bodyState();
}

class _ROCKWELL_LCRUVS001bodyState extends State<ROCKWELL_LCRUVS001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    LCRUVS001var.LASTREQ = '';
    // LCRUVS001var.SINGLEINPUT = '';
    Dio().post(
      GLOserver + 'getfromsar',
      data: {
        "ReqNO": LCRUVS001var.reqno,
      },
    ).then((v) {
      if (v.statusCode == 200) {
        // print(v);
        if (v.data.length > 0) {
          LCRUVS001var.iscontrol = true;

          LCRUVS001var.SINGLEINPUT = v.data[0]['setdata'][0]['Result_1'] != null
              ? (double.parse(ConverstStr(v.data[0]['setdata'][0]['Result_1']
                          .toString()
                          .replaceAll("<", ""))) /
                      (double.parse(
                          ConverstStrOne(v.data[0]['Number'].toString()))))
                  .toString()
              : "";

          LCRUVS001var.LASTREQ = v.data[0]['ReqNO'] != null
              ? v.data[0]['ReqNO'].toString() +
                  '(${ConverstStrOne(v.data[0]['Number'].toString())})'
              : "";
        }
      }
    });
    context.read<LCRUVS001_Bloc>().add(LCRUVS001_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    LCRUVS001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    LCRUVS001var.ItemPickSELECT = '';
    // LCRUVS001var.SINGLEINPUT = '';
    context.read<TRICKER_LCRUVS001_Bloc>().add(TRICKER_LCRUVS001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 5;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        LCRUVS001var.PO = widget.data?.PO ?? '';
        LCRUVS001var.CP = widget.data?.CP ?? '';
        LCRUVS001var.QTY = widget.data?.QTY ?? '';
        LCRUVS001var.PROCESS = widget.data?.PROCESS ?? '';
        LCRUVS001var.CUSLOT = widget.data?.CUSLOT ?? '';
        LCRUVS001var.TPKLOT = widget.data?.TPKLOT ?? '';
        LCRUVS001var.FG = widget.data?.FG ?? '';
        LCRUVS001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        LCRUVS001var.PART = widget.data?.PART ?? '';
        LCRUVS001var.PARTNAME = widget.data?.PARTNAME ?? '';
        LCRUVS001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        LCRUVS001var.ItemPick = widget.data?.ItemPick ?? [''];
        LCRUVS001var.PCS = widget.data?.PCS ?? '';
        // LCRUVS001var.PCS = '10';
        LCRUVS001var.PCSleft = widget.data?.PCSleft ?? '';
        // LCRUVS001var.PCSleft = '10';
        LCRUVS001var.POINTs = widget.data?.POINTs ?? '';
        // LCRUVS001var.POINTs = '10';
        // if (LCRUVS001var.ItemPickSELECT != "") {
        //   //
        //   if (LCRUVS001var.POINTs == "") {
        //     //
        //     LCRUVS001var.POINTs == "0";
        //   }
        // }
        LCRUVS001var.UNIT = widget.data?.UNIT ?? '';
        // LCRUVS001var.UNIT = 'pcs/lots';
        LCRUVS001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        LCRUVS001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        LCRUVS001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        LCRUVS001var.GAP = widget.data?.GAP ?? '';
        LCRUVS001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        LCRUVS001var.preview = widget.data?.preview ?? [];
        LCRUVS001var.confirmdata = widget.data?.confirmdata ?? [];
        LCRUVS001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        LCRUVS001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (LCRUVS001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<LCRUVS001_Bloc>().add(LCRUVS001_READ());
      });
      LCRUVS001var.DHtimer = timer;
    }
    return SINGLESHOTKEYmain(
      //------ Left
      LABEL: "LCR-UVS-001",
      PO: LCRUVS001var.PO,
      CP: LCRUVS001var.CP,
      QTY: LCRUVS001var.QTY,
      PROCESS: LCRUVS001var.PROCESS,
      CUSLOT: LCRUVS001var.CUSLOT,
      TPKLOT: LCRUVS001var.TPKLOT,
      FG: LCRUVS001var.FG,
      CUSTOMER: LCRUVS001var.CUSTOMER,
      PART: LCRUVS001var.PART,
      PARTNAME: LCRUVS001var.PARTNAME,
      MATERIAL: LCRUVS001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        LCRUVS001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_LCRUVS001_Bloc>()
            .add(TRICKER_LCRUVS001geteachITEM());
        // Dio().post(
        //   GLOserver + 'getfromsar',
        //   data: {
        //     "ReqNO": LCRUVS001var.reqno,
        //   },
        // ).then((v) {
        //   if (v.statusCode == 200) {
        //     // print(v);
        //     if (v.data.length > 0) {
        //       LCRUVS001var.iscontrol = true;

        //       LCRUVS001var.SINGLEINPUT = v.data[0]['setdata'][0]['Result_1'] !=
        //               null
        //           ? (double.parse(ConverstStr(v.data[0]['setdata'][0]
        //                           ['Result_1']
        //                       .toString()
        //                       .replaceAll("<", ""))) /
        //                   (double.parse(
        //                       ConverstStrOne(v.data[0]['Number'].toString()))))
        //               .toString()
        //           : "";

        //       LCRUVS001var.LASTREQ = v.data[0]['ReqNO'] != null
        //           ? v.data[0]['ReqNO'].toString() +
        //               '(${ConverstStrOne(v.data[0]['Number'].toString())})'
        //           : "";
        //     }
        //   }
        // });
      },
      ItemPick: LCRUVS001var.ItemPick,
      PCS: LCRUVS001var.PCS,
      PCSleft: LCRUVS001var.PCSleft,
      POINTs: LCRUVS001var.POINTs,
      UNIT: LCRUVS001var.UNIT,
      INTERSEC: LCRUVS001var.INTERSEC,
      RESULTFORMAT: LCRUVS001var.RESULTFORMAT,
      Ghtype: LCRUVS001var.GRAPHTYPE,
      GAP: LCRUVS001var.GAP,
      GAPnameList: LCRUVS001var.GAPnameList,
      GAPname: LCRUVS001var.GAPname,
      GAPnamePick: (v) {
        LCRUVS001var.GAPname = v;
        context
            .read<TRICKER_LCRUVS001_Bloc>()
            .add(TRICKER_LCRUVS001geteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((LCRUVS001var.RESULTFORMAT == 'Graph' &&
                LCRUVS001var.GAPname != '') ||
            LCRUVS001var.RESULTFORMAT != 'Graph') {
          if (LCRUVS001var.PCS != '' &&
              LCRUVS001var.POINTs != '' &&
              LCRUVS001var.ItemPickSELECT != '' &&
              LCRUVS001var.SINGLEINPUT != '') {
            if (int.parse(LCRUVS001var.POINTs) >
                LCRUVS001var.confirmdata.length) {
              // context
              //     .read<TRICKER_LCRUVS001_Bloc>()
              //     .add(TRICKER_LCRUVS001confirmdata());
              context
                  .read<TRICKER_LCRUVS001_Bloc>()
                  .add(TRICKER_LCRUVS001preview());
            } else {
              WORNINGpop(context, "Have completed POINTs");
            }
          } else {
            WORNINGpop(context, "Please select item");
          }
        } else {
          WORNINGpop(context, "Please select GRAPH");
        }
      },
      FINISH: (v) {
        if (LCRUVS001var.PCS != '' &&
            LCRUVS001var.POINTs != '' &&
            LCRUVS001var.ItemPickSELECT != '') {
          if (int.parse(LCRUVS001var.POINTs) ==
              LCRUVS001var.confirmdata.length) {
            if (int.parse(LCRUVS001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_LCRUVS001_Bloc>()
                  .add(TRICKER_LCRUVS001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      READtext: LCRUVS001var.LASTREQ,
      READ: (v) {
        print(v);
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return Dialog(
              child: SizedBox(
                  height: 200,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Req NO From TTC"),
                        const SizedBox(
                          height: 5,
                        ),
                        ComInputText(
                          height: 40,
                          width: 200,
                          // isNumberOnly: true,
                          // isEnabled: false,
                          isContr: false,
                          fnContr: (input) {
                            // setState(() {
                            LCRUVS001var.iscontrol = input;
                            // });
                          },
                          sValue: LCRUVS001var.reqno,
                          returnfunc: (String s) {
                            LCRUVS001var.reqno = s;
                            // inputFN!(s);
                          },
                        ),
                        Text("Number of sample"),
                        const SizedBox(
                          height: 5,
                        ),
                        ComInputText(
                          height: 40,
                          width: 200,
                          // isNumberOnly: true,
                          // isEnabled: false,
                          isContr: false,
                          fnContr: (input) {
                            // setState(() {
                            LCRUVS001var.iscontrol = input;
                            // });
                          },
                          sValue: LCRUVS001var.Number,
                          returnfunc: (String s) {
                            LCRUVS001var.Number = s;
                            // inputFN!(s);
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: InkWell(
                            onTap: () async {
                              Dio().post(
                                GLOserver + 'setfromsar',
                                data: {
                                  "ReqNO": LCRUVS001var.reqno,
                                  "Number": LCRUVS001var.Number,
                                },
                              ).then((v) {
                                if (v.statusCode == 200) {
                                  print(v);
                                  Dio().post(
                                    GLOserver + 'getfromsar',
                                    data: {
                                      "ReqNO": LCRUVS001var.reqno,
                                    },
                                  ).then((v) {
                                    if (v.statusCode == 200) {
                                      // print(v);
                                      if (v.data.length > 0) {
                                        LCRUVS001var.iscontrol = true;

                                        LCRUVS001var.SINGLEINPUT = v.data[0]['setdata']
                                                    [0]['Result_1'] !=
                                                null
                                            ? (double.parse(ConverstStr(v
                                                        .data[0]['setdata'][0]
                                                            ['Result_1']
                                                        .toString()
                                                        .replaceAll("<", ""))) /
                                                    (double.parse(ConverstStrOne(
                                                        v.data[0]['Number'].toString()))))
                                                .toString()
                                            : "";

                                        LCRUVS001var.LASTREQ = v.data[0]
                                                    ['ReqNO'] !=
                                                null
                                            ? v.data[0]['ReqNO'].toString() +
                                                '(${ConverstStrOne(v.data[0]['Number'].toString())})'
                                            : "";

                                        Navigator.pop(context);
                                      }
                                    }
                                  });
                                }
                              });
                            },
                            child: Container(
                              width: 100,
                              height: 40,
                              color: Colors.blue,
                              child: Center(child: Text("GET")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          },
        );
      },
      preview: LCRUVS001var.preview,
      iscon01: LCRUVS001var.iscontrol,
      input: LCRUVS001var.SINGLEINPUT,
      inputFN: (v) {
        LCRUVS001var.SINGLEINPUT = v;
      },
      confirmdata: LCRUVS001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_LCRUVS001_Bloc>().add(TRICKER_LCRUVS001CLEAR());
      },
      BACKPAGE: (v) {
        LCRUVS001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        LCRUVS001var.ItemPickSELECT = '';
        // LCRUVS001var.SINGLEINPUT = '';
        context.read<TRICKER_LCRUVS001_Bloc>().add(TRICKER_LCRUVS001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_LCRUVS001_Bloc>()
            .add(TRICKER_LCRUVS001RESETVALUE());
      },
      ITEMleftUNIT: LCRUVS001var.ITEMleftUNIT,
      ITEMleftVALUE: LCRUVS001var.ITEMleftVALUE,
    );
  }
}
