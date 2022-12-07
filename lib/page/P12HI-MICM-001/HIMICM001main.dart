import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/12-01-HIMICM001.dart';
import '../../bloc/BlocEvent/12-02-TrickHIMICM001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'HIMICM001var.dart';

class MICROVICKER_HIMICM001main extends StatelessWidget {
  MICROVICKER_HIMICM001main({Key? key, this.data}) : super(key: key);
  HIMICM001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HIMICM001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HIMICM001_BlocBuffer extends StatelessWidget {
  _TRICKER_HIMICM001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HIMICM001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HIMICM001_Bloc(),
        child: BlocBuilder<TRICKER_HIMICM001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HIMICM001body(data: data);
          },
        ));
  }
}

class ROCKWELL_HIMICM001body extends StatefulWidget {
  ROCKWELL_HIMICM001body({Key? key, this.data}) : super(key: key);
  HIMICM001SCHEMA? data;

  @override
  State<ROCKWELL_HIMICM001body> createState() => _ROCKWELL_HIMICM001bodyState();
}

class _ROCKWELL_HIMICM001bodyState extends State<ROCKWELL_HIMICM001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<HIMICM001_Bloc>().add(HIMICM001_READ());
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
    HIMICM001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    HIMICM001var.ItemPickSELECT = '';
    context.read<TRICKER_HIMICM001_Bloc>().add(TRICKER_HIMICM001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 5;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HIMICM001var.PO = widget.data?.PO ?? '';
        HIMICM001var.CP = widget.data?.CP ?? '';
        HIMICM001var.QTY = widget.data?.QTY ?? '';
        HIMICM001var.PROCESS = widget.data?.PROCESS ?? '';
        HIMICM001var.CUSLOT = widget.data?.CUSLOT ?? '';
        HIMICM001var.TPKLOT = widget.data?.TPKLOT ?? '';
        HIMICM001var.FG = widget.data?.FG ?? '';
        HIMICM001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HIMICM001var.PART = widget.data?.PART ?? '';
        HIMICM001var.PARTNAME = widget.data?.PARTNAME ?? '';
        HIMICM001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HIMICM001var.ItemPick = widget.data?.ItemPick ?? [''];
        HIMICM001var.PCS = widget.data?.PCS ?? '';
        // HIMICM001var.PCS = '10';
        HIMICM001var.PCSleft = widget.data?.PCSleft ?? '';
        // HIMICM001var.PCSleft = '10';
        HIMICM001var.POINTs = widget.data?.POINTs ?? '';
        // HIMICM001var.POINTs = '10';
        // if (HIMICM001var.ItemPickSELECT != "") {
        //   //
        //   if (HIMICM001var.POINTs == "") {
        //     //
        //     HIMICM001var.POINTs == "0";
        //   }
        // }
        HIMICM001var.UNIT = widget.data?.UNIT ?? '';
        // HIMICM001var.UNIT = 'pcs/lots';
        HIMICM001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HIMICM001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HIMICM001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HIMICM001var.GAP = widget.data?.GAP ?? '';
        HIMICM001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        HIMICM001var.preview = widget.data?.preview ?? [];
        HIMICM001var.confirmdata = widget.data?.confirmdata ?? [];
        HIMICM001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HIMICM001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        HIMICM001var.PICs = widget.data?.Pic ?? '';

        if (HIMICM001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<HIMICM001_Bloc>().add(HIMICM001_READ());
      });
      HIMICM001var.DHtimer = timer;
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "HI-RGH-001",
      PO: HIMICM001var.PO,
      CP: HIMICM001var.CP,
      QTY: HIMICM001var.QTY,
      PROCESS: HIMICM001var.PROCESS,
      CUSLOT: HIMICM001var.CUSLOT,
      TPKLOT: HIMICM001var.TPKLOT,
      FG: HIMICM001var.FG,
      CUSTOMER: HIMICM001var.CUSTOMER,
      PART: HIMICM001var.PART,
      PARTNAME: HIMICM001var.PARTNAME,
      MATERIAL: HIMICM001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HIMICM001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HIMICM001_Bloc>()
            .add(TRICKER_HIMICM001geteachITEM());
      },
      ItemPick: HIMICM001var.ItemPick,
      PCS: HIMICM001var.PCS,
      PCSleft: HIMICM001var.PCSleft,
      POINTs: HIMICM001var.POINTs,
      UNIT: HIMICM001var.UNIT,
      INTERSEC: HIMICM001var.INTERSEC,
      RESULTFORMAT: HIMICM001var.RESULTFORMAT,
      Ghtype: HIMICM001var.GRAPHTYPE,
      GAP: HIMICM001var.GAP,
      GAPnameList: HIMICM001var.GAPnameList,
      GAPname: HIMICM001var.GAPname,
      GAPnamePick: (v) {
        HIMICM001var.GAPname = v;
        context
            .read<TRICKER_HIMICM001_Bloc>()
            .add(TRICKER_HIMICM001geteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((HIMICM001var.RESULTFORMAT == 'Graph' &&
                HIMICM001var.GAPname != '') ||
            HIMICM001var.RESULTFORMAT != 'Graph') {
          if (HIMICM001var.PCS != '' &&
              HIMICM001var.POINTs != '' &&
              HIMICM001var.ItemPickSELECT != '') {
            if (int.parse(HIMICM001var.POINTs) >
                HIMICM001var.confirmdata.length) {
              context
                  .read<TRICKER_HIMICM001_Bloc>()
                  .add(TRICKER_HIMICM001confirmdata());
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
        if (HIMICM001var.PCS != '' &&
            HIMICM001var.POINTs != '' &&
            HIMICM001var.ItemPickSELECT != '') {
          if (int.parse(HIMICM001var.POINTs) ==
              HIMICM001var.confirmdata.length) {
            if (int.parse(HIMICM001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_HIMICM001_Bloc>()
                  .add(TRICKER_HIMICM001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: HIMICM001var.preview,
      confirmdata: HIMICM001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_HIMICM001_Bloc>().add(TRICKER_HIMICM001CLEAR());
      },
      BACKPAGE: (v) {
        HIMICM001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HIMICM001var.ItemPickSELECT = '';
        context.read<TRICKER_HIMICM001_Bloc>().add(TRICKER_HIMICM001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_HIMICM001_Bloc>()
            .add(TRICKER_HIMICM001RESETVALUE());
      },
      ITEMleftUNIT: HIMICM001var.ITEMleftUNIT,
      ITEMleftVALUE: HIMICM001var.ITEMleftVALUE,
      PICB64: HIMICM001var.PICs,
    );
  }
}
