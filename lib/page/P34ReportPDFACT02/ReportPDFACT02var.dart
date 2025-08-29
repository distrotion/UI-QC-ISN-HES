import 'package:fl_chart/fl_chart.dart';

import '../../widget/common/imgset.dart';

class ReportPDFACT02var {
  static bool iscontrol = false;
  static bool canf = true;
  static String PO = '';

  static String STATUS = '';

  static String CUSTOMER = '';
  static String PROCESS = '';
  static String PARTNAME = '';
  static String PARTNO = '';
  static String PARTNO_s = '';
  static String CUSLOT = '';
  static String TPKLOT = '';
  static String MATERIAL = '';
  static String QTY = '';
  static String SCMASKTYPE = SCMASK03;
  static String PICstd = '';
  static String PIC01 = '';
  static String PIC02 = '';

  static List<FlSpot> dataout1 = [];
  static List<FlSpot> dataout2 = [];
  static List<FlSpot> dataout3 = [];

  static String PASS = '';

  static String remark = '';

  static List<ReportPDFACT02list> datalist = [
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

class ReportPDFACT02list {
  ReportPDFACT02list({
    this.ITEM = '',
    this.ITEMname = '',
    this.METHOD = '',
    this.METHODname = '',
    this.SCMARK = '',
    this.FREQ = '',
    this.SPECIFICATION = '',
    this.SPECIFICATIONname = '',
    this.SPECIFICATIONve = '',
    this.RESULT = '',
    this.CONTROLlimmit = '',
    this.DATA01 = '',
    this.DATA02 = '',
    this.DATA03 = '',
    this.DATAAVG = '',
  });
  String ITEM;
  String ITEMname = '';
  String METHOD = '';
  String METHODname = '';
  String SCMARK = '';
  String FREQ = '';
  String SPECIFICATION = '';
  String SPECIFICATIONname = '';
  String SPECIFICATIONve = '';
  String RESULT = '';
  String CONTROLlimmit = '';
  String DATA01 = '';
  String DATA02 = '';
  String DATA03 = '';
  String DATAAVG = '';
}

ReportPDFACT02clear() {
  ReportPDFACT02var.PO = '';

  ReportPDFACT02var.CUSTOMER = '';
  ReportPDFACT02var.PROCESS = '';
  ReportPDFACT02var.PARTNAME = '';
  ReportPDFACT02var.PARTNO = '';
  ReportPDFACT02var.CUSLOT = '';
  ReportPDFACT02var.TPKLOT = '';
  ReportPDFACT02var.MATERIAL = '';
  ReportPDFACT02var.QTY = '';

  ReportPDFACT02var.PICstd = '';
  ReportPDFACT02var.PIC01 = '';
  ReportPDFACT02var.PIC02 = '';

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
