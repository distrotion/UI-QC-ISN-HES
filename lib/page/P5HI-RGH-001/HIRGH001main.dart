import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/05-01-HIRGH001.dart';
import '../../bloc/BlocEvent/05-02-TrickHIRGH001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTRUGwidget.dart';

import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
import '../../widget/common/graphpeak.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'HIRGH001var.dart';

class MICROVICKER_HIRGH001main extends StatelessWidget {
  MICROVICKER_HIRGH001main({Key? key, this.data}) : super(key: key);
  HIRGH001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HIRGH001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HIRGH001_BlocBuffer extends StatelessWidget {
  _TRICKER_HIRGH001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HIRGH001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HIRGH001_Bloc(),
        child: BlocBuilder<TRICKER_HIRGH001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HIRGH001body(data: data);
          },
        ));
  }
}

class ROCKWELL_HIRGH001body extends StatefulWidget {
  ROCKWELL_HIRGH001body({Key? key, this.data}) : super(key: key);
  HIRGH001SCHEMA? data;

  @override
  State<ROCKWELL_HIRGH001body> createState() => _ROCKWELL_HIRGH001bodyState();
}

class _ROCKWELL_HIRGH001bodyState extends State<ROCKWELL_HIRGH001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    HIRGH001var.ansdata = 0;
    context.read<HIRGH001_Bloc>().add(HIRGH001_READ());
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
    HIRGH001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    HIRGH001var.ItemPickSELECT = '';
    context.read<TRICKER_HIRGH001_Bloc>().add(TRICKER_HIRGH001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 5;

    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HIRGH001var.PO = widget.data?.PO ?? '';
        HIRGH001var.CP = widget.data?.CP ?? '';
        HIRGH001var.QTY = widget.data?.QTY ?? '';
        HIRGH001var.PROCESS = widget.data?.PROCESS ?? '';
        HIRGH001var.CUSLOT = widget.data?.CUSLOT ?? '';
        HIRGH001var.TPKLOT = widget.data?.TPKLOT ?? '';
        HIRGH001var.FG = widget.data?.FG ?? '';
        HIRGH001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HIRGH001var.PART = widget.data?.PART ?? '';
        HIRGH001var.PARTNAME = widget.data?.PARTNAME ?? '';
        HIRGH001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HIRGH001var.ItemPick = widget.data?.ItemPick ?? [''];
        HIRGH001var.PCS = widget.data?.PCS ?? '';
        // HIRGH001var.PCS = '10';
        HIRGH001var.PCSleft = widget.data?.PCSleft ?? '';
        // HIRGH001var.PCSleft = '10';
        HIRGH001var.POINTs = widget.data?.POINTs ?? '';
        // HIRGH001var.POINTs = '10';
        // if (HIRGH001var.ItemPickSELECT != "") {
        //   //
        //   if (HIRGH001var.POINTs == "") {
        //     //
        //     HIRGH001var.POINTs == "0";
        //   }
        // }
        HIRGH001var.UNIT = widget.data?.UNIT ?? '';
        // HIRGH001var.UNIT = 'pcs/lots';
        HIRGH001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HIRGH001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HIRGH001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HIRGH001var.GAP = widget.data?.GAP ?? '';
        HIRGH001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        HIRGH001var.preview = widget.data?.preview ?? [];
        HIRGH001var.confirmdata = widget.data?.confirmdata ?? [];
        HIRGH001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HIRGH001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        HIRGH001var.PICs = widget.data?.Pic ?? '';

        if (HIRGH001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<HIRGH001_Bloc>().add(HIRGH001_READ());
      });
      HIRGH001var.DHtimer = timer;
    }
    return SINGLESHOTRUGmain(
      //------ Left
      LABEL: "HI-RGH-001",
      PO: HIRGH001var.PO,
      CP: HIRGH001var.CP,
      QTY: HIRGH001var.QTY,
      PROCESS: HIRGH001var.PROCESS,
      CUSLOT: HIRGH001var.CUSLOT,
      TPKLOT: HIRGH001var.TPKLOT,
      FG: HIRGH001var.FG,
      CUSTOMER: HIRGH001var.CUSTOMER,
      PART: HIRGH001var.PART,
      PARTNAME: HIRGH001var.PARTNAME,
      MATERIAL: HIRGH001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HIRGH001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HIRGH001_Bloc>()
            .add(TRICKER_HIRGH001geteachITEM());
      },
      ItemPick: HIRGH001var.ItemPick,
      PCS: HIRGH001var.PCS,
      PCSleft: HIRGH001var.PCSleft,
      POINTs: HIRGH001var.POINTs,
      UNIT: HIRGH001var.UNIT,
      INTERSEC: HIRGH001var.INTERSEC,
      RESULTFORMAT: HIRGH001var.RESULTFORMAT,
      Ghtype: HIRGH001var.GRAPHTYPE,
      GAP: HIRGH001var.GAP,
      GAPnameList: HIRGH001var.GAPnameList,
      GAPname: HIRGH001var.GAPname,
      GAPnamePick: (v) {
        HIRGH001var.GAPname = v;
        context
            .read<TRICKER_HIRGH001_Bloc>()
            .add(TRICKER_HIRGH001geteachGRAPH());
      },
      //------- Bottom
      GETPEAK: (v) {
        //http://172.20.30.46:1880/getpeak
        Dio().post(
          "http://172.20.30.46:1880/getpeak",
          data: {},
        ).then((v) {
          if (v.statusCode == 200) {
            //
            var data = v.data;
            // print(data.length);
            List<FlSpot> dataout = [];

            for (var i = 0; i < data.length; i++) {
              String datax =
                  data[i]["X"] != null ? data[i]["X"].toString() : "";
              String dataZ =
                  data[i]["Z"] != null ? data[i]["Z"].toString() : "";

              if (datax != "um") {
                double dataZs = double.parse(ConverstStr(dataZ));
                if (double.parse(ConverstStr(dataZ)) > 1) {
                  dataZs = 1;
                } else if (double.parse(ConverstStr(dataZ)) < -1) {
                  dataZs = -1;
                } else {
                  dataZs = double.parse(ConverstStr(dataZ));
                }
                dataout.add(FlSpot(double.parse(ConverstStr(datax)), dataZs));
              }
            }

            HIRGH001var.ansdata = findPeaksOverThreshold(dataout, 0.25).length;

            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return Dialog(
                  child: SizedBox(
                      height: 500,
                      width: 1200,
                      child: RoughnessGraph(
                        data: dataout,
                        widgetdata: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              if (int.parse(HIRGH001var.POINTs) >
                                  HIRGH001var.confirmdata.length) {
                                Dio().post(
                                  GLOserver + "HIRGH001-confirmdata-set",
                                  data: [
                                    {"V1": "HSC", "V2": HIRGH001var.ansdata}
                                  ],
                                ).then((v) {
                                  Navigator.pop(context);
                                });
                              } else {
                                WORNINGpop(context, "Have completed POINTs");
                              }
                            },
                            child: Container(
                              width: 150,
                              height: 40,
                              color: Colors.blue,
                              child: Center(
                                child: Text("Accept"),
                              ),
                            ),
                          ),
                        ),
                      )),
                );
              },
            );
          }
        });
      },
      ACCEPT: (v) {
        if ((HIRGH001var.RESULTFORMAT == 'Graph' &&
                HIRGH001var.GAPname != '') ||
            HIRGH001var.RESULTFORMAT != 'Graph') {
          if (HIRGH001var.PCS != '' &&
              HIRGH001var.POINTs != '' &&
              HIRGH001var.ItemPickSELECT != '') {
            if (int.parse(HIRGH001var.POINTs) >
                HIRGH001var.confirmdata.length) {
              context
                  .read<TRICKER_HIRGH001_Bloc>()
                  .add(TRICKER_HIRGH001confirmdata());
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
        if (HIRGH001var.PCS != '' &&
            HIRGH001var.POINTs != '' &&
            HIRGH001var.ItemPickSELECT != '') {
          if (int.parse(HIRGH001var.POINTs) == HIRGH001var.confirmdata.length) {
            if (int.parse(HIRGH001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_HIRGH001_Bloc>()
                  .add(TRICKER_HIRGH001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: HIRGH001var.preview,
      confirmdata: HIRGH001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_HIRGH001_Bloc>().add(TRICKER_HIRGH001CLEAR());
      },
      BACKPAGE: (v) {
        HIRGH001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HIRGH001var.ItemPickSELECT = '';
        context.read<TRICKER_HIRGH001_Bloc>().add(TRICKER_HIRGH001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_HIRGH001_Bloc>().add(TRICKER_HIRGH001RESETVALUE());
      },
      ITEMleftUNIT: HIRGH001var.ITEMleftUNIT,
      ITEMleftVALUE: HIRGH001var.ITEMleftVALUE,
      PICB64: HIRGH001var.PICs,
    );
  }
}
