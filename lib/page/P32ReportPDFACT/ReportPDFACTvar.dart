class ReportPDFACTvar {
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

  static String PASS = '';

  static List<ReportPDFACTlist> datalist = [
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
  ];
}

class ReportPDFACTlist {
  ReportPDFACTlist({
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

ReportPDFACTclear() {
  ReportPDFACTvar.PO = '';

  ReportPDFACTvar.CUSTOMER = '';
  ReportPDFACTvar.PROCESS = '';
  ReportPDFACTvar.PARTNAME = '';
  ReportPDFACTvar.PARTNO = '';
  ReportPDFACTvar.CUSLOT = '';
  ReportPDFACTvar.TPKLOT = '';
  ReportPDFACTvar.MATERIAL = '';
  ReportPDFACTvar.QTY = '';

  ReportPDFACTvar.PICstd = '';
  ReportPDFACTvar.PIC01 = '';
  ReportPDFACTvar.PIC02 = '';

  ReportPDFACTvar.datalist = [
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
    ReportPDFACTlist(),
  ];
}
