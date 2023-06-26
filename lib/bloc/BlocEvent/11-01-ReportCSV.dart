import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';
import '../../page/P11INDreport/INDreportMAIN.dart';
import '../../page/P11INDreport/INDreportVAR.dart';

import '../../widget/common/Loading.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class ReportCSV_Event {}

class ReportACT_GET extends ReportCSV_Event {}

class ReportNISHINBO_GET extends ReportCSV_Event {}

class ReportACT_flush extends ReportCSV_Event {}

class ReportCSV_Bloc extends Bloc<ReportCSV_Event, dataoutCSV> {
  ReportCSV_Bloc() : super(dataoutCSV(data: [])) {
    on<ReportACT_GET>((event, emit) {
      return _ReportACT_GET(dataoutCSV(data: []), emit);
    });
    on<ReportNISHINBO_GET>((event, emit) {
      return _ReportNISHINBO_GET(dataoutCSV(data: []), emit);
    });

    on<ReportACT_flush>((event, emit) {
      return _ReportACT_flush(dataoutCSV(data: []), emit);
    });
  }
  Future<void> _ReportACT_GET(
      dataoutCSV toAdd, Emitter<dataoutCSV> emit) async {
    FreeLoading(CsvPickerContext);

    final response = await Dio().post(
      server + 'ReportListACT',
      data: {
        "month": INDreportVAR.MONTH,
        "year": INDreportVAR.YEAR,
      },
    );

    List<reportCSV> dataACT = [];
    if (response.statusCode == 200) {
      var databuff = response.data;

      var dataIN = databuff;
      for (int i = 0; i < dataIN.length; i++) {
        if (dataIN[i]['DATA'] != null) {
          var datain = dataIN[i]['DATA'];

          for (int j = 0; j < datain.length; j++) {
            //Water wet ability

            if (datain[j]['Water wet ability'] != null) {
              List dataAFR = [];
              List dataAFB = [];
              List dataAFC = [];
              List dataWWA = [];
              List dataRCP = [];
              //------------
              List dataSRHSC = [];
              List dataSH = [];
              List dataCP = [];
              List dataPT = [];

              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Appearance for Rust'] != null) {
                  dataAFR.add(datain[k]['Appearance for Rust']);
                }
              }
              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Appearance for Black stain'] != null) {
                  dataAFB.add(datain[k]['Appearance for Black stain']);
                }
              }
              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Appearance for Contaminant'] != null) {
                  dataAFC.add(datain[k]['Appearance for Contaminant']);
                }
              }
              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Water wet ability'] != null) {
                  dataWWA.add(datain[k]['Water wet ability']);
                }
              }
              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Remain of CN on part'] != null) {
                  dataRCP.add(datain[k]['Remain of CN on part']);
                }
              }

              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Surface Roughness  (HSC)'] != null) {
                  dataSRHSC.add(datain[k]['Surface Roughness  (HSC)']);
                }
              }

              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Surface Hardness'] != null) {
                  dataSH.add(datain[k]['Surface Hardness']);
                }
              }

              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Compound Layer'] != null) {
                  dataCP.add(datain[k]['Compound Layer']);
                }
              }

              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Porous Thickness'] != null) {
                  dataPT.add(datain[k]['Porous Thickness']);
                }
              }

              // print(dataSRHSC.length);
              // print(dataSH.length);
              print(dataIN[i]);
              if (dataCP.length > 0 && dataPT.length > 0) {
                dataACT.add(reportCSV(
                  PO: dataIN[i]['PO'] != null ? dataIN[i]['PO'].toString() : '',
                  CP: dataIN[i]['CP'] != null ? dataIN[i]['CP'].toString() : '',
                  F01: dataAFR.length > 0 ? dataAFR[0].toString() : '',
                  F02: dataAFB.length > 0 ? dataAFB[0].toString() : '',
                  F03: dataAFC.length > 0 ? dataAFC[0].toString() : '',
                  F04: dataWWA.length > 0 ? dataWWA[0].toString() : '',
                  F05: dataRCP.length > 0 ? dataRCP[0].toString() : '',
                  //
                  F06: dataSRHSC.length > 0 ? dataSRHSC[0].toString() : '',
                  F07: dataSRHSC.length >= 1 ? dataSRHSC[1].toString() : '',
                  F08: dataSRHSC.length >= 2 ? dataSRHSC[2].toString() : '',
                  F09: dataSH.length > 0 ? dataSH[0].toString() : '',
                  F10: dataSH.length >= 1 ? dataSH[1].toString() : '',
                  F11: dataSH.length >= 2 ? dataSH[2].toString() : '',

                  F12: dataCP.length > 0 ? dataCP[0][0].toString() : '',
                  F13: dataCP.length > 0 ? dataCP[0][1].toString() : '',
                  F14: dataCP.length > 0 ? dataCP[0][2].toString() : '',

                  F15: dataPT.length > 0 ? dataPT[0][0].toString() : '',
                  F16: dataPT.length > 0 ? dataPT[0][1].toString() : '',
                  F17: dataPT.length > 0 ? dataPT[0][2].toString() : '',

                  F21: dataIN[i]['dateG'] != null
                      ? dataIN[i]['dateG'].toString()
                      : '',
                  F22: dataIN[i]['CUSTNAME'] != null
                      ? dataIN[i]['CUSTNAME'].toString()
                      : '',
                  F23: dataIN[i]['CUSLOTNO'] != null
                      ? dataIN[i]['CUSLOTNO'].toString()
                      : '',
                  F24: dataIN[i]['PART'] != null
                      ? dataIN[i]['PART'].toString()
                      : '',
                  F25: dataIN[i]['PARTNAME'] != null
                      ? dataIN[i]['PARTNAME'].toString()
                      : '',
                  F26: dataIN[i]['MATERIAL'] != null
                      ? dataIN[i]['MATERIAL'].toString()
                      : '',
                  F27: dataIN[i]['QUANTITY'] != null
                      ? dataIN[i]['QUANTITY'].toString()
                      : '',
                  F28: dataIN[i]['FG_CHARG'] != null
                      ? dataIN[i]['FG_CHARG'].toString()
                      : '',

                  //FG_CHARG
                ));
              } else {
                print("nan neee !!");
              }

              break;
            }
          }
        }
      }
      print(dataIN.length);

      // dataACT.add(reportCSV(PO: dataIN[i]['PO'].toString()));
    }

    print('>>>${dataACT.length}');
    Navigator.pop(CsvPickerContext);
    dataoutCSV csv = dataoutCSV(name: "ACT", data: dataACT);

    emit(csv);
  }

  Future<void> _ReportNISHINBO_GET(
      dataoutCSV toAdd, Emitter<dataoutCSV> emit) async {
    FreeLoading(CsvPickerContext);

    final response = await Dio().post(
      server + 'ReportListACT',
      data: {
        "month": INDreportVAR.MONTH,
        "year": INDreportVAR.YEAR,
      },
    );

    List<reportCSV> dataACT = [];
    if (response.statusCode == 200) {
      var databuff = response.data;

      var dataIN = databuff;
      for (int i = 0; i < dataIN.length; i++) {
        if (dataIN[i]['DATA'] != null) {
          var datain = dataIN[i]['DATA'];
          // print(datain.length);
          for (int j = 0; j < datain.length; j++) {
            //Water wet ability
            if (dataIN[i]['PART'] == 'PTT-D481N') {
              List dataAFR = [];
              List dataAFB = [];
              List dataAFC = [];
              List dataWWA = [];
              List dataRCP = [];
              //------------
              List dataSRHSC = [];
              List dataSH = [];
              List dataCP = [];
              List dataPT = [];

              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Appearance for Rust'] != null) {
                  dataAFR.add(datain[k]['Appearance for Rust']);
                }
              }
              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Appearance for Contaminant'] != null) {
                  dataAFB.add(datain[k]['Appearance for Contaminant']);
                }
              }

//----------
              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Surface Hardness'] != null) {
                  dataSRHSC.add(datain[k]['Surface Hardness']);
                }
              }

              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Surface Roughness  (HSC)'] != null) {
                  dataSH.add(datain[k]['Surface Roughness  (HSC)']);
                }
              }

              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Compound Layer'] != null) {
                  dataCP.add(datain[k]['Compound Layer']);
                }
              }

              for (var k = 0; k < datain.length; k++) {
                if (datain[k]['Porous Thickness'] != null) {
                  dataPT.add(datain[k]['Porous Thickness']);
                }
              }

              // print(dataPT);

              // print(dataSRHSC.length);
              // print(dataSH.length);

              dataACT.add(reportCSV(
                PO: dataIN[i]['PO'] != null ? dataIN[i]['PO'].toString() : '',
                CP: dataIN[i]['CP'] != null ? dataIN[i]['CP'].toString() : '',
                F01: dataAFR.length > 0 ? dataAFR[0].toString() : '',
                F02: dataAFB.length > 0 ? dataAFB[0].toString() : '',

                //
                F06: dataSRHSC.length > 0 ? dataSRHSC[0].toString() : '',
                F07: dataSRHSC.length >= 1 ? dataSRHSC[1].toString() : '',
                F08: dataSRHSC.length >= 2 ? dataSRHSC[2].toString() : '',
                F09: dataSH.length > 0 ? dataSH[0].toString() : '',
                F10: dataSH.length >= 1 ? dataSH[1].toString() : '',
                F11: dataSH.length >= 2 ? dataSH[2].toString() : '',

                F12: dataCP.length > 0 ? dataCP[0][0].toString() : '',
                F13: dataCP.length > 0 ? dataCP[0][1].toString() : '',
                F14: dataCP.length > 0 ? dataCP[0][2].toString() : '',

                F15: dataPT.length > 0 ? dataPT[0][0].toString() : '',
                F16: dataPT.length > 0 ? dataPT[0][1].toString() : '',
                F17: dataPT.length > 0 ? dataPT[0][2].toString() : '',

                F21: dataIN[i]['dateG'] != null
                    ? dataIN[i]['dateG'].toString()
                    : '',
                F22: dataIN[i]['CUSTNAME'] != null
                    ? dataIN[i]['CUSTNAME'].toString()
                    : '',
                F23: dataIN[i]['CUSLOTNO'] != null
                    ? dataIN[i]['CUSLOTNO'].toString()
                    : '',
                F24: dataIN[i]['PART'] != null
                    ? dataIN[i]['PART'].toString()
                    : '',
                F25: dataIN[i]['PARTNAME'] != null
                    ? dataIN[i]['PARTNAME'].toString()
                    : '',
                F26: dataIN[i]['MATERIAL'] != null
                    ? dataIN[i]['MATERIAL'].toString()
                    : '',
                F27: dataIN[i]['QUANTITY'] != null
                    ? dataIN[i]['QUANTITY'].toString()
                    : '',
                F28: dataIN[i]['FG_CHARG'] != null
                    ? dataIN[i]['FG_CHARG'].toString()
                    : '',

                //FG_CHARG
              ));

              break;
            }
          }
        }
      }

      // dataACT.add(reportCSV(PO: dataIN[i]['PO'].toString()));
    }
    Navigator.pop(CsvPickerContext);
    dataoutCSV csv = dataoutCSV(name: "NISHINBO", data: dataACT);

    emit(csv);
  }

  Future<void> _ReportACT_flush(
      dataoutCSV toAdd, Emitter<dataoutCSV> emit) async {
    emit(dataoutCSV(data: []));
  }
}

