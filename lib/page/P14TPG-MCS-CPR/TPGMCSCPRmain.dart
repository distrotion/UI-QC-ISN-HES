import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/14-01-TPGMCSCPR.dart';
import '../../bloc/BlocEvent/14-02-TrickTPGMCSCPR.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';

import '../../widget/QCWIDGET/W1SINGLESHOTKEY/SINGLESHOTKEY2widget.dart';

import '../../widget/common/Loading.dart';

import '../../widget/common/Safty.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'TPGMCSCPRvar.dart';

class MICROVICKER_TPGMCSCPRmain extends StatelessWidget {
  MICROVICKER_TPGMCSCPRmain({Key? key, this.data}) : super(key: key);
  TPGMCSCPRSCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_TPGMCSCPR_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_TPGMCSCPR_BlocBuffer extends StatelessWidget {
  _TRICKER_TPGMCSCPR_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  TPGMCSCPRSCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_TPGMCSCPR_Bloc(),
        child: BlocBuilder<TRICKER_TPGMCSCPR_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_TPGMCSCPRbody(data: data);
          },
        ));
  }
}

class ROCKWELL_TPGMCSCPRbody extends StatefulWidget {
  ROCKWELL_TPGMCSCPRbody({Key? key, this.data}) : super(key: key);
  TPGMCSCPRSCHEMA? data;

  @override
  State<ROCKWELL_TPGMCSCPRbody> createState() => _ROCKWELL_TPGMCSCPRbodyState();
}

