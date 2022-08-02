import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/02-01-APPINSHES.dart';
import '../../bloc/BlocEvent/02-02-TrickAPPINSHES.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTAPR/SINGLESHOTAPRwidget.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'APPINSHESvar.dart';

class APPEARANCE_APPINSHESmain extends StatelessWidget {
  APPEARANCE_APPINSHESmain({Key? key, this.data}) : super(key: key);
  APPINSHESSCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_APPINSHES_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_APPINSHES_BlocBuffer extends StatelessWidget {
  _TRICKER_APPINSHES_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  APPINSHESSCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_APPINSHES_Bloc(),
        child: BlocBuilder<TRICKER_APPINSHES_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_APPINSHESbody(data: data, trick: trick);
          },
        ));
  }
}

class ROCKWELL_APPINSHESbody extends StatefulWidget {
  ROCKWELL_APPINSHESbody({Key? key, this.data, this.trick}) : super(key: key);
  APPINSHESSCHEMA? data;
  String? trick;

  @override
  State<ROCKWELL_APPINSHESbody> createState() => _ROCKWELL_APPINSHESbodyState();
}

class _ROCKWELL_APPINSHESbodyState extends State<ROCKWELL_APPINSHESbody> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<APPINSHES_Bloc>().add(APPINSHES_READ());
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
    APPINSHESvar.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    APPINSHESvar.ItemPickSELECT = '';
    context.read<TRICKER_APPINSHES_Bloc>().add(TRICKER_APPINSHESSETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 8;
    // print(widget.data?.UPDATE);

    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        APPINSHESvar.PO = widget.data?.PO ?? '';
        APPINSHESvar.CP = widget.data?.CP ?? '';
        APPINSHESvar.QTY = widget.data?.QTY ?? '';
        APPINSHESvar.PROCESS = widget.data?.PROCESS ?? '';
        APPINSHESvar.CUSLOT = widget.data?.CUSLOT ?? '';
        APPINSHESvar.TPKLOT = widget.data?.TPKLOT ?? '';
        APPINSHESvar.FG = widget.data?.FG ?? '';
        APPINSHESvar.CUSTOMER = widget.data?.CUSTOMER ?? '';
        APPINSHESvar.PART = widget.data?.PART ?? '';
        APPINSHESvar.PARTNAME = widget.data?.PARTNAME ?? '';
        APPINSHESvar.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        APPINSHESvar.ItemPick = widget.data?.ItemPick ?? [''];
        APPINSHESvar.PCS = widget.data?.PCS ?? '';
        // APPINSHESvar.PCS = '10';
        APPINSHESvar.PCSleft = widget.data?.PCSleft ?? '';
        // APPINSHESvar.PCSleft = '10';
        APPINSHESvar.POINTs = widget.data?.POINTs ?? '';
        // APPINSHESvar.POINTs = '10';
        APPINSHESvar.UNIT = widget.data?.UNIT ?? '';
        // APPINSHESvar.UNIT = 'pcs/lots';
        APPINSHESvar.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        APPINSHESvar.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        APPINSHESvar.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        APPINSHESvar.GAP = widget.data?.GAP ?? '';
        //
        APPINSHESvar.preview = widget.data?.preview ?? [];
        APPINSHESvar.confirmdata = widget.data?.confirmdata ?? [];
        APPINSHESvar.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        APPINSHESvar.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (APPINSHESvar.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      // if (widget.trick == 'OK' &&
      //     APPINSHESvar.PCSleft != '0' &&
      //     APPINSHESvar.PCS != '' &&
      //     APPINSHESvar.PCSleft != '' &&
      //     (int.parse(APPINSHESvar.PCSleft) < int.parse(APPINSHESvar.PCS))) {
      //   widget.trick = '';
      //   context.read<TRICKER_APPINSHES_Bloc>().add(TRICKER_APPINSHESFINISH());
      // }

      Timer timer = Timer(const Duration(seconds: 1), () {
        context.read<APPINSHES_Bloc>().add(APPINSHES_READ());
      });
      APPINSHESvar.DHtimer = timer;
    }
    return SINGLESHOTAPRmain(
      //------ Left
      LABEL: "APP-INSHES",
      PO: APPINSHESvar.PO,
      CP: APPINSHESvar.CP,
      QTY: APPINSHESvar.QTY,
      PROCESS: APPINSHESvar.PROCESS,
      CUSLOT: APPINSHESvar.CUSLOT,
      TPKLOT: APPINSHESvar.TPKLOT,
      FG: APPINSHESvar.FG,
      CUSTOMER: APPINSHESvar.CUSTOMER,
      PART: APPINSHESvar.PART,
      PARTNAME: APPINSHESvar.PARTNAME,
      MATERIAL: APPINSHESvar.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);
        APPINSHESvar.ItemPickSELECT = v;

        context
            .read<TRICKER_APPINSHES_Bloc>()
            .add(TRICKER_APPINSHESgeteachITEM());
      },
      ItemPick: APPINSHESvar.ItemPick,
      PCS: APPINSHESvar.PCS,
      PCSleft: APPINSHESvar.PCSleft,
      POINTs: APPINSHESvar.POINTs,
      UNIT: APPINSHESvar.UNIT,
      INTERSEC: APPINSHESvar.INTERSEC,
      RESULTFORMAT: APPINSHESvar.RESULTFORMAT,
      Ghtype: APPINSHESvar.GRAPHTYPE,
      //------- Bottom
      GOOD: (v) {
        APPINSHESvar.APPEARANCE = 'Good';
        if (APPINSHESvar.PCS != '' &&
            APPINSHESvar.POINTs != '' &&
            APPINSHESvar.ItemPickSELECT != '') {
          if (int.parse(APPINSHESvar.PCSleft) > 0) {
            onLoadingFAKE(context);
            context
                .read<TRICKER_APPINSHES_Bloc>()
                .add(TRICKER_APPINSHESFINISH());
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      NOGOOD: (v) {
        if (APPINSHESvar.PCS != '' &&
            APPINSHESvar.POINTs != '' &&
            APPINSHESvar.ItemPickSELECT != '') {
          if (int.parse(APPINSHESvar.PCSleft) > 0) {
            APPINSHESvar.APPEARANCE = 'no Good';
          }
        } else {
          WORNINGpop(context, "Please select item");
        }
      },
      preview: APPINSHESvar.preview,
      confirmdata: APPINSHESvar.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {
        context.read<TRICKER_APPINSHES_Bloc>().add(TRICKER_APPINSHESCLEAR());
      },
      BACKPAGE: (v) {
        APPINSHESvar.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        APPINSHESvar.ItemPickSELECT = '';
        context.read<TRICKER_APPINSHES_Bloc>().add(TRICKER_APPINSHESSETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {
        context
            .read<TRICKER_APPINSHES_Bloc>()
            .add(TRICKER_APPINSHESRESETVALUE());
      },
      ITEMleftUNIT: APPINSHESvar.ITEMleftUNIT,
      ITEMleftVALUE: APPINSHESvar.ITEMleftVALUE,
    );
  }
}
