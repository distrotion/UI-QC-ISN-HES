import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/Cubit/31-ReportPDFCommoncubit.dart';
import '../../bloc/Cubit/30-Reportset.dart';
import '../../data/CommonTestData.dart';
import '../../data/global.dart';

import '../../widget/ReportComponent/CommonReport.dart';
import '../../widget/ReportComponent/PicSlot.dart';
import '../../widget/ReportComponent/SignSide.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/ErrorPopup.dart';
import '../../widget/common/Error_NO_Popup.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
import '../../widget/common/imgset.dart';
import '../../widget/function/helper.dart';
import '../P303QMMASTERQC/P303QMMASTERQCVAR.dart';
import '../P31ReportPDFcommon/ReportPDFCommonMain.dart';
import '../P31ReportPDFcommon/ReportPDFCommonvar.dart';

import '../page303.dart';
import '../page31.dart';
import '../page32.dart';
import '../page33.dart';
import '../page34.dart';
import '../page35.dart';

import 'P30SELECTReportvar.dart';

late BuildContext SELECTReportcontext;

class SELECTReport extends StatefulWidget {
  SELECTReport({
    Key? key,
    this.dataCommon,
  }) : super(key: key);
  CommonReportSet? dataCommon;
  @override
  State<SELECTReport> createState() => _SELECTReportState();
}

class _SELECTReportState extends State<SELECTReport> {
  @override
  void initState() {
    if (SELECTReportvar.PO != '') {
      SELECTReportvar.canf = false;
      context.read<Reportset_Cubit>().ReportsetCubit(SELECTReportvar.PO);
    }
    super.initState();
  }

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SELECTReportcontext = context;
    CommonReportSet _dataCommon = widget.dataCommon ??
        CommonReportSet(
          databasic: BasicCommonDATAset(),
        );
    //--------------------------------------

    // MapEntry("ACT2", "ACT2"),
    // MapEntry("REPORT", "REPORT"),
    // MapEntry("STDtest", "STDtest"),
    // MapEntry("Re_Dia", "Re_Dia"),

    print(">>>>>>>>>>>>>>>>>-----2");
    print(_dataCommon.databasic.reportset);
    print(">>>>>>>>>>>>>>>>>-----+2");
    SELECTReportvar.logo = _dataCommon.databasic.logoset;
    if (_dataCommon.databasic.reportset != '') {
      if (_dataCommon.databasic.reportset == 'ACT2') {
        return Page34();
      } else if (_dataCommon.databasic.reportset == 'REPORT') {
        return Page31();
      } else if (_dataCommon.databasic.reportset == 'STDtest') {
        return Page33();
      } else if (_dataCommon.databasic.reportset == 'Re_Dia') {
        return Page35();
      } else {
        return Page31();
      }
    } else {
      return SizedBox(
        height: 75,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(width: 30),
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text("Loading"),
          ],
        ),
      );
    }
  }
}
