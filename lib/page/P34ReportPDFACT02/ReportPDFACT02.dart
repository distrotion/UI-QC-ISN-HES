import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/Cubit/31-ReportPDFCommoncubit.dart';
import '../../bloc/Cubit/34-ReportPDFACT02cubit.dart';
import '../../data/global.dart';
import '../../widget/ReportComponent/CommonReport.dart';
import '../../widget/ReportComponent/PicSlot.dart';
import '../../widget/ReportComponent/SignSide.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
import '../../widget/common/graphpeak.dart';
import '../../widget/common/imgset.dart';
import '../../widget/function/helper.dart';
import '../P303QMMASTERQC/P303QMMASTERQCVAR.dart';
import '../P30SELECTReport/P30SELECTReportvar.dart';
import '../P31ReportPDFcommon/ReportPDFCommonMain.dart';
import 'ReportPDFACT02var.dart';

late BuildContext ReportPDFACT02context;

final GlobalKey _globalKey1 = GlobalKey();
final GlobalKey _globalKey2 = GlobalKey();

class ReportPDFACT02 extends StatefulWidget {
  ReportPDFACT02({
    Key? key,
    this.dataACT,
  }) : super(key: key);
  ACTReport02Output? dataACT;
  @override
  State<ReportPDFACT02> createState() => _ReportPDFACT02State();
}

class _ReportPDFACT02State extends State<ReportPDFACT02> {
  @override
  void initState() {
    ReportPDFACT02var.remark = '';
    String d = SELECTReportvar.logo;
    if (d == '2') {
      setState(() {
        ReportPDFACT02var.SCMASKTYPE = SCMASK02;
      });
    } else if (d == '3') {
      setState(() {
        ReportPDFACT02var.SCMASKTYPE = SCMASK04;
      });
    } else if (d == '4') {
      setState(() {
        ReportPDFACT02var.SCMASKTYPE = new19062401;
      });
    } else if (d == '5') {
      setState(() {
        ReportPDFACT02var.SCMASKTYPE = new19062402;
      });
    } else {
      setState(() {
        ReportPDFACT02var.SCMASKTYPE = SCMASK03;
      });
    }
    ReportPDFACT02var.PASS = '';
    RepoteData.SUMLOT = '-';
    ReportPDFACT02var.dataout1 = [];
    ReportPDFACT02var.dataout2 = [];
    ReportPDFACT02var.dataout3 = [];
    if (ReportPDFACT02var.PO != '') {
      ReportPDFACT02var.canf = false;
      context
          .read<ReportPDFACT02cubit_Cubit>()
          .ReportPDF_ACT(ReportPDFACT02var.PO);
    }

    super.initState();
  }

  // final GlobalKey _globalKey1 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ReportPDFACT02context = context;

