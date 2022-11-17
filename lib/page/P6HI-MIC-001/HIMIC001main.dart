import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/06-01-HIMIC001.dart';
import '../../bloc/BlocEvent/06-02-TrickHIMIC001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'HIMIC001var.dart';

class MICROVICKER_HIMIC001main extends StatelessWidget {
  MICROVICKER_HIMIC001main({Key? key, this.data}) : super(key: key);
  HIMIC001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HIMIC001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HIMIC001_BlocBuffer extends StatelessWidget {
  _TRICKER_HIMIC001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HIMIC001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HIMIC001_Bloc(),
        child: BlocBuilder<TRICKER_HIMIC001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HIMIC001body(data: data);
          },
        ));
  }
}

class ROCKWELL_HIMIC001body extends StatefulWidget {
  ROCKWELL_HIMIC001body({Key? key, this.data}) : super(key: key);
  HIMIC001SCHEMA? data;

  @override
  State<ROCKWELL_HIMIC001body> createState() => _ROCKWELL_HIMIC001bodyState();
}

class _ROCKWELL_HIMIC001bodyState extends State<ROCKWELL_HIMIC001body> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<HIMIC001_Bloc>().add(HIMIC001_READ());
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
    HIMIC001var.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    HIMIC001var.ItemPickSELECT = '';
    context.read<TRICKER_HIMIC001_Bloc>().add(TRICKER_HIMIC001SETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 5;
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HIMIC001var.PO = widget.data?.PO ?? '';
        HIMIC001var.CP = widget.data?.CP ?? '';
        HIMIC001var.QTY = widget.data?.QTY ?? '';
        HIMIC001var.PROCESS = widget.data?.PROCESS ?? '';
        HIMIC001var.CUSLOT = widget.data?.CUSLOT ?? '';
        HIMIC001var.TPKLOT = widget.data?.TPKLOT ?? '';
        HIMIC001var.FG = widget.data?.FG ?? '';
        HIMIC001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HIMIC001var.PART = widget.data?.PART ?? '';
        HIMIC001var.PARTNAME = widget.data?.PARTNAME ?? '';
        HIMIC001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HIMIC001var.ItemPick = widget.data?.ItemPick ?? [''];
        HIMIC001var.PCS = widget.data?.PCS ?? '';
        // HIMIC001var.PCS = '10';
        HIMIC001var.PCSleft = widget.data?.PCSleft ?? '';
        // HIMIC001var.PCSleft = '10';
        HIMIC001var.POINTs = widget.data?.POINTs ?? '';
        // HIMIC001var.POINTs = '10';
        // if (HIMIC001var.ItemPickSELECT != "") {
        //   //
        //   if (HIMIC001var.POINTs == "") {
        //     //
        //     HIMIC001var.POINTs == "0";
        //   }
        // }
        HIMIC001var.UNIT = widget.data?.UNIT ?? '';
        // HIMIC001var.UNIT = 'pcs/lots';
        HIMIC001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HIMIC001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HIMIC001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HIMIC001var.GAP = widget.data?.GAP ?? '';
        HIMIC001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        HIMIC001var.preview = widget.data?.preview ?? [];
        HIMIC001var.confirmdata = widget.data?.confirmdata ?? [];
        HIMIC001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HIMIC001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        HIMIC001var.PICs = widget.data?.Pic ?? '';

        if (HIMIC001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<HIMIC001_Bloc>().add(HIMIC001_READ());
      });
      HIMIC001var.DHtimer = timer;
    }
    return SINGLESHOTmain(
      //------ Left
      LABEL: "HI-RGH-001",
      PO: HIMIC001var.PO,
      CP: HIMIC001var.CP,
      QTY: HIMIC001var.QTY,
      PROCESS: HIMIC001var.PROCESS,
      CUSLOT: HIMIC001var.CUSLOT,
      TPKLOT: HIMIC001var.TPKLOT,
      FG: HIMIC001var.FG,
      CUSTOMER: HIMIC001var.CUSTOMER,
      PART: HIMIC001var.PART,
      PARTNAME: HIMIC001var.PARTNAME,
      MATERIAL: HIMIC001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HIMIC001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HIMIC001_Bloc>()
            .add(TRICKER_HIMIC001geteachITEM());
      },
      ItemPick: HIMIC001var.ItemPick,
      PCS: HIMIC001var.PCS,
      PCSleft: HIMIC001var.PCSleft,
      POINTs: HIMIC001var.POINTs,
      UNIT: HIMIC001var.UNIT,
      INTERSEC: HIMIC001var.INTERSEC,
      RESULTFORMAT: HIMIC001var.RESULTFORMAT,
      Ghtype: HIMIC001var.GRAPHTYPE,
      GAP: HIMIC001var.GAP,
      GAPnameList: HIMIC001var.GAPnameList,
      GAPname: HIMIC001var.GAPname,
      GAPnamePick: (v) {
        HIMIC001var.GAPname = v;
        context
            .read<TRICKER_HIMIC001_Bloc>()
            .add(TRICKER_HIMIC001geteachGRAPH());
      },
      //------- Bottom
      ACCEPT: (v) {
        if ((HIMIC001var.RESULTFORMAT == 'Graph' &&
                HIMIC001var.GAPname != '') ||
            HIMIC001var.RESULTFORMAT != 'Graph') {
          if (HIMIC001var.PCS != '' &&
              HIMIC001var.POINTs != '' &&
              HIMIC001var.ItemPickSELECT != '') {
            if (int.parse(HIMIC001var.POINTs) >
                HIMIC001var.confirmdata.length) {
              context
                  .read<TRICKER_HIMIC001_Bloc>()
                  .add(TRICKER_HIMIC001confirmdata());
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
        if (HIMIC001var.PCS != '' &&
            HIMIC001var.POINTs != '' &&
            HIMIC001var.ItemPickSELECT != '') {
          if (int.parse(HIMIC001var.POINTs) == HIMIC001var.confirmdata.length) {
            if (int.parse(HIMIC001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_HIMIC001_Bloc>()
                  .add(TRICKER_HIMIC001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: HIMIC001var.preview,
      confirmdata: HIMIC001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_HIMIC001_Bloc>().add(TRICKER_HIMIC001CLEAR());
      },
      BACKPAGE: (v) {
        HIMIC001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HIMIC001var.ItemPickSELECT = '';
        context.read<TRICKER_HIMIC001_Bloc>().add(TRICKER_HIMIC001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_HIMIC001_Bloc>().add(TRICKER_HIMIC001RESETVALUE());
      },
      ITEMleftUNIT: HIMIC001var.ITEMleftUNIT,
      ITEMleftVALUE: HIMIC001var.ITEMleftVALUE,
      PICB64: HIMIC001var.PICs,
    );
  }
}
