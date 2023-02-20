import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qc_ui_isn_hes/widget/common/Loading.dart';

import '../../data/ACTtestdata.dart';
import '../../page/P32ReportPDFACT/ReportPDFACT.dart';
import '../../widget/common/Safty.dart';
import '../cubit/NotificationEvent.dart';

String server = 'http://172.23.10.40:16700/';

class ReportPDFACTcubit_Cubit extends Cubit<ACTReportOutput> {
  /// {@macro brightness_cubit}
  ReportPDFACTcubit_Cubit() : super(ACTReportOutput(databasic: BasicDATA()));

  /// Toggles the current brightness between light and dark.
  Future<void> ReportPDF_ACT(String PO) async {
    // FreeLoadingN(ReportPDFACTcontext);

    ACTReportOutput output = ACTReportOutput(databasic: BasicDATA());
    BasicDATA BasicDATAs = BasicDATA();

    final response = await Dio().post(
      server + "INS_Report_PDF",
      data: {
        "PO": PO,
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;

      // var databuff = ACTtestdata01;
      // print(databuff);

      if (databuff['DATA'] != null && databuff['DATA'].length != 0) {
        //-----------------------
        var FINALdata = databuff['DATA'][0]['FINAL'] ?? {};
        var FINALCHECKlist = databuff['DATA'][0]['CHECKlist'] ?? [];
        var METHODlist = databuff['METHOD'] ?? [];
        var PATTERNlist = databuff['PATTERN'][0] ?? {};
        var SPECIFICATIONlist = databuff['SPECIFICATION'] ?? [];

        List<String> ITEMslist = [];
        List<String> masterACT = [
          "ITEMs-5f19aa43fe12be0020dbd3bf",
          "ITEMs-60405bcf93e8d91950acb5c3",
          "ITEMs-60403f1693e8d91950acb5c0",
          "ITEMs-60407f8f93e8d91950acb5d0",
          "ITEMs-6040817293e8d91950acb5d5",
          "ITEMs-5f19a97cfe12be0020dbd3bc",
          "ITEMs-6040810993e8d91950acb5d4",
          "ITEMs-5f19a922fe12be0020dbd3ba",
          "ITEMs-60407f6193e8d91950acb5cf",
        ];

        bool cango = false;

        for (var s = 0; s < FINALCHECKlist.length; s++) {
          ITEMslist.add(FINALCHECKlist[s]['key']);
        }

        for (var d = 0; d < masterACT.length; d++) {
          if (ITEMslist.contains(masterACT[d])) {
            cango = true;
          } else {
            cango = false;
            break;
          }
        }

        if (cango) {
          //-----------------------
          List<String> MACHINElist = [];
          List<FINALCHECKlistClass> ITEMlist = [];

          //-----------------------

          FINALdata.forEach((key, value) {
            MACHINElist.add(key);
          });

          for (var i = 0; i < FINALCHECKlist.length; i++) {
            ITEMlist.add(FINALCHECKlistClass(
              ITEM: FINALCHECKlist[i]['key'] != null
                  ? FINALCHECKlist[i]['key'].toString()
                  : '',
              ITEMname: FINALCHECKlist[i]['value'] != null
                  ? FINALCHECKlist[i]['value'].toString()
                  : '',
              METHOD: FINALCHECKlist[i]['METHOD'] != null
                  ? FINALCHECKlist[i]['METHOD'].toString()
                  : '',
            ));
          }

          var BasicDATAr = databuff['DATA'][0];

          BasicDATAs = BasicDATA(
            PO: BasicDATAr['PO'] != null ? BasicDATAr['PO'].toString() : '',
            CP: BasicDATAr['CP'] != null ? BasicDATAr['CP'].toString() : '',
            CUSTOMER: BasicDATAr['CUSTNAME'] != null
                ? BasicDATAr['CUSTNAME'].toString()
                : '',
            PROCESS: BasicDATAr['PROCESS'] != null
                ? BasicDATAr['PROCESS'].toString()
                : '',
            PARTNAME: BasicDATAr['PARTNAME'] != null
                ? BasicDATAr['PARTNAME'].toString()
                : '',
            PARTNO:
                BasicDATAr['PART'] != null ? BasicDATAr['PART'].toString() : '',
            CUSLOT: BasicDATAr['CUSLOT'] != null
                ? BasicDATAr['CUSLOT'].toString()
                : '',
            TPKLOT: BasicDATAr['FG_CHARG'] != null
                ? BasicDATAr['FG_CHARG'].toString()
                : '',
            MATERIAL: BasicDATAr['MATERIAL'] != null
                ? BasicDATAr['MATERIAL'].toString()
                : '',
            QTY: BasicDATAr['QTY'] != null ? BasicDATAr['QTY'].toString() : '',
            PICstd: BasicDATAr['PIC'] != null
                ? BasicDATAr['PIC'].toString().split(',')[1]
                : '',
          );

          for (var le = 0; le < ITEMlist.length; le++) {
            for (var k = 0; k < MACHINElist.length; k++) {
              if (FINALdata[MACHINElist[k]] != null) {
                if (FINALdata[MACHINElist[k]][ITEMlist[le].ITEM] != null) {
                  // print(FINALdata[MACHINElist[i]][ITEMlist[le].ITEM]);
                  // print(ITEMlist[le].ITEM);
                  //

                  //METHOD;
                  //METHODname;
                  for (var i = 0; i < METHODlist.length; i++) {
                    if (METHODlist[i]['masterID'].toString() ==
                        ITEMlist[le].METHOD) {
                      // print(METHODlist[i]['METHOD']);
                      ITEMlist[le].METHOD = ITEMlist[le].METHOD;
                      ITEMlist[le].METHODname =
                          METHODlist[i]['METHOD'].toString();
                      break;
                    }
                  }

                  //SCMARK;
                  //FREQ;
                  // String SPECIFICATIONve;
                  for (var i = 0; i < PATTERNlist['FINAL'].length; i++) {
                    if (PATTERNlist['FINAL'][i]['ITEMs'] == ITEMlist[le].ITEM) {
                      // print(PATTERNlist['FINAL'][i]['FREQUENCY']);
                      ITEMlist[le].SCMARK =
                          PATTERNlist['FINAL'][i]['SCMARK'].toString();
                      if (PATTERNlist['FINAL'][i]['FREQUENCY'].toString() ==
                          '100% Check') {
                        ITEMlist[le].FREQ =
                            PATTERNlist['FINAL'][i]['FREQUENCY'].toString();
                      } else {
                        ITEMlist[le].FREQ =
                            PATTERNlist['FINAL'][i]['PCS'].toString() +
                                ' ' +
                                PATTERNlist['FINAL'][i]['FREQUENCY'].toString();
                      }

                      ITEMlist[le].SPECIFICATIONve =
                          PATTERNlist['FINAL'][i]['SPECIFICATIONve'].toString();

                      break;
                    }
                  }
                  //  SPECIFICATION;
                  //  RESULT;
                  for (var i = 0; i < SPECIFICATIONlist.length; i++) {
                    //
                    if (ITEMlist[le]
                        .SPECIFICATIONve
                        .contains("SPECIFICATION-")) {
                      // print(ITEMlist[le].SPECIFICATIONve);

                      if (SPECIFICATIONlist[i]['masterID'].toString() ==
                          ITEMlist[le].SPECIFICATIONve) {
                        // print(SPECIFICATIONlist[i]['SPECIFICATION']);
                        ITEMlist[le].SPECIFICATIONname =
                            SPECIFICATIONlist[i]['SPECIFICATION'].toString();
                        ITEMlist[le].RESULT =
                            SPECIFICATIONlist[i]['SPECIFICATION'].toString();
                        break;
                      }
                    }
                  }

                  for (var i = 0; i < PATTERNlist['FINAL'].length; i++) {
                    if (PATTERNlist['FINAL'][i]['ITEMs'] == ITEMlist[le].ITEM) {
                      if (ITEMlist[le].ITEM ==
                          'ITEMs-5f19a922fe12be0020dbd3ba') {
                        //Compound Layer
                        // print(FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]);
                        if (FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]['PSC1']
                                .length ==
                            1) {
                          ITEMlist[le].SPECIFICATION = '6-17 µm.';
                          ITEMlist[le].CONTROLlimmit = '8.0-15.5 µm.';
                          ITEMlist[le].DATA01 = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC1data']))
                              .toStringAsFixed(2);
                          ITEMlist[le].DATA02 = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC2data']))
                              .toStringAsFixed(2);
                          ITEMlist[le].DATA03 = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC3data']))
                              .toStringAsFixed(2);

                          double avg = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC1data'])) +
                              double.parse(ConverstStr(FINALdata[MACHINElist[k]]
                                  [ITEMlist[le].ITEM]['PSC1'][0]['PIC2data'])) +
                              double.parse(
                                  ConverstStr(FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]['PSC1'][0]['PIC3data']));
                          ITEMlist[le].DATAAVG = (avg / 3).toStringAsFixed(2);

                          BasicDATAs.PIC01 = FINALdata[MACHINElist[k]]
                                  [ITEMlist[le].ITEM]['PSC1'][0]['PIC1']
                              .toString();
                          BasicDATAs.PIC02 = FINALdata[MACHINElist[k]]
                                  [ITEMlist[le].ITEM]['PSC1'][0]['PIC2']
                              .toString();
                          // print(ITEMlist[le].DATA01);
                          // print(ITEMlist[le].DATA02);
                          // print(ITEMlist[le].DATA03);
                          // print(ITEMlist[le].DATAAVG);
                        }
                      } else if (ITEMlist[le].ITEM ==
                          'ITEMs-60407f6193e8d91950acb5cf') {
                        //Porous Thickness
                        // print(FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]);
                        if (FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]['PSC1']
                                .length ==
                            1) {
                          ITEMlist[le].SPECIFICATION =
                              '<= 7 µm. & <60% of\ncompound Layer';
                          ITEMlist[le].CONTROLlimmit = '<= 5µm.';
                          ITEMlist[le].DATA01 = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC1data']))
                              .toStringAsFixed(2);
                          ITEMlist[le].DATA02 = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC2data']))
                              .toStringAsFixed(2);
                          ITEMlist[le].DATA03 = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC3data']))
                              .toStringAsFixed(2);

                          double avg = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC1data'])) +
                              double.parse(ConverstStr(FINALdata[MACHINElist[k]]
                                  [ITEMlist[le].ITEM]['PSC1'][0]['PIC2data'])) +
                              double.parse(
                                  ConverstStr(FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]['PSC1'][0]['PIC3data']));
                          ITEMlist[le].DATAAVG = (avg / 3).toStringAsFixed(2);

                          // print(ITEMlist[le].DATA01);
                          // print(ITEMlist[le].DATA02);
                          // print(ITEMlist[le].DATA03);
                          // print(ITEMlist[le].DATAAVG);
                        }
                      } else if (ITEMlist[le].ITEM ==
                          'ITEMs-5f19a97cfe12be0020dbd3bc') {
                        // print(FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]);
                        //Surface Hardness
                        if (FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]['PSC1']
                                .length ==
                            4) {
                          ITEMlist[le].SPECIFICATION = '500-680 Hmv';
                          ITEMlist[le].CONTROLlimmit = '550-680 Hmv';
                          ITEMlist[le].DATA01 = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PO3']))
                              .toStringAsFixed(2);
                          ITEMlist[le].DATA02 = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][1]['PO3']))
                              .toStringAsFixed(2);
                          ITEMlist[le].DATA03 = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][2]['PO3']))
                              .toStringAsFixed(2);
                          // ITEMlist[le].DATAAVG = double.parse(ConverstStr(
                          //         FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]['PSC1']
                          //             [4]['PO3']))
                          //     .toStringAsFixed(2);

                          double avg = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PO3'])) +
                              double.parse(ConverstStr(FINALdata[MACHINElist[k]]
                                  [ITEMlist[le].ITEM]['PSC1'][1]['PO3'])) +
                              double.parse(
                                  ConverstStr(FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]['PSC1'][2]['PO3']));

                          ITEMlist[le].DATAAVG = (avg / 3).toStringAsFixed(2);

                          // print(ITEMlist[le].DATA01);
                          // print(ITEMlist[le].DATA02);
                          // print(ITEMlist[le].DATA03);
                          // print(ITEMlist[le].DATAAVG);
                        }
                      } else if (ITEMlist[le].ITEM ==
                          'ITEMs-6040810993e8d91950acb5d4') {
                        // print(FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]);
                        //Surface Roughness
                        if (FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]['PSC1']
                                .length ==
                            4) {
                          ITEMlist[le].SPECIFICATION = '26-60 HSC';
                          ITEMlist[le].CONTROLlimmit = '30-58';
                          ITEMlist[le].DATA01 = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PO3']))
                              .toStringAsFixed(2);
                          ITEMlist[le].DATA02 = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][1]['PO3']))
                              .toStringAsFixed(2);
                          ITEMlist[le].DATA03 = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][2]['PO3']))
                              .toStringAsFixed(2);
                          // ITEMlist[le].DATAAVG = double.parse(ConverstStr(
                          //         FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]['PSC1']
                          //             [4]['PO3']))
                          //     .toStringAsFixed(2);

                          double avg = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PO3'])) +
                              double.parse(ConverstStr(FINALdata[MACHINElist[k]]
                                  [ITEMlist[le].ITEM]['PSC1'][1]['PO3'])) +
                              double.parse(
                                  ConverstStr(FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]['PSC1'][2]['PO3']));

                          ITEMlist[le].DATAAVG = (avg / 3).toStringAsFixed(2);

                          // print(ITEMlist[le].DATA01);
                          // print(ITEMlist[le].DATA02);
                          // print(ITEMlist[le].DATA03);
                          // print(ITEMlist[le].DATAAVG);
                        }
                      } else if (ITEMlist[le].ITEM ==
                          'ITEMs-6040817293e8d91950acb5d5') {
                        // print(FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]);
                        //Remain of CN on part
                        if (FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]['PSC1']
                                .length >
                            1) {
                          ITEMlist[le].SPECIFICATION = '<= 0.07 ppm';

                          double datain = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                  ['PSC1'][0]['PO3']));
                          if (datain <= 0.03) {
                            ITEMlist[le].DATA01 = '< 0.03';
                          } else {
                            ITEMlist[le].DATA01 = double.parse(ConverstStr(
                                    FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                        ['PSC1'][0]['PO3']))
                                .toStringAsFixed(2);
                          }

                          // print(ITEMlist[le].DATA01);
                        }
                      }

                      break;
                    }
                  }

                  // String CONTROLlimmit;
                  // String DATA01;
                  // String DATA02;
                  // String DATA03;
                  // String DATAAVG;
                }
              }
            }
          }

          output.databasic = BasicDATAs;
          output.datain = ITEMlist;

          // print(ITEMlist);
        } else {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "Error", "ORDER IS NOT ACT", enumNotificationlist.Error);
        }
      } else {
        BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
            "Error", "ORDER IS WRONG", enumNotificationlist.Error);
      }
    } else {
      BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
          "Error", "Connection have some problem", enumNotificationlist.Error);
    }

    // Navigator.pop(ReportPDFACTcontext);
    emit(output);
  }

  Future<void> Flush() async {
    ACTReportOutput output = ACTReportOutput(databasic: BasicDATA());
    emit(output);
  }
}

class FINALCHECKlistClass {
  FINALCHECKlistClass({
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

class BasicDATA {
  BasicDATA({
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

class ACTReportOutput {
  ACTReportOutput({
    this.datain = const [],
    required this.databasic,
  });

  List<FINALCHECKlistClass> datain;
  BasicDATA databasic;
}
