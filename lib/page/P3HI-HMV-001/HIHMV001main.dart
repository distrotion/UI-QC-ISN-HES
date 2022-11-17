import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/03-01-HIHMV001.dart';
import '../../bloc/BlocEvent/03-02-TrickHIHMV001.dart';
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
import 'HIHMV001var.dart';

class MICROVICKER_HIHMV001main extends StatelessWidget {
  MICROVICKER_HIHMV001main({Key? key, this.data}) : super(key: key);
  HIHMV001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_HIHMV001_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_HIHMV001_BlocBuffer extends StatelessWidget {
  _TRICKER_HIHMV001_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  HIHMV001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_HIHMV001_Bloc(),
        child: BlocBuilder<TRICKER_HIHMV001_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_HIHMV001body(data: data);
          },
        ));
  }
}

class ROCKWELL_HIHMV001body extends StatefulWidget {
  ROCKWELL_HIHMV001body({Key? key, this.data}) : super(key: key);
  HIHMV001SCHEMA? data;

  @override
  State<ROCKWELL_HIHMV001body> createState() => _ROCKWELL_HIHMV001bodyState();
}

class _ROCKWELL_HIHMV001bodyState extends State<ROCKWELL_HIHMV001body> {
  @override
  void initState() {
    super.initState();
    context.read<HIHMV001_Bloc>().add(HIHMV001_READ());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        HIHMV001var.PO = widget.data?.PO ?? '';
        HIHMV001var.CP = widget.data?.CP ?? '';
        HIHMV001var.QTY = widget.data?.QTY ?? '';
        HIHMV001var.PROCESS = widget.data?.PROCESS ?? '';
        HIHMV001var.CUSLOT = widget.data?.CUSLOT ?? '';
        HIHMV001var.TPKLOT = widget.data?.TPKLOT ?? '';
        HIHMV001var.FG = widget.data?.FG ?? '';
        HIHMV001var.CUSTOMER = widget.data?.CUSTOMER ?? '';
        HIHMV001var.PART = widget.data?.PART ?? '';
        HIHMV001var.PARTNAME = widget.data?.PARTNAME ?? '';
        HIHMV001var.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        HIHMV001var.ItemPick = widget.data?.ItemPick ?? [''];
        HIHMV001var.PCS = widget.data?.PCS ?? '';
        // HIHMV001var.PCS = '10';
        HIHMV001var.PCSleft = widget.data?.PCSleft ?? '';
        // HIHMV001var.PCSleft = '10';
        HIHMV001var.POINTs = widget.data?.POINTs ?? '';
        // HIHMV001var.POINTs = '10';
        // if (HIHMV001var.ItemPickSELECT != "") {
        //   //
        //   if (HIHMV001var.POINTs == "") {
        //     //
        //     HIHMV001var.POINTs == "0";
        //   }
        // }
        HIHMV001var.UNIT = widget.data?.UNIT ?? '';
        // HIHMV001var.UNIT = 'pcs/lots';
        HIHMV001var.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        HIHMV001var.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        HIHMV001var.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        HIHMV001var.GAP = widget.data?.GAP ?? '';
        HIHMV001var.GAPnameList = widget.data?.GAPnameList ?? [''];
        //
        HIHMV001var.preview = widget.data?.preview ?? [];
        HIHMV001var.confirmdata = widget.data?.confirmdata ?? [];
        HIHMV001var.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        HIHMV001var.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];
        //

        HIHMV001var.PICs = widget.data?.Pic ?? '';

        if (HIHMV001var.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<HIHMV001_Bloc>().add(HIHMV001_READ());
      });
      HIHMV001var.DHtimer = timer;
    }
    return MULTISHOTmain(
      //------ Left
      LABEL: "HI-HMV-001",
      PO: HIHMV001var.PO,
      CP: HIHMV001var.CP,
      QTY: HIHMV001var.QTY,
      PROCESS: HIHMV001var.PROCESS,
      CUSLOT: HIHMV001var.CUSLOT,
      TPKLOT: HIHMV001var.TPKLOT,
      FG: HIHMV001var.FG,
      CUSTOMER: HIHMV001var.CUSTOMER,
      PART: HIHMV001var.PART,
      PARTNAME: HIHMV001var.PARTNAME,
      MATERIAL: HIHMV001var.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        HIHMV001var.ItemPickSELECT = v;
        //
        context
            .read<TRICKER_HIHMV001_Bloc>()
            .add(TRICKER_HIHMV001geteachITEM());
      },
      ItemPick: HIHMV001var.ItemPick,
      PCS: HIHMV001var.PCS,
      PCSleft: HIHMV001var.PCSleft,
      POINTs: HIHMV001var.POINTs,
      UNIT: HIHMV001var.UNIT,
      INTERSEC: HIHMV001var.INTERSEC,
      RESULTFORMAT: HIHMV001var.RESULTFORMAT,
      Ghtype: HIHMV001var.GRAPHTYPE,
      GAP: HIHMV001var.GAP,
      GAPnameList: HIHMV001var.GAPnameList,
      GAPname: HIHMV001var.GAPname,
      GAPnamePick: (v) {
        HIHMV001var.GAPname = v;
        context
            .read<TRICKER_HIHMV001_Bloc>()
            .add(TRICKER_HIHMV001geteachGRAPH());
      },
      //------- Bottom
      DATA1: (v) {
        context
            .read<TRICKER_HIHMV001_Bloc>()
            .add(TRICKER_HIHMV001confirmdata1());
      },
      DATA2: (v) {
        context
            .read<TRICKER_HIHMV001_Bloc>()
            .add(TRICKER_HIHMV001confirmdata2());
      },
      DATA3: (v) {
        print("----");
        context
            .read<TRICKER_HIHMV001_Bloc>()
            .add(TRICKER_HIHMV001confirmdata3());
      },
      FINISH: (v) {
        if (HIHMV001var.PCS != '' &&
            HIHMV001var.POINTs != '' &&
            HIHMV001var.ItemPickSELECT != '') {
          if (int.parse(HIHMV001var.POINTs) == HIHMV001var.confirmdata.length) {
            if (int.parse(HIHMV001var.PCSleft) > 0) {
              onLoadingFAKE(context);
              context
                  .read<TRICKER_HIHMV001_Bloc>()
                  .add(TRICKER_HIHMV001FINISH());
            }
          } else {
            WORNINGpop(context, "POINTs are not complete");
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: HIHMV001var.preview,
      confirmdata: HIHMV001var.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_HIHMV001_Bloc>().add(TRICKER_HIHMV001CLEAR());
      },
      BACKPAGE: (v) {
        HIHMV001var.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        HIHMV001var.ItemPickSELECT = '';
        context.read<TRICKER_HIHMV001_Bloc>().add(TRICKER_HIHMV001SETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context.read<TRICKER_HIHMV001_Bloc>().add(TRICKER_HIHMV001RESETVALUE());
      },
      ITEMleftUNIT: HIHMV001var.ITEMleftUNIT,
      ITEMleftVALUE: HIHMV001var.ITEMleftVALUE,
      //
      PICB64: HIHMV001var.PICs,
    );
  }
}