class reportCSV {
  reportCSV({
    this.PO = '',
    this.CP = '',
    this.F01 = '',
    this.F02 = '',
    this.F03 = '',
    this.F04 = '',
    this.F05 = '',
    this.F06 = '',
    this.F07 = '',
    this.F08 = '',
    this.F09 = '',
    this.F10 = '',
    this.F11 = '',
    this.F12 = '',
    this.F13 = '',
    this.F14 = '',
    this.F15 = '',
    this.F16 = '',
    this.F17 = '',
    this.F18 = '',
    this.F19 = '',
    this.F20 = '',
    this.F21 = '',
    this.F22 = '',
    this.F23 = '',
    this.F24 = '',
    this.F25 = '',
    this.F26 = '',
    this.F27 = '',
    this.F28 = '',
    this.F29 = '',
    this.F30 = '',
  });

  String PO;
  String CP;
  String F01;
  String F02;
  String F03;
  String F04;
  String F05;
  String F06;
  String F07;
  String F08;
  String F09;
  String F10;
  String F11;
  String F12;
  String F13;
  String F14;
  String F15;
  String F16;
  String F17;
  String F18;
  String F19;
  String F20;
  String F21;
  String F22;
  String F23;
  String F24;
  String F25;
  String F26;
  String F27;
  String F28;
  String F29;
  String F30;
}

class dataoutCSV {
  dataoutCSV({
    this.name = '',
    required this.data,
  });
  String name;
  List<reportCSV> data;
}
