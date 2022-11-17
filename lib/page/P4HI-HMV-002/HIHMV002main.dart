import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-01-HIHMV002.dart';
import '../../bloc/BlocEvent/04-02-TrickHIHMV002.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W2MULTISHOT/MULTISHOTwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'HIHMV002var.dart';

class MICROVICKER_HIHMV002main extends StatelessWidget {
  MICROVICKER_HIHMV002main({Key? key, this.data}) : super(key: key);
  HIHMV002SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HIHMV002_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HIHMV002_BlocBuffer extends StatelessWidget {
  _TRICKER_HIHMV002_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HIHMV002SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HIHMV002_Bloc(),
        child: BlocBuilder<TRICKER_HIHMV002_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HIHMV002body(data: data);
          },
        ));
  }
}

class ROCKWELL_HIHMV002body extends StatefulWidget {
  ROCKWELL_HIHMV002body({Key? key, this.data}) : super(key: key);
  HIHMV002SCHEMA? data;

  @override
  State<ROCKWELL_HIHMV002body> createState() => _ROCKWELL_HIHMV002bodyState();
}

class _ROCKWELL_HIHMV002bodyState extends State<ROCKWELL_HIHMV002body> {
  @override
  void initState() {
    super.initState();
    context.read<HIHMV002_Bloc>().add(HIHMV002_READ());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HIHMV002var.PO = widget.data?.PO ?? '';
        HIHMV002var.CP = widget.data?.CP ?? '';
        HIHMV002var.QTY = widget.data?.QTY ?? '';
        HIHMV002var.PROCESS = widget.data?.PROCESS ?? '';
        HIHMV002var.CUSLOT = widget.data?.CUSLOT ?? '';
        HIHMV002var.TPKLOT = widget.data?.TPKLOT ?? '';
        HIHMV002var.FG = widget.data?.FG ?? '';
        HIHMV002var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HIHMV002var.PART = widget.data?.PART ?? '';
        HIHMV002var.PARTNAME = widget.data?.PARTNAME ?? '';
        HIHMV002var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HIHMV002var.ItemPick = widget.data?.ItemPick ?? [''];
        HIHMV002var.PCS = widget.data?.PCS ?? '';
        // HIHMV002var.PCS = '10';
        HIHMV002var.PCSleft = widget.data?.PCSleft ?? '';
        // HIHMV002var.PCSleft = '10';
        HIHMV002var.POINTs = widget.data?.POINTs ?? '';
        // HIHMV002var.POINTs = '10';
        // if (HIHMV002var.ItemPickSELECT != "") {
        //   //
        //   if (HIHMV002var.POINTs == "") {
        //     //
        //     HIHMV002var.POINTs == "0";
        //   }
        // }
        HIHMV002var.UNIT = widget.data?.UNIT ?? '';
        // HIHMV002var.UNIT = 'pcs/lots';
        HIHMV002var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HIHMV002var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HIHMV002var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HIHMV002var.GAP = widget.data?.GAP ?? '';
        HIHMV002var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        HIHMV002var.preview = widget.data?.preview ?? [];
        HIHMV002var.confirmdata = widget.data?.confirmdata ?? [];
        HIHMV002var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HIHMV002var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        HIHMV002var.PICs = widget.data?.Pic ?? '';

        if (HIHMV002var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<HIHMV002_Bloc>().add(HIHMV002_READ());
      });
      HIHMV002var.DHtimer = timer;
    }
    return MULTISHOTmain(
      //------ Left
      LABEL: "HI-HMV-002",
      PO: HIHMV002var.PO,
      CP: HIHMV002var.CP,
      QTY: HIHMV002var.QTY,
      PROCESS: HIHMV002var.PROCESS,
      CUSLOT: HIHMV002var.CUSLOT,
      TPKLOT: HIHMV002var.TPKLOT,
      FG: HIHMV002var.FG,
      CUSTOMER: HIHMV002var.CUSTOMER,
      PART: HIHMV002var.PART,
      PARTNAME: HIHMV002var.PARTNAME,
      MATERIAL: HIHMV002var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HIHMV002var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HIHMV002_Bloc>()
            .add(TRICKER_HIHMV002geteachITEM());
      },
      ItemPick: HIHMV002var.ItemPick,
      PCS: HIHMV002var.PCS,
      PCSleft: HIHMV002var.PCSleft,
      POINTs: HIHMV002var.POINTs,
      UNIT: HIHMV002var.UNIT,
      INTERSEC: HIHMV002var.INTERSEC,
      RESULTFORMAT: HIHMV002var.RESULTFORMAT,
      Ghtype: HIHMV002var.GRAPHTYPE,
      GAP: HIHMV002var.GAP,
      GAPnameList: HIHMV002var.GAPnameList,
      GAPname: HIHMV002var.GAPname,
      GAPnamePick: (v) {
        HIHMV002var.GAPname = v;
        context
            .read<TRICKER_HIHMV002_Bloc>()
            .add(TRICKER_HIHMV002geteachGRAPH());
      },
      //------- Bottom
      DATA1: (v) {
        context
            .read<TRICKER_HIHMV002_Bloc>()
            .add(TRICKER_HIHMV002confirmdata1());
      },
      DATA2: (v) {
        context
            .read<TRICKER_HIHMV002_Bloc>()
            .add(TRICKER_HIHMV002confirmdata2());
      },
      DATA3: (v) {
        context
            .read<TRICKER_HIHMV002_Bloc>()
            .add(TRICKER_HIHMV002confirmdata3());
      },
      FINISH: (v) {
        if (HIHMV002var.PCS != '' &&
            HIHMV002var.POINTs != '' &&
            HIHMV002var.ItemPickSELECT != '') {
          if (int.parse(HIHMV002var.POINTs) == HIHMV002var.confirmdata.length) {
            if (int.parse(HIHMV002var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_HIHMV002_Bloc>()
                  .add(TRICKER_HIHMV002FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: HIHMV002var.preview,
      confirmdata: HIHMV002var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_HIHMV002_Bloc>().add(TRICKER_HIHMV002CLEAR());
      },
      BACKPAGE: (v) {
        HIHMV002var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HIHMV002var.ItemPickSELECT = '';
        context.read<TRICKER_HIHMV002_Bloc>().add(TRICKER_HIHMV002SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_HIHMV002_Bloc>().add(TRICKER_HIHMV002RESETVALUE());
      },
      ITEMleftUNIT: HIHMV002var.ITEMleftUNIT,
      ITEMleftVALUE: HIHMV002var.ITEMleftVALUE,
      PICB64: HIHMV002var.PICs,
    );
  }
}