class _ROCKWELL_TPGMCSCPRbodyState extends State<ROCKWELL_TPGMCSCPRbody> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    TPGMCSCPRvar.LASTREQ = '';
    // TPGMCSCPRvar.SINGLEINPUT = '';

    TPGMCSCPRvar.PR01 = '';
    TPGMCSCPRvar.PR02 = '';
    TPGMCSCPRvar.PR03 = '';

    TPGMCSCPRvar.CP01 = '';
    TPGMCSCPRvar.CP02 = '';
    TPGMCSCPRvar.CP03 = '';
    context.read<TPGMCSCPR_Bloc>().add(TPGMCSCPR_READ());
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
    TPGMCSCPRvar.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    TPGMCSCPRvar.ItemPickSELECT = '';
    // TPGMCSCPRvar.SINGLEINPUT = '';
    context.read<TRICKER_TPGMCSCPR_Bloc>().add(TRICKER_TPGMCSCPRSETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 5;
    print(TPGMCSCPRvar.confirmdata.length);
    print(TPGMCSCPRvar.PR01);
    if (TPGMCSCPRvar.confirmdata.isEmpty) {
      TPGMCSCPRvar.SINGLEINPUT1 = TPGMCSCPRvar.PR01;
      TPGMCSCPRvar.SINGLEINPUT2 = TPGMCSCPRvar.CP01;
    } else if (TPGMCSCPRvar.confirmdata.length == 1) {
      TPGMCSCPRvar.SINGLEINPUT1 = TPGMCSCPRvar.PR02;
      TPGMCSCPRvar.SINGLEINPUT2 = TPGMCSCPRvar.CP02;
    } else if (TPGMCSCPRvar.confirmdata.length == 2) {
      TPGMCSCPRvar.SINGLEINPUT1 = TPGMCSCPRvar.PR03;
      TPGMCSCPRvar.SINGLEINPUT2 = TPGMCSCPRvar.CP03;
    }
    if (double.parse(ConverstStr(TPGMCSCPRvar.SINGLEINPUT2)) != 0) {
      TPGMCSCPRvar.SINGLEINPUT3 =
          ((double.parse(ConverstStr(TPGMCSCPRvar.SINGLEINPUT1)) /
                      double.parse(ConverstStr(TPGMCSCPRvar.SINGLEINPUT2))) *
                  100)
              .toStringAsFixed(0);
    }
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        TPGMCSCPRvar.PO = widget.data?.PO ?? '';
        TPGMCSCPRvar.CP = widget.data?.CP ?? '';
        TPGMCSCPRvar.QTY = widget.data?.QTY ?? '';
        TPGMCSCPRvar.PROCESS = widget.data?.PROCESS ?? '';
        TPGMCSCPRvar.CUSLOT = widget.data?.CUSLOT ?? '';
        TPGMCSCPRvar.TPKLOT = widget.data?.TPKLOT ?? '';
        TPGMCSCPRvar.FG = widget.data?.FG ?? '';
        TPGMCSCPRvar.CUSTOMER = widget.data?.CUSTOMER ?? '';
        TPGMCSCPRvar.PART = widget.data?.PART ?? '';
        TPGMCSCPRvar.PARTNAME = widget.data?.PARTNAME ?? '';
        TPGMCSCPRvar.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        TPGMCSCPRvar.ItemPick = widget.data?.ItemPick ?? [''];

        TPGMCSCPRvar.PCS = widget.data?.PCS ?? '';
        // TPGMCSCPRvar.PCS = '10';
        TPGMCSCPRvar.PCSleft = widget.data?.PCSleft ?? '';
        // TPGMCSCPRvar.PCSleft = '10';
        TPGMCSCPRvar.POINTs = widget.data?.POINTs ?? '';
        // TPGMCSCPRvar.POINTs = '10';
        // if (TPGMCSCPRvar.ItemPickSELECT != "") {
        //   //
        //   if (TPGMCSCPRvar.POINTs == "") {
        //     //
        //     TPGMCSCPRvar.POINTs == "0";
        //   }
        // }
        TPGMCSCPRvar.UNIT = widget.data?.UNIT ?? '';
        // TPGMCSCPRvar.UNIT = 'pcs/lots';
        TPGMCSCPRvar.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        TPGMCSCPRvar.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        TPGMCSCPRvar.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        TPGMCSCPRvar.GAP = widget.data?.GAP ?? '';
        TPGMCSCPRvar.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        TPGMCSCPRvar.preview = widget.data?.preview ?? [];
        TPGMCSCPRvar.confirmdata = widget.data?.confirmdata ?? [];
        TPGMCSCPRvar.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        TPGMCSCPRvar.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (TPGMCSCPRvar.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<TPGMCSCPR_Bloc>().add(TPGMCSCPR_READ());
      });
      TPGMCSCPRvar.DHtimer = timer;
    }
    return SINGLESHOTKEY2main(
      //------ Left
      LABEL: "LCR-UVS-001",
      PO: TPGMCSCPRvar.PO,
      CP: TPGMCSCPRvar.CP,
      QTY: TPGMCSCPRvar.QTY,
      PROCESS: TPGMCSCPRvar.PROCESS,
      CUSLOT: TPGMCSCPRvar.CUSLOT,
      TPKLOT: TPGMCSCPRvar.TPKLOT,
      FG: TPGMCSCPRvar.FG,
      CUSTOMER: TPGMCSCPRvar.CUSTOMER,
      PART: TPGMCSCPRvar.PART,
      PARTNAME: TPGMCSCPRvar.PARTNAME,
      MATERIAL: TPGMCSCPRvar.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        TPGMCSCPRvar.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_TPGMCSCPR_Bloc>()
            .add(TRICKER_TPGMCSCPRgeteachITEM());
      },
      ItemPick: TPGMCSCPRvar.ItemPick,
      PCS: TPGMCSCPRvar.PCS,
      PCSleft: TPGMCSCPRvar.PCSleft,
      POINTs: TPGMCSCPRvar.POINTs,
      UNIT: TPGMCSCPRvar.UNIT,
      INTERSEC: TPGMCSCPRvar.INTERSEC,
      RESULTFORMAT: TPGMCSCPRvar.RESULTFORMAT,
      Ghtype: TPGMCSCPRvar.GRAPHTYPE,
      GAP: TPGMCSCPRvar.GAP,
      GAPnameList: TPGMCSCPRvar.GAPnameList,
      GAPname: TPGMCSCPRvar.GAPname,
      GAPnamePick: (v) {
        TPGMCSCPRvar.GAPname = v;
        context
            .read<TRICKER_TPGMCSCPR_Bloc>()
            .add(TRICKER_TPGMCSCPRgeteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((TPGMCSCPRvar.RESULTFORMAT == 'Graph' &&
                TPGMCSCPRvar.GAPname != '') ||
            TPGMCSCPRvar.RESULTFORMAT != 'Graph') {
          if (TPGMCSCPRvar.PCS != '' &&
              TPGMCSCPRvar.POINTs != '' &&
              TPGMCSCPRvar.ItemPickSELECT != '' &&
              TPGMCSCPRvar.SINGLEINPUT1 != '') {
            if (int.parse(TPGMCSCPRvar.POINTs) >
                TPGMCSCPRvar.confirmdata.length) {
              // context
              //     .read<TRICKER_TPGMCSCPR_Bloc>()
              //     .add(TRICKER_TPGMCSCPRconfirmdata());
              context
                  .read<TRICKER_TPGMCSCPR_Bloc>()
                  .add(TRICKER_TPGMCSCPRpreview());
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
        if (TPGMCSCPRvar.PCS != '' &&
            TPGMCSCPRvar.POINTs != '' &&
            TPGMCSCPRvar.ItemPickSELECT != '') {
          if (int.parse(TPGMCSCPRvar.POINTs) ==
              TPGMCSCPRvar.confirmdata.length) {
            if (int.parse(TPGMCSCPRvar.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_TPGMCSCPR_Bloc>()
                  .add(TRICKER_TPGMCSCPRFINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      READtext: TPGMCSCPRvar.LASTREQ,
      READ: (v) {
        print(v);
        Dio().post(
          GLOserver + 'CHECK-TPGMCSCPR-order',
          data: {},
        ).then((v) {
          if (v.statusCode == 200) {
            try {
              TPGMCSCPRvar.iscontrol = true;
              print(v.data[0]['FINAL']['MCS-INSHES']
                  ['ITEMs-60407f6193e8d91950acb5cf']['PSC1'][0]['PIC1data']);
              print(v.data[0]['FINAL']['MCS-INSHES']
                  ['ITEMs-60407f6193e8d91950acb5cf']['PSC1'][0]['PIC2data']);
              print(v.data[0]['FINAL']['MCS-INSHES']
                  ['ITEMs-60407f6193e8d91950acb5cf']['PSC1'][0]['PIC3data']);
              TPGMCSCPRvar.PR01 = v.data[0]['FINAL']['MCS-INSHES']
                      ['ITEMs-60407f6193e8d91950acb5cf']['PSC1'][0]['PIC1data']
                  .toString();
              TPGMCSCPRvar.PR02 = v.data[0]['FINAL']['MCS-INSHES']
                      ['ITEMs-60407f6193e8d91950acb5cf']['PSC1'][0]['PIC2data']
                  .toString();
              TPGMCSCPRvar.PR03 = v.data[0]['FINAL']['MCS-INSHES']
                      ['ITEMs-60407f6193e8d91950acb5cf']['PSC1'][0]['PIC3data']
                  .toString();
            } catch (e) {}
            try {
              TPGMCSCPRvar.iscontrol = true;
              print(v.data[0]['FINAL']['MCS-INSHES']
                  ['ITEMs-5f19a922fe12be0020dbd3ba']['PSC1'][0]['PIC1data']);
              print(v.data[0]['FINAL']['MCS-INSHES']
                  ['ITEMs-5f19a922fe12be0020dbd3ba']['PSC1'][0]['PIC2data']);
              print(v.data[0]['FINAL']['MCS-INSHES']
                  ['ITEMs-5f19a922fe12be0020dbd3ba']['PSC1'][0]['PIC3data']);
              TPGMCSCPRvar.CP01 = v.data[0]['FINAL']['MCS-INSHES']
                      ['ITEMs-5f19a922fe12be0020dbd3ba']['PSC1'][0]['PIC1data']
                  .toString();

              TPGMCSCPRvar.CP02 = v.data[0]['FINAL']['MCS-INSHES']
                      ['ITEMs-5f19a922fe12be0020dbd3ba']['PSC1'][0]['PIC2data']
                  .toString();

              TPGMCSCPRvar.CP03 = v.data[0]['FINAL']['MCS-INSHES']
                      ['ITEMs-5f19a922fe12be0020dbd3ba']['PSC1'][0]['PIC3data']
                  .toString();
            } catch (e) {}
          }
        });
      },
      preview: TPGMCSCPRvar.preview,
      iscon01: TPGMCSCPRvar.iscontrol,
      input1: TPGMCSCPRvar.SINGLEINPUT1,
      inputFN1: (v) {
        TPGMCSCPRvar.SINGLEINPUT1 = v;
      },
      input2: TPGMCSCPRvar.SINGLEINPUT2,
      inputFN2: (v) {
        TPGMCSCPRvar.SINGLEINPUT2 = v;
      },
      input3: TPGMCSCPRvar.SINGLEINPUT3,
      inputFN3: (v) {
        TPGMCSCPRvar.SINGLEINPUT3 = v;
      },
      confirmdata: TPGMCSCPRvar.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_TPGMCSCPR_Bloc>().add(TRICKER_TPGMCSCPRCLEAR());
      },
      BACKPAGE: (v) {
        TPGMCSCPRvar.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        TPGMCSCPRvar.ItemPickSELECT = '';
        // TPGMCSCPRvar.SINGLEINPUT = '';
        context.read<TRICKER_TPGMCSCPR_Bloc>().add(TRICKER_TPGMCSCPRSETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_TPGMCSCPR_Bloc>()
            .add(TRICKER_TPGMCSCPRRESETVALUE());
      },
      ITEMleftUNIT: TPGMCSCPRvar.ITEMleftUNIT,
      ITEMleftVALUE: TPGMCSCPRvar.ITEMleftVALUE,
    );
  }
}
