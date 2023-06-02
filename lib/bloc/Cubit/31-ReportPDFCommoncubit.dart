import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/ACTtestdata.dart';
import '../../data/CommonTestData.dart';
import '../../page/P31ReportPDFcommon/ReportPDFCommonvar.dart';
import '../../widget/common/Safty.dart';

String server = 'http://172.23.10.40:16700/';

class ReportPDFCommon_Cubit extends Cubit<CommonReportOutput> {
  ReportPDFCommon_Cubit()
      : super(CommonReportOutput(databasic: BasicCommonDATA()));

  Future<void> ReportPDFCommonCubit(String PO) async {
    ReportPDFCommonvar.STATUS = 'WATTING or NO-DATA';
    ReportPDFCommonvar.CUSTOMER = '';
    ReportPDFCommonvar.PROCESS = '';
    ReportPDFCommonvar.PARTNAME = '';
    ReportPDFCommonvar.PARTNO = '';
    ReportPDFCommonvar.CUSLOT = '';
    ReportPDFCommonvar.TPKLOT = '';
    ReportPDFCommonvar.MATERIAL = '';
    ReportPDFCommonvar.QTY = '';

    ReportPDFCommonvar.PICstd = '';
    ReportPDFCommonvar.PIC01 = '';
    ReportPDFCommonvar.PIC02 = '';

    ReportPDFCommonvar.INC01 = '';
    ReportPDFCommonvar.INC02 = '';

    ReportPDFCommonvar.rawlistHardness = [];
    ReportPDFCommonvar.rawlistCompound = [];
    ReportPDFCommonvar.rawlistRoughness = [];

    ReportPDFCommonvar.datalist = [
      ReportPDFCommonlist(),
      ReportPDFCommonlist(),
      ReportPDFCommonlist(),
      ReportPDFCommonlist(),
      ReportPDFCommonlist(),
      ReportPDFCommonlist(),
      ReportPDFCommonlist(),
      ReportPDFCommonlist(),
      ReportPDFCommonlist(),
      ReportPDFCommonlist(),
      ReportPDFCommonlist(),
      ReportPDFCommonlist(),
      ReportPDFCommonlist(),
    ];

    CommonReportOutput output =
        CommonReportOutput(databasic: BasicCommonDATA());
    BasicCommonDATA BasicCommonDATAs = BasicCommonDATA();
    List<String> passlist = [];

    // BaseOptions options = BaseOptions(
    //   baseUrl: server + "INS_Report_PDF",
    //   connectTimeout: 5000,
    //   receiveTimeout: 5000,
    // );

    final response = await Dio().post(
      server + "INS_Report_PDF",
      data: {
        "PO": PO,
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      // var databuff = commontest02;
      // var databuff = commontest03;
      // var databuff = datatest06;

      //commontest04
      // var databuff = ACTtestdata01;

      if (databuff['DATA'] != null && (databuff['DATA']?.length ?? 0) != 0) {
        var FINALdata = databuff['DATA']?[0]['FINAL'] ?? {};
        var PATTERNlist = databuff['PATTERN']?[0] ?? {};

        var FINALCHECKlist = databuff['DATA']?[0]['CHECKlist'] ?? [];
        var TYPElist = databuff['TYPE'] ?? [];
        var ITEMSlist = databuff['ITEMS'] ?? [];
        var METHODlist = databuff['METHOD'] ?? [];
        var RESULTFORMATlist = databuff['RESULTFORMAT'] ?? [];
        var GRAPHTYPElist = databuff['GRAPHTYPE'] ?? [];
        var INSTRUMENTSlist = databuff['INSTRUMENTS'] ?? [];
        var CALCULATElist = databuff['INSTRUMENTS'] ?? [];
        var SPECIFICATIONlist = databuff['SPECIFICATION'] ?? [];
        var UNITlist = databuff['UNIT'] ?? [];

        int NO_NUMBER = 0;

        var BasicDATAr = databuff['DATA']?[0];
        List<FINALCHECKlistCommonClass> ITEMlist = [];

        List<String> MACHINElist = [];
        FINALdata.forEach((key, value) {
          MACHINElist.add(key);
        });

        // print(PATTERNlist);

        String inc01 = "";
        String inc02 = "";

        if (databuff["PATTERN"][0]['INCOMMING'] != null) {
          for (var i = 0; i < databuff["PATTERN"][0]['INCOMMING'].length; i++) {
            if (i == 0) {
              inc01 = databuff["PATTERN"][0]['INCOMMING'][0]["ITEMs"];
            }
            if (i == 1) {
              inc02 = databuff["PATTERN"][0]['INCOMMING'][1]["ITEMs"];
            }
          }
        }

        BasicCommonDATAs = BasicCommonDATA(
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
          UNITSAP: BasicDATAr['UNITSAP'] != null
              ? BasicDATAr['UNITSAP'].toString()
              : 'PCS',

          INC01: inc01,
          INC02: inc02,

          // PICstd: BasicDATAr['PIC'] != null
          //     ? BasicDATAr['PIC'].toString().split(',')[1]
          //     : '',
        );

        if (BasicDATAr['ReferFrom'].toString() != PO) {
          if (BasicDATAr['ReferFrom'] != null) {
            final response02 = await Dio().post(
              server + "INS_Report_PDF",
              data: {
                "PO": BasicDATAr['ReferFrom'].toString(),
              },
            );

            if (response02.statusCode == 200) {
              var databuffref = response02.data;
              // print(databuffref);
              BasicCommonDATAs.PARTNAMEref =
                  databuffref['DATA']?[0]['PARTNAME'].toString() ?? '';
              BasicCommonDATAs.PARTref =
                  databuffref['DATA']?[0]['PART'].toString() ?? '';
              // print(databuffref['DATA']?[0]['PART']);
              // print(databuffref['DATA']?[0]['PARTNAME']);
            }
          }
        }

        if (PATTERNlist['Pimg'] != null) {
          if (PATTERNlist['Pimg']['P1'] != null) {
            List<String> datalist =
                PATTERNlist['Pimg']['P1'].toString().split(',');
            if (datalist.length > 1) {
              BasicCommonDATAs.PICstd = datalist[1];
            } else {
              BasicCommonDATAs.PICstd = '';
            }
          }
        }

        // print(PATTERNlist['FINAL'].length);

        for (var fi = 0; fi < PATTERNlist['FINAL'].length; fi++) {
          //
          // print(PATTERNlist['FINAL'][fi]['ITEMs']);
          if (PATTERNlist['FINAL'][fi]['RESULTFORMAT'] == 'Text') {
            for (var mi = 0; mi < MACHINElist.length; mi++) {
              if (FINALdata[MACHINElist[mi]] != null) {
                if (FINALdata[MACHINElist[mi]]
                        [PATTERNlist['FINAL'][fi]['ITEMs']] !=
                    null) {
                  print(PATTERNlist['FINAL'][fi]);
                  // print(FINALdata[MACHINElist[mi]]
                  //     [PATTERNlist['FINAL'][fi]['ITEMs']]);

                  String POINTs = (int.parse(ConverstStrOne(
                          PATTERNlist['FINAL'][fi]['PCS'].toString())))
                      .toString();

                  String itemss = PATTERNlist['FINAL'][fi]['ITEMs'].toString();
                  String SCmasks =
                      PATTERNlist['FINAL'][fi]['SCMARK'].toString();
                  String ITEMname = '';
                  String METHODss = '';
                  String METHODname = '';
                  String FREQ =
                      '${POINTs} ${PATTERNlist['FINAL'][fi]['FREQUENCY'].toString().replaceAll('?', 'pcs/Lot').replaceAll('[]', 'pcs/Lot')}';
                  String SPECIFICATION = '';
                  String LOAD = PATTERNlist['FINAL'][fi]['LOAD'].toString();

                  for (var Fci = 0; Fci < METHODlist.length; Fci++) {
                    if (METHODlist[Fci]['masterID'].toString() == METHODss) {
                      METHODname = METHODlist[Fci]['METHOD'].toString();
                      break;
                    }
                  }

                  for (var Fci = 0; Fci < FINALCHECKlist.length; Fci++) {
                    if (FINALCHECKlist[Fci]['key'].toString() == itemss) {
                      ITEMname = FINALCHECKlist[Fci]['value'].toString();
                      METHODss = FINALCHECKlist[Fci]['METHOD'].toString();
                    }
                  }

                  for (var Fci = 0; Fci < METHODlist.length; Fci++) {
                    if (METHODlist[Fci]['masterID'].toString() == METHODss) {
                      METHODname = METHODlist[Fci]['METHOD'].toString();
                      break;
                    }
                  }
                  // print(PATTERNlist['FINAL'][fi]['SPECIFICATIONve']);

                  // print(SPECIFICATIONlist);
                  for (var SPi = 0; SPi < SPECIFICATIONlist.length; SPi++) {
                    if (SPECIFICATIONlist[SPi]['masterID'].toString() ==
                        PATTERNlist['FINAL'][fi]['SPECIFICATIONve']
                            .toString()) {
                      //
                      // print(SPECIFICATIONlist[SPi]['SPECIFICATION'].toString());
                      SPECIFICATION =
                          SPECIFICATIONlist[SPi]['SPECIFICATION'].toString();
                    }
                  }

                  ITEMlist.add(FINALCHECKlistCommonClass(
                    ITEM: itemss,
                    ITEMname: ITEMname,
                    METHOD: METHODss,
                    METHODname: METHODname,
                    SCMARK: SCmasks,
                    FREQ: FREQ,
                    SPECIFICATION: SPECIFICATION,
                    RESULT: SPECIFICATION,
                    LOAD: LOAD,
                  ));
                }
              }
            }
          }
          if (PATTERNlist['FINAL'][fi]['RESULTFORMAT'] == 'Number') {
            NO_NUMBER++;
            for (var mi = 0; mi < MACHINElist.length; mi++) {
              if (FINALdata[MACHINElist[mi]] != null) {
                if (FINALdata[MACHINElist[mi]]
                        [PATTERNlist['FINAL'][fi]['ITEMs']] !=
                    null) {
                  // print(PATTERNlist['FINAL'][fi]['RESULTFORMAT']);
                  // print(FINALdata[MACHINElist[mi]]
                  //     [PATTERNlist['FINAL'][fi]['ITEMs']]);

                  String POINTs = (int.parse(ConverstStrOne(
                          PATTERNlist['FINAL'][fi]['PCS'].toString())))
                      .toString();

                  String SPECIFICATIONbuff =
                      PATTERNlist['FINAL'][fi]['SPECIFICATIONve'].toString();
                  String itemss = PATTERNlist['FINAL'][fi]['ITEMs'].toString();
                  String SCmasks =
                      PATTERNlist['FINAL'][fi]['SCMARK'].toString();
                  String ITEMname = '';
                  String METHODss = '';
                  String METHODname = '';
                  String FREQ =
                      '${POINTs} ${PATTERNlist['FINAL'][fi]['FREQUENCY'].toString().replaceAll('?', 'pcs/Lot').replaceAll('[]', 'pcs/Lot')}';
                  String SPECIFICATION = '';
                  String LOAD = PATTERNlist['FINAL'][fi]['LOAD'].toString();
                  String UNITv = PATTERNlist['FINAL'][fi]['UNIT'].toString();
                  String UNITvs = '';
                  if (UNITv != '') {
                    for (var Fciu = 0; Fciu < UNITlist.length; Fciu++) {
                      if (UNITlist[Fciu]['masterID'].toString() == UNITv) {
                        // print(ITEMSlist[Fci]);
                        UNITvs = UNITlist[Fciu]['UNIT'].toString();
                      }
                    }
                  }

                  double maxdata = 0;
                  double mindata = 0;

                  try {
                    String SPECIFICATIONbuff2 =
                        SPECIFICATIONbuff.replaceAll('{', '{"');
                    String SPECIFICATIONbuff3 =
                        SPECIFICATIONbuff2.replaceAll('}', '"}');
                    String SPECIFICATIONbuff4 =
                        SPECIFICATIONbuff3.replaceAll(':', '":"');
                    String SPECIFICATIONbuff5 =
                        SPECIFICATIONbuff4.replaceAll(',', '","');
                    // print(SPECIFICATIONbuff5);
                    var SPECIFICATIONdata =
                        json.decode(SPECIFICATIONbuff5.replaceAll(' ', ''));
                    if (SPECIFICATIONdata['condition'] != null) {
                      // print(SPECIFICATIONdata['condition']);
                      String condition =
                          SPECIFICATIONdata['condition'].toString();

                      // print(condition);
                      // print(condition.contains("LOL(<)"));
                      // print(condition.contains("HIM(>)"));
                      // Actual
                      // print(SPECIFICATIONdata);

                      // double maxdata = 0;
                      // double mindata = 0;

                      String dataUNIT =
                          PATTERNlist['FINAL'][fi]['UNIT'].toString();

                      String unitP = '';

                      for (var ih = 0; ih < UNITlist.length; ih++) {
                        // print(UNITlist[ih]['masterID'].toString());
                        if (dataUNIT == UNITlist[ih]['masterID'].toString()) {
                          // print(UNITlist[ih]);
                          unitP = UNITlist[ih]['UNIT'].toString();
                          break;
                        }
                      }

                      if (condition.contains("BTW")) {
                        // print(SPECIFICATIONdata['BTW_LOW']);
                        // print(SPECIFICATIONdata['BTW_HI']);
                        SPECIFICATION =
                            '${SPECIFICATIONdata['BTW_LOW'].toString()}-${SPECIFICATIONdata['BTW_HI'].toString()} ${unitP.replaceAll('?', 'µ')}';

                        maxdata = double.parse(ConverstStr(
                            SPECIFICATIONdata['BTW_HI'].toString()));
                        mindata = double.parse(ConverstStr(
                            SPECIFICATIONdata['BTW_LOW'].toString()));
                      } else if (condition.contains("LOL(<)")) {
                        // print(SPECIFICATIONdata['LOL_H']);
                        SPECIFICATION =
                            '≤ ${SPECIFICATIONdata['LOL_H'].toString()} ${unitP.replaceAll('?', 'µ')}';
                        maxdata = double.parse(
                            ConverstStr(SPECIFICATIONdata['LOL_H'].toString()));
                      } else if (condition.contains("HIM(>)")) {
                        // print(SPECIFICATIONdata['HIM_L']);
                        SPECIFICATION =
                            '≥ ${SPECIFICATIONdata['HIM_L'].toString()} ${unitP.replaceAll('?', 'µ')}';

                        mindata = double.parse(
                            ConverstStr(SPECIFICATIONdata['HIM_L'].toString()));
                        print(mindata);
                      } else if (condition.contains("Actual")) {
                        // print(SPECIFICATIONdata['TARGET']);
                        SPECIFICATION = 'Actual';
                      }
                    }
                  } catch (er) {
                    print(er);
                  }

                  for (var Fci = 0; Fci < FINALCHECKlist.length; Fci++) {
                    if (FINALCHECKlist[Fci]['key'].toString() == itemss) {
                      ITEMname = FINALCHECKlist[Fci]['value'].toString();
                      METHODss = FINALCHECKlist[Fci]['METHOD'].toString();
                    }
                  }

                  for (var Fci = 0; Fci < METHODlist.length; Fci++) {
                    if (METHODlist[Fci]['masterID'].toString() == METHODss) {
                      METHODname = METHODlist[Fci]['METHOD'].toString();
                      break;
                    }
                  }
                  int desinal = 2;
                  for (var Fci = 0; Fci < ITEMSlist.length; Fci++) {
                    if (ITEMSlist[Fci]['masterID'].toString() == itemss) {
                      // print(ITEMSlist[Fci]);
                      if (ITEMSlist[Fci]['ITEMs']
                          .toString()
                          .contains("Hardness")) {
                        desinal = 0;
                      }
                      if (ITEMSlist[Fci]['ITEMs'].toString().contains("trid")) {
                        desinal = 1;
                      }
                    }
                  }
                  // print(ITEMname);

                  List<datainlist> listdataset = [];
                  for (var i = 0; i < 20; i++) {
                    if (FINALdata[MACHINElist[mi]]
                                [PATTERNlist['FINAL'][fi]['ITEMs']]
                            ['PSC${i + 1}'] !=
                        null) {
                      //
                      // print(FINALdata[MACHINElist[mi]]
                      //         [PATTERNlist['FINAL'][fi]['ITEMs']]['PSC${i + 1}']
                      //     .length);
                      var datainside = FINALdata[MACHINElist[mi]]
                          [PATTERNlist['FINAL'][fi]['ITEMs']]['PSC${i + 1}'];
                      datainlist datainpcsi = datainlist();
                      int pcsi = 0;
                      // print(PATTERNlist['FINAL'][fi]);
                      // print(ITEMSlist);

                      for (pcsi = 0; pcsi < datainside.length - 1; pcsi++) {
                        // print(pcsi);
                        // print(datainside[pcsi]['PO3']);
                        //   double.parse(ConverstStr(datainside[pcsi]['PIC1data'].toString())).toStringAsFixed(2);

                        if (pcsi == 0) {
                          datainpcsi.DATA01 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);

                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());

                          print(checkdata(
                              maxdata,
                              mindata,
                              double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))));
                        } else if (pcsi == 1) {
                          datainpcsi.DATA02 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 2) {
                          datainpcsi.DATA03 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 3) {
                          datainpcsi.DATA04 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 4) {
                          datainpcsi.DATA05 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 5) {
                          datainpcsi.DATA06 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 6) {
                          datainpcsi.DATA07 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 7) {
                          datainpcsi.DATA08 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 8) {
                          datainpcsi.DATA09 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 9) {
                          datainpcsi.DATA10 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 10) {
                          datainpcsi.DATA11 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 11) {
                          datainpcsi.DATA12 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 12) {
                          datainpcsi.DATA13 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 13) {
                          datainpcsi.DATA14 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 14) {
                          datainpcsi.DATA15 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 15) {
                          datainpcsi.DATA16 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 16) {
                          datainpcsi.DATA17 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 17) {
                          datainpcsi.DATA18 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 18) {
                          datainpcsi.DATA19 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        } else if (pcsi == 19) {
                          datainpcsi.DATA20 = double.parse(ConverstStr(
                                  datainside[pcsi]['PO3'].toString()))
                              .toStringAsFixed(desinal);
                          passlist.add(checkdata(
                                  maxdata,
                                  mindata,
                                  double.parse(ConverstStr(
                                      datainside[pcsi]['PO3'].toString())))
                              .toString());
                        }
                      }

                      datainpcsi.DATAAVG = datainside[pcsi]['PO3'].toString();
                      datainpcsi.dimensionX = pcsi;

                      listdataset.add(datainpcsi);
                    } else {
                      break;
                    }
                  }

                  double avgall = 0;
                  for (var ig = 0; ig < listdataset.length; ig++) {
                    // print(ConverstStr(listdataset[ig].DATAAVG));
                    avgall = avgall +
                        double.parse(ConverstStr(listdataset[ig].DATAAVG));
                  }
                  // print(avgall);
                  ITEMlist.add(FINALCHECKlistCommonClass(
                    ITEM: itemss,
                    ITEMname: ITEMname,
                    METHOD: METHODss,
                    METHODname: METHODname,
                    SCMARK: SCmasks,
                    SPECIFICATION: SPECIFICATION,
                    NO: NO_NUMBER,
                    FREQ: FREQ,
                    datapackset: listdataset,
                    RESULT: SPECIFICATION != 'Actual'
                        ? (avgall / listdataset.length).toStringAsFixed(desinal)
                        : '${(avgall / listdataset.length).toStringAsFixed(desinal)} ${UNITvs}',
                    LOAD: LOAD,
                  ));
                }
              }
            }
          }
          if (PATTERNlist['FINAL'][fi]['RESULTFORMAT'] == 'Graph') {
            for (var mi = 0; mi < MACHINElist.length; mi++) {
              if (FINALdata[MACHINElist[mi]] != null) {
                if (FINALdata[MACHINElist[mi]]
                        [PATTERNlist['FINAL'][fi]['ITEMs']] !=
                    null) {
                  // print(PATTERNlist['FINAL'][fi]['RESULTFORMAT']);
                  // print(FINALdata[MACHINElist[mi]]
                  //     [PATTERNlist['FINAL'][fi]['ITEMs']]);

                  ITEMlist.add(FINALCHECKlistCommonClass());
                }
              }
            }
          }
          if (PATTERNlist['FINAL'][fi]['RESULTFORMAT'] == 'Picture') {
            for (var mi = 0; mi < MACHINElist.length; mi++) {
              if (FINALdata[MACHINElist[mi]] != null) {
                if (FINALdata[MACHINElist[mi]]
                        [PATTERNlist['FINAL'][fi]['ITEMs']] !=
                    null) {
                  // print(PATTERNlist['FINAL'][fi]['RESULTFORMAT']);
                  // print(FINALdata[MACHINElist[mi]]
                  //     [PATTERNlist['FINAL'][fi]['ITEMs']]);

                  ITEMlist.add(FINALCHECKlistCommonClass());
                }
              }
            }
          }
          // print(PATTERNlist['FINAL'][fi]['RESULTFORMAT']);
          if (PATTERNlist['FINAL'][fi]['RESULTFORMAT'] == 'OCR') {
            for (var mi = 0; mi < MACHINElist.length; mi++) {
              // print("----${PATTERNlist['FINAL'][fi]['ITEMs']}");
              if (FINALdata[MACHINElist[mi]] != null) {
                if (FINALdata[MACHINElist[mi]]
                        [PATTERNlist['FINAL'][fi]['ITEMs']] !=
                    null) {
                  // print(PATTERNlist['FINAL'][fi]['RESULTFORMAT']);
                  // print(FINALdata[MACHINElist[mi]]

                  String POINTs = (int.parse(ConverstStrOne(
                          PATTERNlist['FINAL'][fi]['PCS'].toString())))
                      .toString();

                  String SPECIFICATIONbuff =
                      PATTERNlist['FINAL'][fi]['SPECIFICATIONve'].toString();
                  String itemss = PATTERNlist['FINAL'][fi]['ITEMs'].toString();
                  String SCmasks =
                      PATTERNlist['FINAL'][fi]['SCMARK'].toString();
                  String ITEMname = '';
                  String METHODss = '';
                  String METHODname = '';
                  String FREQ =
                      '${POINTs} ${PATTERNlist['FINAL'][fi]['FREQUENCY'].toString().replaceAll('?', 'pcs/Lot').replaceAll('[]', 'pcs/Lot')}';
                  print(FREQ);
                  String SPECIFICATION = '';
                  String LOAD = PATTERNlist['FINAL'][fi]['LOAD'].toString();
                  String UNITv = PATTERNlist['FINAL'][fi]['UNIT'].toString();
                  String UNITvs = '';
                  if (UNITv != '') {
                    for (var Fciu = 0; Fciu < UNITlist.length; Fciu++) {
                      if (UNITlist[Fciu]['masterID'].toString() == UNITv) {
                        // print(ITEMSlist[Fci]);
                        UNITvs = UNITlist[Fciu]['UNIT'].toString();
                      }
                    }
                  }

                  for (var Fci = 0; Fci < METHODlist.length; Fci++) {
                    if (METHODlist[Fci]['masterID'].toString() == METHODss) {
                      METHODname = METHODlist[Fci]['METHOD'].toString();
                      break;
                    }
                  }

                  for (var Fci = 0; Fci < FINALCHECKlist.length; Fci++) {
                    if (FINALCHECKlist[Fci]['key'].toString() == itemss) {
                      ITEMname = FINALCHECKlist[Fci]['value'].toString();
                      METHODss = FINALCHECKlist[Fci]['METHOD'].toString();
                    }
                  }

                  for (var Fci = 0; Fci < METHODlist.length; Fci++) {
                    if (METHODlist[Fci]['masterID'].toString() == METHODss) {
                      METHODname = METHODlist[Fci]['METHOD'].toString();
                      break;
                    }
                  }

                  int desinal = 2;
                  // print(itemss);
                  for (var Fci = 0; Fci < ITEMSlist.length; Fci++) {
                    if (ITEMSlist[Fci]['masterID'].toString() == itemss) {
                      if (ITEMSlist[Fci]['ITEMs']
                          .toString()
                          .contains("pound")) {
                        desinal = 1;
                      }
                      if (ITEMSlist[Fci]['ITEMs'].toString().contains("trid")) {
                        desinal = 1;
                      }
                    }
                  }

                  List<datainlist> listdataset = [];
                  for (var i = 0; i < 20; i++) {
                    if (FINALdata[MACHINElist[mi]]
                                [PATTERNlist['FINAL'][fi]['ITEMs']]
                            ['PSC${i + 1}'] !=
                        null) {
                      //
                      // print(FINALdata[MACHINElist[mi]]
                      //         [PATTERNlist['FINAL'][fi]['ITEMs']]['PSC${i + 1}']
                      //     .length);

                      var datainside = FINALdata[MACHINElist[mi]]
                          [PATTERNlist['FINAL'][fi]['ITEMs']]['PSC${i + 1}'];

                      datainlist datainpcsi = datainlist();
                      int pcsi = 0;

                      // print(datainside.length);

                      double maxdata = 0;
                      double mindata = 0;

                      try {
                        String SPECIFICATIONbuff2 =
                            SPECIFICATIONbuff.replaceAll('{', '{"');
                        String SPECIFICATIONbuff3 =
                            SPECIFICATIONbuff2.replaceAll('}', '"}');
                        String SPECIFICATIONbuff4 =
                            SPECIFICATIONbuff3.replaceAll(':', '":"');
                        String SPECIFICATIONbuff5 =
                            SPECIFICATIONbuff4.replaceAll(',', '","');
                        // print(SPECIFICATIONbuff5);
                        var SPECIFICATIONdata =
                            json.decode(SPECIFICATIONbuff5.replaceAll(' ', ''));
                        if (SPECIFICATIONdata['condition'] != null) {
                          // print(SPECIFICATIONdata['condition']);
                          String condition =
                              SPECIFICATIONdata['condition'].toString();

                          // print(condition);
                          // print(condition.contains("LOL(<)"));
                          // print(condition.contains("HIM(>)"));
                          // Actual
                          // print(SPECIFICATIONdata);

                          // print(PATTERNlist['FINAL'][fi]);
                          String dataUNIT =
                              PATTERNlist['FINAL'][fi]['UNIT'].toString();

                          String unitP = '';

                          for (var ih = 0; ih < UNITlist.length; ih++) {
                            // print(UNITlist[ih]['masterID'].toString());
                            if (dataUNIT ==
                                UNITlist[ih]['masterID'].toString()) {
                              // print(UNITlist[ih]);
                              unitP = UNITlist[ih]['UNIT'].toString();
                              break;
                            }
                          }

                          if (condition.contains("BTW")) {
                            // print(SPECIFICATIONdata['BTW_LOW']);
                            // print(SPECIFICATIONdata['BTW_HI']);
                            SPECIFICATION =
                                '${SPECIFICATIONdata['BTW_LOW'].toString()}-${SPECIFICATIONdata['BTW_HI'].toString()} ${unitP.replaceAll('?', 'µ')}';
                            maxdata = double.parse(ConverstStr(
                                SPECIFICATIONdata['BTW_HI'].toString()));
                            mindata = double.parse(ConverstStr(
                                SPECIFICATIONdata['BTW_LOW'].toString()));
                          } else if (condition.contains("LOL(<)")) {
                            // print(SPECIFICATIONdata['LOL_H']);
                            SPECIFICATION =
                                '≤ ${SPECIFICATIONdata['LOL_H'].toString()} ${unitP.replaceAll('?', 'µ')}';
                            maxdata = double.parse(ConverstStr(
                                SPECIFICATIONdata['LOL_H'].toString()));
                          } else if (condition.contains("HIM(>)")) {
                            // print(SPECIFICATIONdata['HIM_L']);
                            SPECIFICATION =
                                '≥ ${SPECIFICATIONdata['HIM_L'].toString()} ${unitP.replaceAll('?', 'µ')}';
                            mindata = double.parse(ConverstStr(
                                SPECIFICATIONdata['HIM_L'].toString()));
                          } else if (condition.contains("Actual")) {
                            // print(SPECIFICATIONdata['TARGET']);
                            SPECIFICATION = 'Actual';
                          }
                        }
                      } catch (er) {
                        print(er);
                      }

                      // print(maxdata);
                      print(datainside.length);

                      for (pcsi = 0; pcsi < datainside.length; pcsi++) {
                        // print(datainside[pcsi]);
                        datainpcsi.DATA01 = double.parse(ConverstStr(
                                datainside[pcsi]['PIC1data'].toString()))
                            .toStringAsFixed(desinal);
                        datainpcsi.DATA02 = double.parse(ConverstStr(
                                datainside[pcsi]['PIC2data'].toString()))
                            .toStringAsFixed(desinal);
                        datainpcsi.DATA03 = double.parse(ConverstStr(
                                datainside[pcsi]['PIC3data'].toString()))
                            .toStringAsFixed(desinal);
                        datainpcsi.DATA04 = double.parse(ConverstStr(
                                datainside[pcsi]['PIC4data'].toString()))
                            .toStringAsFixed(desinal);

                        if (datainside[pcsi]['PIC1data'].toString() == '0') {
                          //

                          datainpcsi.DATAAVG = '';
                          datainpcsi.dimensionX = 0;
                        } else if (datainside[pcsi]['PIC2data'].toString() ==
                            '0') {
                          //
                          double data0001 = double.parse(ConverstStr(
                              datainside[pcsi]['PIC1data'].toString()));

                          datainpcsi.DATAAVG =
                              ((data0001) / 1).toStringAsFixed(desinal);

                          datainpcsi.dimensionX = 1;

                          passlist.add(
                              checkdata(maxdata, mindata, data0001).toString());
                        } else if (datainside[pcsi]['PIC3data'].toString() ==
                            '0') {
                          //
                          double data0001 = double.parse(ConverstStr(
                              datainside[pcsi]['PIC1data'].toString()));
                          double data0002 = double.parse(ConverstStr(
                              datainside[pcsi]['PIC2data'].toString()));

                          datainpcsi.DATAAVG = ((data0001 + data0002) / 2)
                              .toStringAsFixed(desinal);
                          datainpcsi.dimensionX = 2;

                          passlist.add(
                              checkdata(maxdata, mindata, data0001).toString());

                          passlist.add(
                              checkdata(maxdata, mindata, data0002).toString());
                        } else if (datainside[pcsi]['PIC4data'].toString() ==
                            '0') {
                          //
                          double data0001 = double.parse(ConverstStr(
                              datainside[pcsi]['PIC1data'].toString()));
                          double data0002 = double.parse(ConverstStr(
                              datainside[pcsi]['PIC2data'].toString()));
                          double data0003 = double.parse(ConverstStr(
                              datainside[pcsi]['PIC3data'].toString()));

                          datainpcsi.DATAAVG =
                              ((data0001 + data0002 + data0003) / 3)
                                  .toStringAsFixed(desinal);
                          datainpcsi.dimensionX = 3;
                          passlist.add(
                              checkdata(maxdata, mindata, data0001).toString());
                          passlist.add(
                              checkdata(maxdata, mindata, data0002).toString());
                          passlist.add(
                              checkdata(maxdata, mindata, data0003).toString());
                        } else {
                          double data0001 = double.parse(ConverstStr(
                              datainside[pcsi]['PIC1data'].toString()));
                          double data0002 = double.parse(ConverstStr(
                              datainside[pcsi]['PIC2data'].toString()));
                          double data0003 = double.parse(ConverstStr(
                              datainside[pcsi]['PIC3data'].toString()));
                          double data0004 = double.parse(ConverstStr(
                              datainside[pcsi]['PIC4data'].toString()));

                          datainpcsi.DATAAVG =
                              ((data0001 + data0002 + data0003 + data0003) / 4)
                                  .toStringAsFixed(desinal);
                          datainpcsi.dimensionX = 4;
                          passlist.add(
                              checkdata(maxdata, mindata, data0001).toString());
                          passlist.add(
                              checkdata(maxdata, mindata, data0002).toString());
                          passlist.add(
                              checkdata(maxdata, mindata, data0003).toString());
                          passlist.add(
                              checkdata(maxdata, mindata, data0004).toString());
                        }
                        // print('>>${datainpcsi.DATA01}');
                        // print('>>${datainpcsi.DATA02}');
                        // print('>>${datainpcsi.DATA03}');

                        // print('>>${datainpcsi.DATAAVG}');

                        if (pcsi == 0) {
                          if (BasicCommonDATAs.PIC01 == '') {
                            BasicCommonDATAs.PIC01 =
                                datainside[pcsi]['PIC1'].toString();
                          }
                          if (BasicCommonDATAs.PIC02 == '') {
                            BasicCommonDATAs.PIC02 =
                                datainside[pcsi]['PIC2'].toString();
                          }
                        }
//3310275880
                        if (pcsi == 1) {
                          if (BasicCommonDATAs.PIC02 == '') {
                            BasicCommonDATAs.PIC02 =
                                datainside[pcsi]['PIC2'].toString();
                          }
                        }
                      }
                      print("BasicCommonDATAs.PIC01");
                      //3310275879
                      //3310275807
                      // datainpcsi.dimensionX = pcsi;
                      listdataset.add(datainpcsi);
                    } else {
                      break;
                    }
                  }

                  // print(PATTERNlist['FINAL'][fi]['POINT']);

                  // print(SPECIFICATION);

                  double avgall = 0;
                  for (var ig = 0; ig < listdataset.length; ig++) {
                    // print(ConverstStr(listdataset[ig].DATAAVG));
                    avgall = avgall +
                        double.parse(ConverstStr(listdataset[ig].DATAAVG));
                  }

                  ITEMlist.add(FINALCHECKlistCommonClass(
                    ITEM: itemss,
                    ITEMname: ITEMname,
                    METHOD: METHODss,
                    METHODname: METHODname,
                    SCMARK: SCmasks,
                    SPECIFICATION: SPECIFICATION,
                    NO: NO_NUMBER,
                    FREQ: FREQ,
                    datapackset: listdataset,
                    RESULT: SPECIFICATION != 'Actual'
                        ? avgall.toStringAsFixed(desinal)
                        : '${avgall.toStringAsFixed(desinal)} ${UNITvs}',
                    LOAD: LOAD,
                  ));
                }
              }
            }
          }
        }
        print('>>${ITEMlist.length}');

