import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/ACTtestdata.dart';
import '../../data/global.dart';
import '../../widget/common/Safty.dart';
import '../cubit/NotificationEvent.dart';
import '31-ReportPDFCommoncubit.dart';

String server = 'http://172.23.10.40:16700/';

class ReportPDFACT02cubit_Cubit extends Cubit<ACTReport02Output> {
  /// {@macro brightness_cubit}
  ReportPDFACT02cubit_Cubit()
      : super(ACTReport02Output(databasic: BasicACTDATA()));

  /// Toggles the current brightness between light and dark.
  Future<void> ReportPDF_ACT(String PO) async {
    // FreeLoadingN(ReportPDFACT02context);

    ACTReport02Output output = ACTReport02Output(databasic: BasicACTDATA());
    BasicACTDATA BasicDATAs = BasicACTDATA();

    final response = await Dio().post(
      server + "INS_Report_PDF",
      data: {
        "PO": PO,
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      // var databuff = ACTtestdata01;1
      // print(databuff);

      if (databuff['DATA'] != null && databuff['DATA'].length != 0) {
        //-----------------------
        var FINALdata = databuff['DATA'][0]['FINAL'] ?? {};
        var FINALCHECKlist = databuff['DATA'][0]['CHECKlist'] ?? [];
        var METHODlist = databuff['METHOD'] ?? [];
        var PATTERNlist = databuff['PATTERN'][0] ?? {};
        // print(databuff['PATTERN']);
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

        List<String> passlist = [];

        bool pass01 = false;
        bool pass02 = false;
        bool pass03 = false;
        bool pass04 = false;
        bool pass05 = false;
        bool pass06 = false;
        bool pass07 = false;
        bool pass08 = false;
        bool pass09 = false;
        bool pass10 = false;
        bool pass11 = false;
        bool pass12 = false;
        bool pass13 = false;
        bool pass14 = false;
        bool pass15 = false;

        if (cango) {
          //-----------------------
          List<String> MACHINElist = [];
          List<FINALCHECKlistACTClass> ITEMlist = [];

          //-----------------------

          FINALdata.forEach((key, value) {
            MACHINElist.add(key);
          });

          for (var i = 0; i < FINALCHECKlist.length; i++) {
            ITEMlist.add(FINALCHECKlistACTClass(
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

          BasicDATAs = BasicACTDATA(
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
            PARTNO: BasicDATAr['PART_s'] != null
                ? BasicDATAr['PART_s'].toString()
                : '',
            PARTNO_s:
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
            // PICstd: BasicDATAr['PIC'] != null
            //     ? BasicDATAr['PIC'].toString().split(',')[1]
            //     : '',

            Inspected: BasicDATAr['IDInspected'] != null
                ? BasicDATAr['IDInspected'].toString()
                : '',
            Check: BasicDATAr['IDCheck'] != null
                ? BasicDATAr['IDCheck'].toString()
                : '',
            Approve: BasicDATAr['IDApprove'] != null
                ? BasicDATAr['IDApprove'].toString()
                : '',
          );

          if (BasicDATAs.Inspected != '') {
            final responseS1 = await Dio().post(
              'http://172.23.10.40:16714/' + "re_login",
              data: {
                "ID": BasicDATAs.Inspected,
                // "PASS": logindata.userPASS,
              },
            );
            if (responseS1.statusCode == 200) {
              //SIGNATURE
              // print(responseS1.data);
              var input = responseS1.data;
              BasicDATAs.Inspected_sign = input['SIGNATURE'] != null
                  ? input['SIGNATURE'].toString()
                  : '';
            }
          }

          if (BasicDATAs.Check != '') {
            final responseS2 = await Dio().post(
              'http://172.23.10.40:16714/' + "re_login",
              data: {
                "ID": BasicDATAs.Check,
                // "PASS": logindata.userPASS,
              },
            );
            if (responseS2.statusCode == 200) {
              //SIGNATURE
              // print(response.data);
              var input = responseS2.data;
              BasicDATAs.Check_sign = input['SIGNATURE'] != null
                  ? input['SIGNATURE'].toString()
                  : '';
            }
          }

          if (BasicDATAs.Approve != '') {
            final responseS3 = await Dio().post(
              'http://172.23.10.40:16714/' + "re_login",
              data: {
                "ID": BasicDATAs.Approve,
                // "PASS": logindata.userPASS,
              },
            );
            if (responseS3.statusCode == 200) {
              //SIGNATURE
              // print(response.data);
              var input = responseS3.data;
              BasicDATAs.Approve_sign = input['SIGNATURE'] != null
                  ? input['SIGNATURE'].toString()
                  : '';
            }
          }

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
                BasicDATAs.PARTNAMEref =
                    databuffref['DATA']?[0]['PARTNAME'].toString() ?? '';
                BasicDATAs.PARTref =
                    databuffref['DATA']?[0]['PART'].toString() ?? '';
                // print(databuffref['DATA']?[0]['PART']);
                // print(databuffref['DATA']?[0]['PARTNAME']);
              }
            }
          }
          if (RepoteData.SUMLOT == 'SUM') {
            final response03 = await Dio().post(
              server + "INS_Report_by_ref",
              data: {
                // "PO": BasicDATAr['ReferFrom'].toString(),
                "PO": BasicDATAr['ReferFrom'] != null
                    ? BasicDATAr['ReferFrom'].toString()
                    : BasicDATAr['PO'].toString(),
              },
            );

            if (response03.statusCode == 200) {
              var databuffref = response03.data;

              double qty = 0;

              if (databuffref['DATAlist'].length > 0) {
                // print(databuffref['DATAlist']);
                if (databuffref['DATA'].length > 0) {
                  BasicDATAs.TPKLOT =
                      databuffref['DATA']?[0]['TPKLOT'].toString() ?? '';

                  BasicDATAs.CUSLOT =
                      databuffref['DATA']?[0]['CUSLOT'].toString() ?? '';

                  qty = double.parse(ConverstStr(
                      databuffref['DATA']?[0]['QTY'].toString() ?? ''));

                  List<String> lotlist = [];
                  for (var p = 0; p < databuffref['DATAlist'].length; p++) {
                    String lastst =
                        databuffref['DATAlist']?[p]['TPKLOT'].toString() ?? '';
                    // BasicDATAs.TPKLOT = BasicDATAs.TPKLOT +
                    //     ',' +
                    //     ('${lastst.substring(7, 10)}');
                    // lotlist
                    //   .add(int.parse(ConverstStr('${lastst.substring(7, 10)}')));
                    if (lastst.length >= 10) {
                      lotlist.add('${lastst.substring(7, 10)}');
                    }

                    BasicDATAs.CUSLOT = BasicDATAs.CUSLOT +
                        ',' +
                        '${databuffref['DATAlist']?[p]['CUSLOT'].toString() ?? ''}';

                    qty = qty +
                        double.parse(ConverstStr(
                            databuffref['DATAlist']?[p]['QTY'].toString() ??
                                ''));
                  }
                  lotlist = lotlist..sort();
                  BasicDATAs.TPKLOT = BasicDATAs.TPKLOT +
                      ',' +
                      lotlist
                          .toString()
                          .replaceAll("]", "")
                          .replaceAll("[", "");
                  BasicDATAs.QTY = qty.toString();
                }
              }
              // print(qty);
              BasicDATAs.CUSLOT = BasicDATAs.CUSLOT.replaceAll(",,", ",");
              List<String> datalist = BasicDATAs.CUSLOT.split(",");
              BasicDATAs.CUSLOT = datalist
                  .toSet()
                  .toString()
                  .replaceAll("}", "")
                  .replaceAll("{", "");
              // BasicDATAs.PARTNAMEref =
              //     databuffref['DATA']?[0]['PARTNAME'].toString() ?? '';
              // BasicDATAs.PARTref =
              //     databuffref['DATA']?[0]['PART'].toString() ?? '';
              // BasicDATAs.TPKLOTref =
              //     databuffref['DATA']?[0]['TPKLOT'].toString() ?? '';
              // BasicDATAs.TPKLOT =
              //     BasicDATAs.TPKLOT + "," + BasicDATAs.TPKLOTref;
              // print(databuffref['DATA']?[0]['PART']);
              // print(databuffref['DATA']?[0]['PARTNAME']);
            }
          }
          // print(PATTERNlist);
          if (PATTERNlist['Pimg'] != null) {
            if (PATTERNlist['Pimg']['P1'] != null) {
              // BasicDATAs.PICstd = BasicDATAr['PIC'] != null
              //     ? BasicDATAr['PIC'].toString().split(',')[1]
              //     : '';
              List<String> datalist =
                  PATTERNlist['Pimg']['P1'].toString().split(',');
              if (datalist.length > 1) {
                BasicDATAs.PICstd = datalist[1];
              } else {
                BasicDATAs.PICstd = '';
              }
            }
          }

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
                    // print(PATTERNlist['FINAL'][i]['ITEMs']);
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

                      ITEMlist[le].LOAD =
                          PATTERNlist['FINAL'][i]['LOAD'] != null
                              ? PATTERNlist['FINAL'][i]['LOAD'].toString()
                              : '';

                      if (ITEMlist[le].LOAD != '-' && ITEMlist[le].LOAD != '') {
                        ITEMlist[le].ITEMname =
                            ITEMlist[le].ITEMname + ' (${ITEMlist[le].LOAD})';
                      }

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
                          double data01 = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC1data']
                                  .toString()));
                          double data02 = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC2data']
                                  .toString()));

                          double data03 = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC3data']
                                  .toString()));

                          ITEMlist[le].DATA01 = data01.toStringAsFixed(1);
                          ITEMlist[le].DATA02 = data02.toStringAsFixed(1);
                          ITEMlist[le].DATA03 = data03.toStringAsFixed(1);

                          double avg = data01 + data02 + data03;

                          ITEMlist[le].DATAAVG = (avg / 3).toStringAsFixed(1);

                          BasicDATAs.PIC01 = (FINALdata[MACHINElist[k]]
                                      [ITEMlist[le].ITEM]['PSC1'][0]['PIC1'] ??
                                  '')
                              .toString();
                          BasicDATAs.PIC02 = (FINALdata[MACHINElist[k]]
                                      [ITEMlist[le].ITEM]['PSC1'][0]['PIC2'] ??
                                  '')
                              .toString();
                          // print(ITEMlist[le].DATA01);
                          // print(ITEMlist[le].DATA02);
                          // print(ITEMlist[le].DATA03);

                          if (data01 < 6 || data01 > 17) {
                            pass01 = false;
                            passlist.add("false");
                          } else {
                            pass01 = true;
                            passlist.add("true");
                          }
                          if (data02 < 6 || data02 > 17) {
                            pass02 = false;
                            passlist.add("false");
                          } else {
                            pass02 = true;
                            passlist.add("true");
                          }
                          if (data03 < 6 || data03 > 17) {
                            pass03 = false;
                            passlist.add("false");
                          } else {
                            pass03 = true;
                            passlist.add("true");
                          }
                        }
                      } else if (ITEMlist[le].ITEM ==
                          'ITEMs-60407f6193e8d91950acb5cf') {
                        //Porous Thickness
                        // print(FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]);
                        if (FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]['PSC1']
                                .length ==
                            1) {
                          ITEMlist[le].SPECIFICATION =
                              '≤ 7 µm. & ≤60% of\ncompound Layer';
                          ITEMlist[le].CONTROLlimmit = '≤ 5µm.';
                          double data01 = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC1data']
                                  .toString()));
                          double data02 = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC2data']
                                  .toString()));

                          double data03 = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PIC3data']
                                  .toString()));

                          ITEMlist[le].DATA01 = data01.toStringAsFixed(1);
                          ITEMlist[le].DATA02 = data02.toStringAsFixed(1);
                          ITEMlist[le].DATA03 = data03.toStringAsFixed(1);

                          double avg = data01 + data02 + data03;

                          ITEMlist[le].DATAAVG = (avg / 3).toStringAsFixed(1);

                          if (data01 > 7) {
                            pass04 = false;
                            passlist.add("false");
                          } else {
                            pass04 = true;
                            passlist.add("true");
                          }
                          if (data01 > 7) {
                            pass05 = false;
                            passlist.add("false");
                          } else {
                            pass05 = true;
                            passlist.add("true");
                          }
                          if (data01 > 7) {
                            pass06 = false;
                            passlist.add("false");
                          } else {
                            pass06 = true;
                            passlist.add("true");
                          }

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
                          ITEMlist[le].CONTROLlimmit = '550-660 Hmv';
                          double data01 = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PO3']
                                  .toString()));
                          double data02 = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][1]['PO3']
                                  .toString()));

                          double data03 = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][2]['PO3']
                                  .toString()));

                          ITEMlist[le].DATA01 = data01.toStringAsFixed(0);
                          ITEMlist[le].DATA02 = data02.toStringAsFixed(0);
                          ITEMlist[le].DATA03 = data03.toStringAsFixed(0);

                          double avg = data01 + data02 + data03;

                          ITEMlist[le].DATAAVG = (avg / 3).toStringAsFixed(0);

                          if (data01 < 500 || data01 > 680) {
                            pass07 = false;
                            passlist.add("false");
                          } else {
                            pass07 = true;
                            passlist.add("true");
                          }
                          if (data02 < 500 || data02 > 680) {
                            pass08 = false;
                            passlist.add("false");
                          } else {
                            pass08 = true;
                            passlist.add("true");
                          }
                          if (data03 < 500 || data03 > 680) {
                            pass09 = false;
                            passlist.add("false");
                          } else {
                            pass09 = true;
                            passlist.add("true");
                          }

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
                          ITEMlist[le].CONTROLlimmit = '30-58 HSC';
                          // print("---------->XX");
                          // print(ConverstStr(FINALdata[MACHINElist[k]]
                          //     [ITEMlist[le].ITEM]['PSC1'][0]['PO3']));
                          // print("---------->XX");
                          double data01 = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PO3']
                                  .toString()));
                          double data02 = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][1]['PO3']
                                  .toString()));

                          double data03 = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][2]['PO3']
                                  .toString()));

                          ITEMlist[le].DATA01 = data01.toStringAsFixed(0);
                          ITEMlist[le].DATA02 = data02.toStringAsFixed(0);
                          ITEMlist[le].DATA03 = data03.toStringAsFixed(0);

                          double avg = data01 + data02 + data03;

                          ITEMlist[le].DATAAVG = (avg / 3).toStringAsFixed(0);

                          if (data01 < 26 || data01 > 60) {
                            pass10 = false;
                            passlist.add("false");
                          } else {
                            pass10 = true;
                            passlist.add("true");
                          }
                          if (data02 < 26 || data02 > 60) {
                            pass11 = false;
                            passlist.add("false");
                          } else {
                            pass11 = true;
                            passlist.add("true");
                          }
                          if (data03 < 26 || data03 > 60) {
                            pass12 = false;
                            passlist.add("false");
                          } else {
                            pass12 = true;
                            passlist.add("true");
                          }

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
                          ITEMlist[le].SPECIFICATION = '≤ 0.07 ppm';

                          double datain = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                      ['PSC1'][0]['PO3']
                                  .toString()));
                          // if (datain <= 0.03) {
                          //   ITEMlist[le].DATA01 = '< 0.03';
                          // } else {
                          ITEMlist[le].DATA01 = double.parse(ConverstStr(
                                  FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                          ['PSC1'][0]['PO3']
                                      .toString()))
                              .toStringAsFixed(2);
                          // }

                          if (datain > 0.07) {
                            pass13 = false;
                            passlist.add("false");
                          } else {
                            pass13 = true;
                            passlist.add("true");
                          }

                          // print(ITEMlist[le].DATA01);
                        }
                      } else if (ITEMlist[le].ITEM ==
                          'ITEMs-1755226359426Ruj6dkoeKJ9LbOA') {
                        // print(FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]);
                        //Remain of CN on part
                        if (FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]['PSC1']
                                .length >
                            1) {
                          ITEMlist[le].SPECIFICATION = '≤ 0.07 ppm';

                          double datain = double.parse(ConverstStr(
                              FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                  ['PSC1'][0]['PO3']));
                          if (datain <= 0.03) {
                            // ITEMlist[le].DATA01 = '< 0.03';
                            ITEMlist[le].DATA01 = double.parse(ConverstStr(
                                    FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                        ['PSC1'][0]['PO3']))
                                .toStringAsFixed(2);
                          } else {
                            ITEMlist[le].DATA01 = double.parse(ConverstStr(
                                    FINALdata[MACHINElist[k]][ITEMlist[le].ITEM]
                                        ['PSC1'][0]['PO3']))
                                .toStringAsFixed(2);
                          }

                          if (datain > 60) {
                            pass14 = false;
                            pass15 = false;
                            passlist.add("false");
                          } else {
                            pass14 = true;
                            pass15 = true;
                            passlist.add("true");
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

          print(pass01);
          print(pass02);
          print(pass03);
          print(pass04);
          print(pass05);
          print(pass06);
          print(pass07);
          print(pass08);
          print(pass09);
          print(pass10);
          print(pass11);
          print(pass12);
          print(pass13);
          print(pass14);
          print(pass15);

          // pass14 = true;
          // pass15 = true;

          // if (pass01 &&
          //     pass02 &&
          //     pass03 &&
          //     pass04 &&
          //     pass05 &&
          //     pass06 &&
          //     pass07 &&
          //     pass08 &&
          //     pass09 &&
          //     pass10 &&
          //     pass11 &&
          //     pass12 &&
          //     pass13 &&
          //     pass14 &&
          //     pass15) {
          //   BasicDATAs.PASS = 'PASSED';
          // } else {
          //   // BasicDATAs.PASS = 'NO PASSED';
          //   BasicDATAs.PASS = 'N/A';
          // }

          if (passlist.contains("false")) {
            // BasicCommonDATAs.PASS = 'NO PASSED';
            BasicDATAs.PASS = 'N/A';
          } else {
            BasicDATAs.PASS = 'PASSED';
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

    //-----------
    // var now1 = DateTime.now().subtract(Duration(days: 30));
    // var now2 = DateTime.now().add(Duration(days: 5));
    // String day = DateFormat('dd').format(now1);
    // String month = DateFormat('MM').format(now1);
    // String year = DateFormat('yyyy').format(now1);

    // String days = DateFormat('dd').format(now2);
    // String months = DateFormat('MM').format(now2);
    // String years = DateFormat('yyyy').format(now2);
    // final response9 = await Dio().post(
    //   "${server2}10GETDATAFROMJOBBINGAQC/GETDATA",
    //   data: {
    //     "HEADER": {
    //       "PLANT": "2300",
    //       "ORD_ST_DATE_FR": "${day}.${month}.${year}",
    //       "ORD_ST_DATE_TO": "${days}.${months}.${years}",
    //       "ORDER_TYPE": "",
    //       "PROD_SUP": ""
    //     },
    //     "PROC_ORD": [
    //       {"PROCESS_ORDER": PO, "MATERIAL": ""}
    //     ]
    //   },
    // );
    // if (response9.statusCode == 200) {
    //   var databuffref = response9.data;
    //   // print(databuffref);
    //   if (databuffref['HEADER_INFO'] != null) {
    //     if (databuffref['HEADER_INFO'].length > 0) {
    //       // print(databuffref['HEADER_INFO'][0]['USER_STATUS']);
    //       output.databasic.USER_STATUS =
    //           databuffref['HEADER_INFO'][0]['USER_STATUS'].toString();
    //     }
    //   }
    // }

    // Navigator.pop(ReportPDFACT02context);
    emit(output);
  }

  Future<void> Flush() async {
    ACTReport02Output output = ACTReport02Output(databasic: BasicACTDATA());
    emit(output);
  }
}

class FINALCHECKlistACTClass {
  FINALCHECKlistACTClass({
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
    this.LOAD = '',
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
  String LOAD;
}

class BasicACTDATA {
  BasicACTDATA({
    this.PO = '',
    this.CP = '',
    this.CUSTOMER = '',
    this.PROCESS = '',
    this.PARTNAME = '',
    this.PARTNO = '',
    this.PARTNO_s = '',
    this.CUSLOT = '',
    this.TPKLOT = '',
    this.MATERIAL = '',
    this.QTY = '',
    this.PICstd = '',
    this.PIC01 = '',
    this.PIC02 = '',
    this.PIC03 = '',
    this.PASS = '',
    this.PARTNAMEref = '',
    this.PARTref = '',
    this.USER_STATUS = '',
    this.Inspected = '',
    this.Check = '',
    this.Approve = '',
    this.Inspected_sign = '',
    this.Check_sign = '',
    this.Approve_sign = '',
  });

  String PO;
  String CP;
  String CUSTOMER;
  String PROCESS;
  String PARTNAME;
  String PARTNO;
  String PARTNO_s;
  String CUSLOT;
  String TPKLOT;
  String MATERIAL;
  String QTY;
  String PICstd;
  String PIC01;
  String PIC02;
  String PIC03;
  String PASS;
  String PARTNAMEref;
  String PARTref;
  String USER_STATUS;
  String Inspected;
  String Check;
  String Approve;

  String Inspected_sign;
  String Check_sign;
  String Approve_sign;
}

class ACTReport02Output {
  ACTReport02Output({
    this.datain = const [],
    required this.databasic,
  });

  List<FINALCHECKlistACTClass> datain;
  BasicACTDATA databasic;
}
