import 'package:flutter_bloc/flutter_bloc.dart';

class ReportPDFCommon_Cubit extends Cubit<CommonReportOutput> {
  ReportPDFCommon_Cubit()
      : super(CommonReportOutput(databasic: BasicCommonDATA()));

  Future<void> ReportPDFCommonCubit(String input) async {
    CommonReportOutput output =
        CommonReportOutput(databasic: BasicCommonDATA());
    emit(output);
  }

  Future<void> Flush() async {
    CommonReportOutput output =
        CommonReportOutput(databasic: BasicCommonDATA());
    emit(output);
  }
}

class FINALCHECKlistCommonClass {
  FINALCHECKlistCommonClass({
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
  String ITEMname;
  String METHOD;
  String METHODname;
  String SCMARK;
  String FREQ;
  String SPECIFICATION;
  String SPECIFICATIONname;
  String SPECIFICATIONve;
  String RESULT;

  String CONTROLlimmit;
  String DATA01;
  String DATA02;
  String DATA03;
  String DATAAVG;
}

class BasicCommonDATA {
  BasicCommonDATA({
    this.PO = '',
    this.CP = '',
    this.CUSTOMER = '',
    this.PROCESS = '',
    this.PARTNAME = '',
    this.PARTNO = '',
    this.CUSLOT = '',
    this.TPKLOT = '',
    this.MATERIAL = '',
    this.QTY = '',
    this.PICstd = '',
    this.PIC01 = '',
    this.PIC02 = '',
    this.PIC03 = '',
  });

  String PO;
  String CP;
  String CUSTOMER;
  String PROCESS;
  String PARTNAME;
  String PARTNO;
  String CUSLOT;
  String TPKLOT;
  String MATERIAL;
  String QTY;
  String PICstd;
  String PIC01;
  String PIC02;
  String PIC03;
}

class CommonReportOutput {
  CommonReportOutput({
    this.datain = const [],
    required this.databasic,
  });

  List<FINALCHECKlistCommonClass> datain;
  BasicCommonDATA databasic;
}