        if (passlist.contains("false")) {
          BasicCommonDATAs.PASS = 'NO PASSED';
        } else {
          BasicCommonDATAs.PASS = 'PASSED';
        }

        output.databasic = BasicCommonDATAs;
        output.datain = ITEMlist;
      }
    }

    print(BasicCommonDATAs.PASS);

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
    this.NO = 0,
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
    this.datapackset = const [],
    this.LOAD = '',
  });
  int NO;
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
  List<datainlist> datapackset;
  String LOAD;
}

class datainlist {
  datainlist({
    this.dimensionX = 0,
    this.dimensionY = 0,
    this.DATA01 = '',
    this.DATA02 = '',
    this.DATA03 = '',
    this.DATA04 = '',
    this.DATA05 = '',
    this.DATA06 = '',
    this.DATA07 = '',
    this.DATA08 = '',
    this.DATA09 = '',
    this.DATA10 = '',
    this.DATA11 = '',
    this.DATA12 = '',
    this.DATA13 = '',
    this.DATA14 = '',
    this.DATA15 = '',
    this.DATA16 = '',
    this.DATA17 = '',
    this.DATA18 = '',
    this.DATA19 = '',
    this.DATA20 = '',
    this.DATAAVG = '',
  });

  int dimensionX;
  int dimensionY;

