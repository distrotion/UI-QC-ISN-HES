import '../../widget/common/imgset.dart';

class ReportPDFCommon2var {
  static bool iscontrol = false;
  static bool canf = true;
  static String PO = '';

  static String STATUS = '';

  static String CUSTOMER = '';
  static String PROCESS = '';
  static String PARTNAME = '';
  static String PARTNO = '';
  static String CUSLOT = '';
  static String TPKLOT = '';
  static String MATERIAL = '';
  static String QTY = '';

  static String PICstd = '';
  static String PIC01 = '';
  static String PIC02 = '';
  static String TYPE = '-';
  static String SCMASKTYPE = SCMASK03;
  static List<rawlist> rawlistHardness = [];
  static List<rawlist> rawlistCompound = [];
  static List<rawlist> rawlistDia = [];
  static List<rawlist> rawlistRoughness = [];
  static List<rawlist> rawlistCORE = [];

  static String remark = '';

  static String PASS = '';

  static String commp = 'Compound layer';

  static String INC01 = '';
  static String INC02 = '';

  static List<ReportPDFCommon2list> datalist = [
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
  ];
}

class ReportPDFCommon2list {
  ReportPDFCommon2list({
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

class rawlist {
  rawlist({
    this.DATANO = '',
    this.DATAPCS = '',
    this.DATA = '',
  });
  String DATANO;
  String DATAPCS = '';
  String DATA = '';
}

ReportPDFACTclear() {
  ReportPDFCommon2var.PO = '';

  ReportPDFCommon2var.CUSTOMER = '';
  ReportPDFCommon2var.PROCESS = '';
  ReportPDFCommon2var.PARTNAME = '';
  ReportPDFCommon2var.PARTNO = '';
  ReportPDFCommon2var.CUSLOT = '';
  ReportPDFCommon2var.TPKLOT = '';
  ReportPDFCommon2var.MATERIAL = '';
  ReportPDFCommon2var.QTY = '';

  ReportPDFCommon2var.PICstd = '';
  ReportPDFCommon2var.PIC01 = '';
  ReportPDFCommon2var.PIC02 = '';

  ReportPDFCommon2var.INC01 = '';
  ReportPDFCommon2var.INC02 = '';

  ReportPDFCommon2var.datalist = [
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
    ReportPDFCommon2list(),
  ];
}