    if (ReportPDFACT02var.PO != '' && ReportPDFACT02var.dataout1.isEmpty) {
      Dio().post(
        "http://172.20.30.46:2200/getdata",
        data: {
          "name": ReportPDFACT02var.PO + '-1',
        },
      ).then((v) {
        var data = v.data;

        List<FlSpot> dataout = [];

        for (var i = 0; i < data.length; i++) {
          String datax = data[i]["X"] != null ? data[i]["X"].toString() : "";
          String dataZ = data[i]["Z"] != null ? data[i]["Z"].toString() : "";

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

        ReportPDFACT02var.dataout1 = dataout;
      });
      Dio().post(
        "http://172.20.30.46:2200/getdata",
        data: {
          "name": ReportPDFACT02var.PO + '-2',
        },
      ).then((v) {
        var data = v.data;

        List<FlSpot> dataout = [];

        for (var i = 0; i < data.length; i++) {
          String datax = data[i]["X"] != null ? data[i]["X"].toString() : "";
          String dataZ = data[i]["Z"] != null ? data[i]["Z"].toString() : "";

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

        ReportPDFACT02var.dataout2 = dataout;
      });
      Dio().post(
        "http://172.20.30.46:2200/getdata",
        data: {
          "name": ReportPDFACT02var.PO + '-3',
        },
      ).then((v) {
        var data = v.data;

        List<FlSpot> dataout = [];

        for (var i = 0; i < data.length; i++) {
          String datax = data[i]["X"] != null ? data[i]["X"].toString() : "";
          String dataZ = data[i]["Z"] != null ? data[i]["Z"].toString() : "";

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

        ReportPDFACT02var.dataout3 = dataout;
      });
    }

    ACTReport02Output _dataACT = widget.dataACT ??
        ACTReport02Output(
          databasic: BasicACTDATA(),
        );
    if (_dataACT.datain.isNotEmpty) {
      //
      ReportPDFACT02var.STATUS = 'REPORT READY';

      ReportPDFACT02var.CUSTOMER = _dataACT.databasic.CUSTOMER;
      ReportPDFACT02var.PROCESS = _dataACT.databasic.PROCESS;
      ReportPDFACT02var.PARTNAME = _dataACT.databasic.PARTNAME;
      ReportPDFACT02var.PARTNO = _dataACT.databasic.PARTNO;
      ReportPDFACT02var.PARTNO_s = _dataACT.databasic.PARTNO_s;
      ReportPDFACT02var.CUSLOT = _dataACT.databasic.CUSLOT;
      ReportPDFACT02var.TPKLOT = _dataACT.databasic.TPKLOT;
      ReportPDFACT02var.MATERIAL = _dataACT.databasic.MATERIAL;
      ReportPDFACT02var.QTY =
          double.parse(ConverstStr(_dataACT.databasic.QTY)).toStringAsFixed(0);

      ReportPDFACT02var.PIC01 = _dataACT.databasic.PIC01;
      ReportPDFACT02var.PIC02 = _dataACT.databasic.PIC02;
      ReportPDFACT02var.PICstd = _dataACT.databasic.PICstd;

      if (ReportPDFACT02var.PASS != 'N/A') {
        ReportPDFACT02var.PASS = _dataACT.databasic.PASS;
      }

      if (_dataACT.databasic.PARTNAMEref != '') {
        ReportPDFACT02var.remark =
            'Reference data from\n${_dataACT.databasic.PARTNAMEref}\n${_dataACT.databasic.PARTref}';
      }

      for (var i = 0; i < _dataACT.datain.length; i++) {
        for (var j = 0; j < _dataACT.datain.length; j++) {
          //
          //
          if (i == 0 &&
              _dataACT.datain[j].ITEM == 'ITEMs-5f19aa43fe12be0020dbd3bf') {
            //1
            ReportPDFACT02var.datalist[i].ITEMname =
                _dataACT.datain[j].ITEMname;
            ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFACT02var.datalist[i].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFACT02var.datalist[i].SPECIFICATIONname =
                _dataACT.datain[j].SPECIFICATIONname;
            ReportPDFACT02var.datalist[i].RESULT = _dataACT.datain[j].RESULT;
          }
          if (i == 2 &&
              _dataACT.datain[j].ITEM == 'ITEMs-60405bcf93e8d91950acb5c3') {
            //3
            ReportPDFACT02var.datalist[i].ITEMname =
                _dataACT.datain[j].ITEMname;
            ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFACT02var.datalist[i].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFACT02var.datalist[i].SPECIFICATIONname =
                _dataACT.datain[j].SPECIFICATIONname;
            ReportPDFACT02var.datalist[i].RESULT = _dataACT.datain[j].RESULT;
          }

          if (i == 3 &&
              _dataACT.datain[j].ITEM == 'ITEMs-60403f1693e8d91950acb5c0') {
            //4
            ReportPDFACT02var.datalist[i].ITEMname =
                _dataACT.datain[j].ITEMname;
            ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFACT02var.datalist[i].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFACT02var.datalist[i].SPECIFICATIONname =
                _dataACT.datain[j].SPECIFICATIONname;
            ReportPDFACT02var.datalist[i].RESULT = _dataACT.datain[j].RESULT;
          }
          //9 _dataACT.datain.length==11? i==9:
          if (_dataACT.datain.length == 11) {
            if (i == 9 &&
                _dataACT.datain[j].ITEM == 'ITEMs-60407f8f93e8d91950acb5d0') {
              //10
              ReportPDFACT02var.datalist[i].ITEMname =
                  _dataACT.datain[j].ITEMname;
              ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
              ReportPDFACT02var.datalist[i].METHODname =
                  _dataACT.datain[j].METHODname;
              ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
              ReportPDFACT02var.datalist[i].SPECIFICATIONname =
                  _dataACT.datain[j].SPECIFICATIONname;
              ReportPDFACT02var.datalist[i].RESULT = _dataACT.datain[j].RESULT;
            }
          } else {
            if (i == 10 &&
                _dataACT.datain[j].ITEM == 'ITEMs-60407f8f93e8d91950acb5d0') {
              //10
              ReportPDFACT02var.datalist[i].ITEMname =
                  _dataACT.datain[j].ITEMname;
              ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
              ReportPDFACT02var.datalist[i].METHODname =
                  _dataACT.datain[j].METHODname;
              ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
              ReportPDFACT02var.datalist[i].SPECIFICATIONname =
                  _dataACT.datain[j].SPECIFICATIONname;
              ReportPDFACT02var.datalist[i].RESULT = _dataACT.datain[j].RESULT;
            }
          }

          if (_dataACT.datain.length == 11) {
            if (i == 10 &&
                _dataACT.datain[j].ITEM == 'ITEMs-6040817293e8d91950acb5d5') {
              //11

              ReportPDFACT02var.datalist[i].ITEMname =
                  _dataACT.datain[j].ITEMname;
              ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
              ReportPDFACT02var.datalist[i].METHODname =
                  _dataACT.datain[j].METHODname;
              ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
              ReportPDFACT02var.datalist[i].SPECIFICATIONname =
                  _dataACT.datain[j].SPECIFICATION;
              ReportPDFACT02var.datalist[i].RESULT = _dataACT.datain[j].DATA01;
            }
          } else {
            if (i == 11 &&
                _dataACT.datain[j].ITEM == 'ITEMs-6040817293e8d91950acb5d5') {
              //11

              ReportPDFACT02var.datalist[i].ITEMname =
                  _dataACT.datain[j].ITEMname;
              ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
              ReportPDFACT02var.datalist[i].METHODname =
                  _dataACT.datain[j].METHODname;
              ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
              ReportPDFACT02var.datalist[i].SPECIFICATIONname =
                  _dataACT.datain[j].SPECIFICATION;
              ReportPDFACT02var.datalist[i].RESULT = _dataACT.datain[j].DATA01;
            }
          }

          if (i == 5 &&
              _dataACT.datain[j].ITEM == 'ITEMs-5f19a97cfe12be0020dbd3bc') {
            //6
            ReportPDFACT02var.datalist[i].ITEMname =
                _dataACT.datain[j].ITEMname;
            ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFACT02var.datalist[i].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFACT02var.datalist[i].CONTROLlimmit =
                _dataACT.datain[j].CONTROLlimmit;
            ReportPDFACT02var.datalist[i].SPECIFICATION =
                _dataACT.datain[j].SPECIFICATION;
            ReportPDFACT02var.datalist[i].DATA01 = _dataACT.datain[j].DATA01;
            ReportPDFACT02var.datalist[i].DATA02 = _dataACT.datain[j].DATA02;
            ReportPDFACT02var.datalist[i].DATA03 = _dataACT.datain[j].DATA03;
            ReportPDFACT02var.datalist[i].DATAAVG = _dataACT.datain[j].DATAAVG;
          }

          if (i == 6 &&
              _dataACT.datain[j].ITEM == 'ITEMs-6040810993e8d91950acb5d4') {
            //7
            ReportPDFACT02var.datalist[i].ITEMname =
                _dataACT.datain[j].ITEMname;
            ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFACT02var.datalist[i].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFACT02var.datalist[i].CONTROLlimmit =
                _dataACT.datain[j].CONTROLlimmit;
            ReportPDFACT02var.datalist[i].SPECIFICATION =
                _dataACT.datain[j].SPECIFICATION;
            ReportPDFACT02var.datalist[i].DATA01 = _dataACT.datain[j].DATA01;
            ReportPDFACT02var.datalist[i].DATA02 = _dataACT.datain[j].DATA02;
            ReportPDFACT02var.datalist[i].DATA03 = _dataACT.datain[j].DATA03;
            ReportPDFACT02var.datalist[i].DATAAVG = _dataACT.datain[j].DATAAVG;
          }

          if (i == 7 &&
              _dataACT.datain[j].ITEM == 'ITEMs-5f19a922fe12be0020dbd3ba') {
            //8
            ReportPDFACT02var.datalist[i].ITEMname =
                _dataACT.datain[j].ITEMname;
            ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFACT02var.datalist[i].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFACT02var.datalist[i].CONTROLlimmit =
                _dataACT.datain[j].CONTROLlimmit;
            ReportPDFACT02var.datalist[i].SPECIFICATION =
                _dataACT.datain[j].SPECIFICATION;
            ReportPDFACT02var.datalist[i].DATA01 = _dataACT.datain[j].DATA01;
            ReportPDFACT02var.datalist[i].DATA02 = _dataACT.datain[j].DATA02;
            ReportPDFACT02var.datalist[i].DATA03 = _dataACT.datain[j].DATA03;
            ReportPDFACT02var.datalist[i].DATAAVG = _dataACT.datain[j].DATAAVG;
          }

          if (i == 8 &&
              _dataACT.datain[j].ITEM == 'ITEMs-60407f6193e8d91950acb5cf') {
            //9
            ReportPDFACT02var.datalist[i].ITEMname =
                _dataACT.datain[j].ITEMname;
            ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFACT02var.datalist[i].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFACT02var.datalist[i].CONTROLlimmit =
                _dataACT.datain[j].CONTROLlimmit;
            ReportPDFACT02var.datalist[i].SPECIFICATION =
                _dataACT.datain[j].SPECIFICATION;
            ReportPDFACT02var.datalist[i].DATA01 = _dataACT.datain[j].DATA01;
            ReportPDFACT02var.datalist[i].DATA02 = _dataACT.datain[j].DATA02;
            ReportPDFACT02var.datalist[i].DATA03 = _dataACT.datain[j].DATA03;
            ReportPDFACT02var.datalist[i].DATAAVG = _dataACT.datain[j].DATAAVG;
          }

          //ITEMs-63f6065e9ea2e30a1031d846
          //ITEMs-63f606389ea2e30a1031d845
          //ITEMs-63f6060b9ea2e30a1031d844

          if (i == 1 &&
              // _dataACT.datain[j].ITEM == 'TYPE-5f171c36fe12be0020dbd354' ||
              _dataACT.datain[j].ITEM == 'ITEMs-63f6065e9ea2e30a1031d846') {
            // ReportPDFACT02var.datalist[i].ITEMname =
            //     _dataACT.datain[j].ITEMname;
            // ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
            // ReportPDFACT02var.datalist[i].METHODname =
            //     _dataACT.datain[j].METHODname;
            // ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
            // ReportPDFACT02var.datalist[i].CONTROLlimmit =
            //     _dataACT.datain[j].CONTROLlimmit;
            // ReportPDFACT02var.datalist[i].SPECIFICATION =
            //     _dataACT.datain[j].SPECIFICATION;
            // ReportPDFACT02var.datalist[i].DATA01 = _dataACT.datain[j].DATA01;
            // ReportPDFACT02var.datalist[i].DATA02 = _dataACT.datain[j].DATA02;
            // ReportPDFACT02var.datalist[i].DATA03 = _dataACT.datain[j].DATA03;
            // ReportPDFACT02var.datalist[i].DATAAVG = _dataACT.datain[j].DATAAVG;
            ReportPDFACT02var.datalist[i].ITEMname =
                _dataACT.datain[j].ITEMname;
            ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFACT02var.datalist[i].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFACT02var.datalist[i].SPECIFICATIONname =
                _dataACT.datain[j].SPECIFICATIONname;
            ReportPDFACT02var.datalist[i].RESULT = _dataACT.datain[j].RESULT;
          }

          if (i == 4 &&
              // _dataACT.datain[j].ITEM == 'TYPE-5f19a79ffe12be0020dbd3a8' ||
              _dataACT.datain[j].ITEM == 'ITEMs-63f606389ea2e30a1031d845') {
            // ReportPDFACT02var.datalist[i].ITEMname =
            //     _dataACT.datain[j].ITEMname;
            // ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
            // ReportPDFACT02var.datalist[i].METHODname =
            //     _dataACT.datain[j].METHODname;
            // ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
            // ReportPDFACT02var.datalist[i].CONTROLlimmit =
            //     _dataACT.datain[j].CONTROLlimmit;
            // ReportPDFACT02var.datalist[i].SPECIFICATION =
            //     _dataACT.datain[j].SPECIFICATION;
            // ReportPDFACT02var.datalist[i].DATA01 = _dataACT.datain[j].DATA01;
            // ReportPDFACT02var.datalist[i].DATA02 = _dataACT.datain[j].DATA02;
            // ReportPDFACT02var.datalist[i].DATA03 = _dataACT.datain[j].DATA03;
            // ReportPDFACT02var.datalist[i].DATAAVG = _dataACT.datain[j].DATAAVG;
            ReportPDFACT02var.datalist[i].ITEMname =
                _dataACT.datain[j].ITEMname;
            ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFACT02var.datalist[i].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFACT02var.datalist[i].SPECIFICATIONname =
                _dataACT.datain[j].SPECIFICATIONname;
            ReportPDFACT02var.datalist[i].RESULT = _dataACT.datain[j].RESULT;
          }
          if (_dataACT.datain.length == 11) {
          } else {
            if (i == 9 &&
                // _dataACT.datain[j].ITEM == 'TYPE-60407ff193e8d91950acb5d1' ||
                _dataACT.datain[j].ITEM == 'ITEMs-63f6060b9ea2e30a1031d844') {
              // ReportPDFACT02var.datalist[i].ITEMname =
              //     _dataACT.datain[j].ITEMname;
              // ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
              // ReportPDFACT02var.datalist[i].METHODname =
              //     _dataACT.datain[j].METHODname;
              // ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
              // ReportPDFACT02var.datalist[i].CONTROLlimmit =
              //     _dataACT.datain[j].CONTROLlimmit;
              // ReportPDFACT02var.datalist[i].SPECIFICATION =
              //     _dataACT.datain[j].SPECIFICATION;
              // ReportPDFACT02var.datalist[i].DATA01 = _dataACT.datain[j].DATA01;
              // ReportPDFACT02var.datalist[i].DATA02 = _dataACT.datain[j].DATA02;
              // ReportPDFACT02var.datalist[i].DATA03 = _dataACT.datain[j].DATA03;
              // ReportPDFACT02var.datalist[i].DATAAVG = _dataACT.datain[j].DATAAVG;
              print(_dataACT.datain[j].ITEMname);
              print(_dataACT.datain[j].SCMARK);
              print(_dataACT.datain[j].METHODname);
              print(_dataACT.datain[j].FREQ);
              print(_dataACT.datain[j].SPECIFICATIONname);
              print(_dataACT.datain[j].RESULT);
              ReportPDFACT02var.datalist[i].ITEMname =
                  _dataACT.datain[j].ITEMname;
              ReportPDFACT02var.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
              ReportPDFACT02var.datalist[i].METHODname =
                  _dataACT.datain[j].METHODname;
              ReportPDFACT02var.datalist[i].FREQ = _dataACT.datain[j].FREQ;
              ReportPDFACT02var.datalist[i].SPECIFICATIONname =
                  _dataACT.datain[j].SPECIFICATIONname;
              ReportPDFACT02var.datalist[i].RESULT = _dataACT.datain[j].RESULT;
            }
          }
        }
      }
    } else {
      ReportPDFACT02var.STATUS = 'WATTING or NO-DATA';

      ReportPDFACT02var.CUSTOMER = '';
      ReportPDFACT02var.PROCESS = '';
      ReportPDFACT02var.PARTNAME = '';
      ReportPDFACT02var.PARTNO = '';
      ReportPDFACT02var.PARTNO_s = '';
      ReportPDFACT02var.CUSLOT = '';
      ReportPDFACT02var.TPKLOT = '';
      ReportPDFACT02var.MATERIAL = '';
      ReportPDFACT02var.QTY = '';

      ReportPDFACT02var.PICstd = '';
      ReportPDFACT02var.PIC01 = '';
      ReportPDFACT02var.PIC02 = '';
      ReportPDFACT02var.PASS = '';

      ReportPDFACT02var.datalist = [
        ReportPDFACT02list(),
        ReportPDFACT02list(),
        ReportPDFACT02list(),
        ReportPDFACT02list(),
        ReportPDFACT02list(),
        ReportPDFACT02list(),
        ReportPDFACT02list(),
        ReportPDFACT02list(),
        ReportPDFACT02list(),
        ReportPDFACT02list(),
        ReportPDFACT02list(),
        ReportPDFACT02list(),
        ReportPDFACT02list(),
      ];
    }
    double sizep = 16;
    if (ReportPDFACT02var.CUSLOT.length > 100) {
      sizep = 12;
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: ComInputText(
                  height: 40,
                  width: 200,
                  isContr: ReportPDFACT02var.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFACT02var.iscontrol = input;
                    });
                  },
                  isEnabled: ReportPDFACT02var.canf,
                  sValue: ReportPDFACT02var.PO,
                  returnfunc: (String s) {
                    ReportPDFACT02var.PO = s;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    if (ReportPDFACT02var.PO != '') {
                      ReportPDFACT02var.canf = false;
                      context
                          .read<ReportPDFACT02cubit_Cubit>()
                          .ReportPDF_ACT(ReportPDFACT02var.PO);
                    }
                  },
                  child: Container(
                    color: Colors.black,
                    height: 40,
                    width: 40,
                    child: const Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    context.read<ReportPDFACT02cubit_Cubit>().Flush();
                    ReportPDFACT02var.canf = true;
                    ReportPDFACT02var.iscontrol = true;
                    ReportPDFACT02var.PO = '';
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.red,
                    height: 40,
                    width: 100,
                    child: const Center(
                      child: Text("CLEAR"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  color: ReportPDFACT02var.STATUS == 'REPORT READY'
                      ? Colors.green
                      : Colors.yellow,
                  height: 40,
                  width: 200,
                  child: Center(
                    child: Text(ReportPDFACT02var.STATUS),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  height: 40,
                  width: 150,
                  child: AdvanceDropDown(
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: const [
                      MapEntry("", "-"),
                      MapEntry("SUM", "SUM"),
                    ],
                    onChangeinside: (d, v) {
                      // print(d);
                      RepoteData.SUMLOT = d;
                      context
                          .read<ReportPDFACT02cubit_Cubit>()
                          .ReportPDF_ACT(ReportPDFACT02var.PO);
                    },
                    value: RepoteData.SUMLOT,
                    height: 40,
                    width: 100,
                  ),
                ),
              ),
              if (ReportPDFACT02var.PASS == "PASSED") ...[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: InkWell(
                    onTap: () {
                      PDFloader(context);
                      Future.delayed(const Duration(milliseconds: 1000), () {
                        capture2(
                          _globalKey1,
                          _globalKey2,
                          ReportPDFACT02var.PO,
                        ).then((value) {
                          print(value);

                          Navigator.pop(context);
                        });
                      });
                    },
                    child: Container(
                      color: Colors.yellow,
                      height: 50,
                      width: 100,
                      child: const Center(
                        child: Text("Print"),
                      ),
                    ),
                  ),
                ),
              ] else ...[
                if (USERDATA.UserLV > 5) ...[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      onTap: () {
                        ReportPDFACT02var.PASS = "N/A";
                        setState(() {});
                        PDFloader(context);
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          // capture2(
                          //   _globalKey1,
                          //   ReportPDFACT02var.PO,
                          // ).then((value) {
                          //   print(value);

                          //   Navigator.pop(context);
                          // });
                          capture2(
                            _globalKey1,
                            _globalKey2,
                            ReportPDFACT02var.PO,
                          ).then((value) {
                            print(value);

                            Navigator.pop(context);
                          });
                        });
                      },
                      child: Container(
                        color: Colors.yellow,
                        height: 50,
                        width: 100,
                        child: const Center(
                          child: Text("Print"),
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ],
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                onTap: () {
                  P303QMMASTERQCVAR.SETDAY = 'OK';
                  P303QMMASTERQCVAR.SEARCH = ReportPDFACT02var.PO;
                  var now = DateTime.now().subtract(Duration(days: 25));
                  P303QMMASTERQCVAR.day = DateFormat('dd').format(now);
                  P303QMMASTERQCVAR.month = DateFormat('MM').format(now);
                  P303QMMASTERQCVAR.year = DateFormat('yyyy').format(now);
                  STDreport2(context);
                },
                child: Container(
                  color: Colors.yellow,
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text("UD and QCFN"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                onTap: () {
                  //ReportPDFACT02var.PO
                  QCFN(context);
                },
                child: Container(
                  color: Colors.yellow,
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text("_QCFN"),
                  ),
                ),
              ),
            ),
          ]),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                RepaintBoundary(
                  key: _globalKey1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 24.0, right: 16.0, left: 16.0, bottom: 16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // const SizedBox(
                            //   width: 50,
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                height: 1950,
                                width: 1364,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 3),
                                  // color: Colors.red,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(0)),
                                ),
                                child: Column(
                                  children: [
                                    HEAD3SLOT(
                                      ListFlex: const [5, 4, 1],
                                      widget01: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Container(
                                              height: 120,
                                              width: 230,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "assets/images/logoonly_tpkpng.png",
                                                  ),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // PicShow(
                                          //     width: 120, height: 230, base64: tpklogo),
                                          SizedBox(
                                            height: 120,
                                            width: 400,
                                            child: Column(
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 20,
                                                  ),
                                                  child: Text(
                                                    "THAI PARKERIZING CO.,LTD.",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 40,
                                                  ),
                                                  child: Text(
                                                    "Heat & Surface Treatment Division",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      widget02: Column(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              height: 120,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 3,
                                                      style: BorderStyle.solid),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 20,
                                                          ),
                                                          child: Text(
                                                            "Quality Testing Report (ISONITE ESIE 1)",
                                                            style: TextStyle(
                                                              fontSize: 24,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 30,
                                                                  bottom: 10),
                                                          child: Text(
                                                            "(ใบรายงานผลการตรวจสอบผลิตภัณฑ์สำหรับกระบวนการ ISN)",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              height: 60,
                                              child: Center(
                                                child: Text(
                                                  "FR-HQC-03/028-00-25/10/22",
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      widget03: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 40,
                                                  ),
                                                  child: Text(
                                                    "PAGE",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 30, bottom: 10),
                                                  child: Text(
                                                    "1/1",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    HEAD4SLOT(
                                      ListFlex: [4, 8, 3, 5],
                                      widget01: const Center(
                                        child: Text(
                                          "Customer",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget02: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            ReportPDFACT02var.CUSTOMER,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      widget03: const Center(
                                        child: Text(
                                          "Process",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.PROCESS,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY4SLOT(
                                      ListFlex: [4, 8, 3, 5],
                                      widget01: const Center(
                                        child: Text(
                                          "Part Name",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget02: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            ReportPDFACT02var.PARTNAME,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      widget03: const Center(
                                        child: Text(
                                          "Part No.",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.PARTNO.contains("|")
                                              ? ReportPDFACT02var.PARTNO
                                                  .split("|")[1]
                                              : ReportPDFACT02var.PARTNO == ''
                                                  ? ReportPDFACT02var.PARTNO_s
                                                  : ReportPDFACT02var.PARTNO,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY2SLOT(
                                      ListFlex: [4, 16],
                                      widget01: Center(
                                        child: Text(
                                          "Customer Lot No.",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget02: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            ReportPDFACT02var.CUSLOT,
                                            style: TextStyle(
                                              // fontSize: 16,
                                              fontSize: sizep,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY6SLOT(
                                      ListFlex: [4, 6, 3, 3, 1, 3],
                                      widget01: const Center(
                                        child: Text(
                                          "TPK. Lot No.",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget02: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            ReportPDFACT02var.TPKLOT,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      widget03: const Center(
                                        child: Text(
                                          "Material",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.MATERIAL,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: const Center(
                                        child: Text(
                                          "Qty.",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFACT02var.QTY,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    HEAD1SLOT(
                                      widget01: const Center(
                                        child: Text(
                                          "INCOMING INSPECTION",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    HEAD7SLOT(
                                      ListFlex: [6, 1, 4, 2, 2, 2, 2],
                                      widget01: const Center(
                                        child: Text(
                                          "ITEM",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget02: const Center(
                                        child: Text(
                                          "SC",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget03: const Center(
                                        child: Text(
                                          "Check Method",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: const Center(
                                        child: Text(
                                          "Frequency",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget05: const Center(
                                        child: Text(
                                          "Specification",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget06: const Center(
                                        child: Text(
                                          "Result",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY7SLOT(
                                      ListFlex: [6, 1, 4, 2, 2, 2, 2],
                                      widget01: const Center(
                                        child: Text(
                                          "Appearance for Rust",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget02: const Center(
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget03: const Center(
                                        child: Text(
                                          "Visual",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget04: const Center(
                                        child: Text(
                                          "10 pcs/rcv.Lot",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: const Center(
                                        child: Text(
                                          "No Rust",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget06: const Center(
                                        child: Text(
                                          "No Rust",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget07: const Center(
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY7SLOT(
                                      ListFlex: [6, 1, 4, 2, 2, 2, 2],
                                      widget01: const Center(
                                        child: Text(
                                          "Appearance for Scratch",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget02: const Center(
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget03: const Center(
                                        child: Text(
                                          "Visual",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget04: const Center(
                                        child: Text(
                                          "10 pcs/rcv.Lot",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: const Center(
                                        child: Text(
                                          "No Scratch",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget06: const Center(
                                        child: Text(
                                          "No Scratch",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget07: const Center(
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    HEAD1SLOT(
                                      widget01: const Center(
                                        child: Text(
                                          "FINAL INSPECTION",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    HEAD6SLOT(
                                      ListFlex: [5, 1, 3, 2, 4, 4],
                                      widget01: const Center(
                                        child: Text(
                                          "ITEM",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget02: const Center(
                                        child: Text(
                                          "SC",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget03: const Center(
                                        child: Text(
                                          "Check Method",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: const Center(
                                        child: Text(
                                          "Frequency",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget05: const Center(
                                        child: Text(
                                          "Specification",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget06: const Center(
                                        child: Text(
                                          "Result",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY6SLOT(
                                      ListFlex: [5, 1, 3, 2, 4, 4],
                                      widget01: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[0].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget02: Center(
                                        child: ReportPDFACT02var
                                                    .datalist[0].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK01)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[0].METHODname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[0].FREQ,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[0].SPECIFICATIONname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[0].RESULT,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY6SLOT(
                                      ListFlex: [5, 1, 3, 2, 4, 4],
                                      widget01: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[1].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget02: Center(
                                        child: ReportPDFACT02var
                                                    .datalist[1].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK01)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[1].METHODname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[1].FREQ,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[1].SPECIFICATIONname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[1].RESULT,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY6SLOT(
                                      ListFlex: [5, 1, 3, 2, 4, 4],
                                      widget01: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[2].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget02: Center(
                                        child: ReportPDFACT02var
                                                    .datalist[2].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK01)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[2].METHODname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[2].FREQ,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[2].SPECIFICATIONname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[2].RESULT,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY6SLOT(
                                      ListFlex: [5, 1, 3, 2, 4, 4],
                                      widget01: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[3].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget02: Center(
                                        child: ReportPDFACT02var
                                                    .datalist[3].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK01)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[3].METHODname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[3].FREQ,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[3].SPECIFICATIONname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[3].RESULT,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY6SLOT(
                                      ListFlex: [5, 1, 3, 2, 4, 4],
                                      widget01: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[4].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget02: Center(
                                        child: ReportPDFACT02var
                                                    .datalist[4].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK01)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[4].METHODname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[4].FREQ,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[4].SPECIFICATIONname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[4].RESULT,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),

                                    BODY6SLOT(
                                      ListFlex: [5, 1, 3, 2, 4, 4],
                                      widget01: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[9].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget02: Center(
                                        child: ReportPDFACT02var
                                                    .datalist[9].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK01)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[9].METHODname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[9].FREQ,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[9].SPECIFICATIONname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[9].RESULT,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),

                                    BODY6SLOT(
                                      ListFlex: [5, 1, 3, 2, 4, 4],
                                      widget01: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[10].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget02: Center(
                                        child: ReportPDFACT02var
                                                    .datalist[10].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK01)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[10].METHODname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[10].FREQ,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[10].SPECIFICATIONname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[10].RESULT,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),

                                    BODY6SLOT(
                                      ListFlex: [5, 1, 3, 2, 4, 4],
                                      widget01: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[11].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget02: Center(
                                        child: ReportPDFACT02var
                                                    .datalist[11].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK01)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[11].METHODname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[11].FREQ,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[11].SPECIFICATIONname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[11].RESULT,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // HEAD1SLOT(),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    HEAD10SLOT(
                                      ListFlex: [
                                        16,
                                        4,
                                        12,
                                        8,
                                        6,
                                        6,
                                        4,
                                        4,
                                        4,
                                        4,
                                        4
                                      ],
                                      widget01: const Center(
                                        child: Text(
                                          "ITEM",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget02: const Center(
                                        child: Text(
                                          "SC",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget03: const Center(
                                        child: Text(
                                          "Check Method",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: const Center(
                                        child: Text(
                                          "Frequency",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget05: const Center(
                                        child: Text(
                                          "Specification",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget06: const Center(
                                        child: Text(
                                          "Control limit",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget07: const Center(
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget08: const Center(
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget09: const Center(
                                        child: Text(
                                          "3",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget10: const Center(
                                        child: Text(
                                          "AVG",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY10SLOT(
                                      ListFlex: [
                                        16,
                                        4,
                                        12,
                                        8,
                                        6,
                                        6,
                                        4,
                                        4,
                                        4,
                                        4,
                                        4
                                      ],
                                      widget01: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[5].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget02: Center(
                                        child: ReportPDFACT02var
                                                    .datalist[5].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK01)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[5].METHODname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[5].FREQ,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[5].SPECIFICATION,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[5].CONTROLlimmit,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget07: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[5].DATA01,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget08: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[5].DATA02,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget09: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[5].DATA03,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget10: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[5].DATAAVG,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY10SLOT(
                                      ListFlex: [
                                        16,
                                        4,
                                        12,
                                        8,
                                        6,
                                        6,
                                        4,
                                        4,
                                        4,
                                        4,
                                        4
                                      ],
                                      widget01: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[6].ITEMname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget02: Center(
                                        child: ReportPDFACT02var
                                                    .datalist[6].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK01)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[6].METHODname,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[6].FREQ,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[6].SPECIFICATION,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFACT02var
                                              .datalist[6].CONTROLlimmit,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget07: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[6].DATA01,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget08: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[6].DATA02,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget09: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[6].DATA03,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget10: Center(
                                        child: Text(
                                          ReportPDFACT02var.datalist[6].DATAAVG,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),

                                    BODY10SLOTX2(
                                      ListFlex: [
                                        16,
                                        4,
                                        12,
                                        8,
                                        6,
                                        6,
                                        4,
                                        4,
                                        4,
                                        4,
                                        4
                                      ],
                                      widget01: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 47,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 3,
                                                      style: BorderStyle.solid),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var
                                                      .datalist[7].ITEMname,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              height: 60,
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var
                                                      .datalist[8].ITEMname,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      widget02: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 47,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 3,
                                                      style: BorderStyle.solid),
                                                ),
                                              ),
                                              child: Center(
                                                child: ReportPDFACT02var
                                                            .datalist[7]
                                                            .SCMARK ==
                                                        'YES'
                                                    ? PicShow(
                                                        width: 42,
                                                        height: 42,
                                                        base64: SCMASK01)
                                                    : const Text(
                                                        "",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              height: 60,
                                              child: Center(
                                                child: ReportPDFACT02var
                                                            .datalist[8]
                                                            .SCMARK ==
                                                        'YES'
                                                    ? PicShow(
                                                        width: 42,
                                                        height: 42,
                                                        base64: SCMASK01)
                                                    : const Text(
                                                        "",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      widget03: const SizedBox(
                                        height: 97,
                                        child: Center(
                                          child: Text(
                                            "Micro Vickers Scope (X 500)",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      widget04: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 47,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 3,
                                                      style: BorderStyle.solid),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var
                                                      .datalist[7].FREQ,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              height: 60,
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var
                                                      .datalist[8].FREQ,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      widget05: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 47,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 3,
                                                      style: BorderStyle.solid),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var.datalist[7]
                                                      .SPECIFICATION,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              height: 60,
                                              child: Center(
                                                child: Text(
                                                  "${ReportPDFACT02var.datalist[8].SPECIFICATION}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      widget06: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 47,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 3,
                                                      style: BorderStyle.solid),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var.datalist[7]
                                                      .CONTROLlimmit,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              height: 60,
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var.datalist[8]
                                                      .CONTROLlimmit,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      widget07: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 47,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 3,
                                                      style: BorderStyle.solid),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var
                                                      .datalist[7].DATA01,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              height: 60,
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var
                                                      .datalist[8].DATA01,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      widget08: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 47,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 3,
                                                      style: BorderStyle.solid),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var
                                                      .datalist[7].DATA02,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              height: 60,
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var
                                                      .datalist[8].DATA02,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      widget09: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 47,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 3,
                                                      style: BorderStyle.solid),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var
                                                      .datalist[7].DATA03,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              height: 60,
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var
                                                      .datalist[8].DATA03,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      widget10: Column(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 47,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 3,
                                                      style: BorderStyle.solid),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var
                                                      .datalist[7].DATAAVG,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              height: 60,
                                              child: Center(
                                                child: Text(
                                                  ReportPDFACT02var
                                                      .datalist[8].DATAAVG,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    PICSLOT(
                                      HIs: 330,
                                      PIC01: _dataACT.databasic.PIC01,
                                      PIC02: _dataACT.databasic.PIC02,
                                    ),
                                    TAILSLOT(
                                      PASS: ReportPDFACT02var.PASS,
                                      PICS: _dataACT.databasic.PICstd,
                                      Remark: ReportPDFACT02var.remark,
                                      signs: true,
                                      NAME01: _dataACT.databasic.Inspected_sign,
                                      NAME02: _dataACT.databasic.Check_sign,
                                      NAME03: _dataACT.databasic.Approve_sign,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                RepaintBoundary(
                  key: _globalKey2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 24.0, right: 16.0, left: 16.0, bottom: 16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // const SizedBox(
                            //   width: 50,
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                height: 1950,
                                width: 1364,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 3),
                                  // color: Colors.red,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(0)),
                                ),
                                child: Column(
                                  children: [
                                    HEAD3SLOT(
                                      ListFlex: const [5, 4, 1],
                                      widget01: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Container(
                                              height: 120,
                                              width: 230,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "assets/images/logoonly_tpkpng.png",
                                                  ),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // PicShow(
                                          //     width: 120, height: 230, base64: tpklogo),
                                          SizedBox(
                                            height: 120,
                                            width: 400,
                                            child: Column(
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 20,
                                                  ),
                                                  child: Text(
                                                    "THAI PARKERIZING CO.,LTD.",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 40,
                                                  ),
                                                  child: Text(
                                                    "Heat & Surface Treatment Division",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      widget02: Column(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              height: 120,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 3,
                                                      style: BorderStyle.solid),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 20,
                                                          ),
                                                          child: Text(
                                                            "Quality Testing Report (ISONITE ESIE 1)",
                                                            style: TextStyle(
                                                              fontSize: 24,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 30,
                                                                  bottom: 10),
                                                          child: Text(
                                                            "(ใบรายงานผลการตรวจสอบผลิตภัณฑ์สำหรับกระบวนการ ISN)",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              height: 60,
                                              child: Center(
                                                child: Text(
                                                  "FR-HQC-03/028-00-25/10/22",
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      widget03: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 40,
                                                  ),
                                                  child: Text(
                                                    "PAGE",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 30, bottom: 10),
                                                  child: Text(
                                                    "-",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    HEAD4SLOT(
                                      ListFlex: [4, 8, 3, 5],
                                      widget01: const Center(
                                        child: Text(
                                          "Customer",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget02: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            ReportPDFACT02var.CUSTOMER,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      widget03: const Center(
                                        child: Text(
                                          "Process",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.PROCESS,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY4SLOT(
                                      ListFlex: [4, 8, 3, 5],
                                      widget01: const Center(
                                        child: Text(
                                          "Part Name",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget02: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            ReportPDFACT02var.PARTNAME,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      widget03: const Center(
                                        child: Text(
                                          "Part No.",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.PARTNO,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY2SLOT(
                                      ListFlex: [4, 16],
                                      widget01: Center(
                                        child: Text(
                                          "Customer Lot No.",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget02: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            ReportPDFACT02var.CUSLOT,
                                            style: TextStyle(
                                              // fontSize: 16,
                                              fontSize: sizep,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY6SLOT(
                                      ListFlex: [4, 6, 3, 3, 1, 3],
                                      widget01: const Center(
                                        child: Text(
                                          "TPK. Lot No.",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget02: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            ReportPDFACT02var.TPKLOT,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      widget03: const Center(
                                        child: Text(
                                          "Material",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFACT02var.MATERIAL,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      widget05: const Center(
                                        child: Text(
                                          "Qty.",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFACT02var.QTY,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    RoughnessGraph(
                                      data: ReportPDFACT02var.dataout1,
                                    ),
                                    RoughnessGraph(
                                      data: ReportPDFACT02var.dataout2,
                                    ),
                                    RoughnessGraph(
                                      data: ReportPDFACT02var.dataout3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    if ((USERDATA.UserLV) > 1) ...[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Dio().post(
                              GLOserver + "Inspected-sign",
                              data: {
                                "ID": USERDATA.ID,
                                "PO": ReportPDFACT02var.PO,
                              },
                            ).then((v) {
                              var databuff = v.data;
                              context
                                  .read<ReportPDFCommon_Cubit>()
                                  .ReportPDFCommonCubit(ReportPDFACT02var.PO);
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            color: Colors.blue,
                            child: Center(
                              child: Text("Inspected"),
                            ),
                          ),
                        ),
                      ),
                    ],
                    if ((USERDATA.UserLV) > 20) ...[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Dio().post(
                              GLOserver + "Check-sign",
                              data: {
                                "ID": USERDATA.ID,
                                "PO": ReportPDFACT02var.PO,
                              },
                            ).then((v) {
                              var databuff = v.data;
                              context
                                  .read<ReportPDFCommon_Cubit>()
                                  .ReportPDFCommonCubit(ReportPDFACT02var.PO);
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            color: Colors.blue,
                            child: Center(
                              child: Text("Check"),
                            ),
                          ),
                        ),
                      ),
                    ],
                    if ((USERDATA.UserLV) > 30) ...[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Dio().post(
                              GLOserver + "Approve-sign",
                              data: {
                                "ID": USERDATA.ID,
                                "PO": ReportPDFACT02var.PO,
                              },
                            ).then((v) {
                              var databuff = v.data;
                              context
                                  .read<ReportPDFCommon_Cubit>()
                                  .ReportPDFCommonCubit(ReportPDFACT02var.PO);
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            color: Colors.blue,
                            child: Center(
                              child: Text("Approve"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 50,
          ),
        ],
      ),
    );
  }
}