  String DATA01;
  String DATA02;
  String DATA03;
  String DATA04;
  String DATA05;
  String DATA06;
  String DATA07;
  String DATA08;
  String DATA09;
  String DATA10;
  String DATA11;
  String DATA12;
  String DATA13;
  String DATA14;
  String DATA15;
  String DATA16;
  String DATA17;
  String DATA18;
  String DATA19;
  String DATA20;
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
    this.UNITSAP = '',
    this.PICstd = '',
    this.PIC01 = '',
    this.PIC02 = '',
    this.PIC03 = '',
    this.PARTNAMEref = '',
    this.PARTref = '',
    this.PASS = '',
    this.INC01 = '',
    this.INC02 = '',
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
  String UNITSAP;
  String PIC01;
  String PIC02;
  String PIC03;

  String PARTNAMEref;
  String PARTref;

  String PASS;

  String INC01;
  String INC02;
}

class CommonReportOutput {
  CommonReportOutput({
    this.datain = const [],
    required this.databasic,
  });

  List<FINALCHECKlistCommonClass> datain;
  BasicCommonDATA databasic;
}

bool checkdata(double maxdata, double mindata, double input) {
  if (maxdata != 0 && mindata != 0) {
    if (input < mindata || input > maxdata) {
      return false;
    } else {
      return true;
    }
  } else if (maxdata != 0 && mindata == 0) {
    if (input > maxdata) {
      return false;
    } else {
      return true;
    }
  } else if (maxdata == 0 && mindata != 0) {
    if (input < mindata) {
      return false;
    } else {
      return true;
    }
  } else {
    return true;
  }
}
