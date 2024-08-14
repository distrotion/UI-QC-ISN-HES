import 'dart:html';

import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:csv/csv.dart';

import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P11INDreport/INDreportMAIN.dart';
import '../../page/P11INDreport/INDreportVAR.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
import '11-01-ReportCSV.dart';

//-------------------------------------------------

DateTime selectedDate = DateTime.now();

// String server = 'http://172.23.10.40:16000/';
// String server = 'http://127.0.0.1:15150/';
String server = GLOserver;

abstract class SumReportGET_Event {}

class SumReportGET_GET extends SumReportGET_Event {}

class SumReportGET_flush extends SumReportGET_Event {}

class SumReportGET_Bloc extends Bloc<SumReportGET_Event, datauoutraw> {
  SumReportGET_Bloc() : super(datauoutraw()) {
    on<SumReportGET_GET>((event, emit) {
      return _SumReportGET_GET(datauoutraw(), emit);
    });
    on<SumReportGET_flush>((event, emit) {
      return _SumReportGET_flush(datauoutraw(), emit);
    });
  }
  Future<void> _SumReportGET_GET(
      datauoutraw toAdd, Emitter<datauoutraw> emit) async {
    List<reportCSV> data = [];

    datauoutraw output = datauoutraw();

    FreeLoading(CsvPickerContext);

    final response = await Dio().post(
      server + "TOBEREPOR/GETDATA",
      data: {
        "DB": P01SumReportvar.DATABASE,
        "MATCP": P01SumReportvar.MAT,
        "STARTyear": P01SumReportvar.startDATEout.year.toString(),
        "STARTmonth": P01SumReportvar.startDATEout.month.toString(),
        "STARTday": P01SumReportvar.startDATEout.day.toString(),
        "ENDyear": P01SumReportvar.endDATEout.year.toString(),
        "ENDmonth": P01SumReportvar.endDATEout.month.toString(),
        "ENDday": P01SumReportvar.endDATEout.day.toString(),
        // "MATCP": "24006947",
        // "STARTyear": "2022",
        // "STARTmonth": "12",
        // "STARTday": "01",
        // "ENDyear": "2023",
        // "ENDmonth": "07",
        // "ENDday": "11",
      },
    );

    List<String> dataname = [
      'PO',
      'CUSTOMER',
      'PART',
      'PARTNAME',
      'FG_CHARG',
      'dateG',
    ];
    List<List<String>> datacsv = [];

//datadummy2
    // var input = dummydata;
    // var input = datadummy2;
    // print(input.length);
    if (response.statusCode == 200) {
      var databuff = response.data;
      var input = databuff;
      if (input.isNotEmpty) {
        var itemlist = input[0]['itemlist'];

        //------------------------------------------------------NAME
        output.itemlist = [];
        output.itemobject = {};
        // output.dataset = [];
        // output.upper = [];
        // output.data = [];
        // output.under = [];
        // output.datedata = {};

        for (var j = 0; j < itemlist.length; j++) {
          if (input[0][itemlist[j].toString()] != null) {
            output.itemlist.add(itemlist[j].toString());
            output.itemobject[itemlist[j].toString()] =
                '${input[0][itemlist[j].toString()]['name']}';

            if (input[0][itemlist[j].toString()]['RESULTFORMAT'].toString() ==
                'Number') {
              for (var k = 0;
                  k < input[0][itemlist[j].toString()]['data'].length;
                  k++) {
                int num = 1;
                for (var v = 0;
                    v < input[0][itemlist[j].toString()]['data'][k].length;
                    v++) {
                  if (v !=
                      input[0][itemlist[j].toString()]['data'][k].length - 1) {
                    dataname.add(
                        '${input[0][itemlist[j].toString()]['name']}(PIC${k + 1}-POINT${num})');
                  } else {
                    dataname.add(
                        '${input[0][itemlist[j].toString()]['name']}(PIC${k + 1}-MEAN)');
                  }

                  num++;
                }
              }
              dataname
                  .add('${input[0][itemlist[j].toString()]['name']}(ALL-MEAN)');
            }
            if (input[0][itemlist[j].toString()]['RESULTFORMAT'].toString() ==
                'Graph') {
              dataname.add('${input[0][itemlist[j].toString()]['name']}(X)');
              dataname.add('${input[0][itemlist[j].toString()]['name']}(Y)');
            }
            if (input[0][itemlist[j].toString()]['RESULTFORMAT'].toString() ==
                'OCR') {
              dataname.add('${input[0][itemlist[j].toString()]['name']}-P1');
              dataname.add('${input[0][itemlist[j].toString()]['name']}-P2');
              dataname.add('${input[0][itemlist[j].toString()]['name']}-P3');
              dataname.add('${input[0][itemlist[j].toString()]['name']}-P4');
            }
          }
        }

        //------------------------------------------------------NAME
        //------------------------------------------------------data
        for (var i = 0; i < input.length; i++) {
          // List<String> datacsvin = [];
          List<String> datacsvin = [
            input[i]['PO'].toString(),
            input[i]['CUSTOMER'].toString(),
            input[i]['PART'].toString(),
            input[i]['PARTNAME'].toString(),
            input[i]['FG_CHARG'].toString(),
            input[i]['dateG'].toString(),
          ];
          for (var j = 0; j < itemlist.length; j++) {
            if (input[i][itemlist[j].toString()] != null) {
              if (input[i][itemlist[j].toString()]['RESULTFORMAT'].toString() ==
                  'Number') {
                for (var k = 0;
                    k < input[i][itemlist[j].toString()]['data'].length;
                    k++) {
                  for (var v = 0;
                      v < input[i][itemlist[j].toString()]['data'][k].length;
                      v++) {
                    if (v !=
                        input[i][itemlist[j].toString()]['data'][k].length -
                            1) {
                      datacsvin.add(ConverstStr(
                          '${input[i][itemlist[j].toString()]['data'][k][v]}'));
                    } else {
                      datacsvin.add(ConverstStr(
                          '${input[i][itemlist[j].toString()]['data'][k][v]}'));
                    }
                  }
                }
                datacsvin
                    .add('${input[i][itemlist[j].toString()]['data_ans']}');
              } else if (input[i][itemlist[j].toString()]['RESULTFORMAT']
                      .toString() ==
                  'Graph') {
                // print("----------->");
                datacsvin.add(ConverstStr(
                    '${input[i][itemlist[j].toString()]['data_ans']['x']}'));
                datacsvin.add(ConverstStr(
                    '${input[i][itemlist[j].toString()]['data_ans']['y']}'));
              } else if (input[i][itemlist[j].toString()]['RESULTFORMAT']
                      .toString() ==
                  'OCR') {
                for (var k = 0;
                    k < input[i][itemlist[j].toString()]['data'].length;
                    k++) {
                  for (var v = 0;
                      v < input[i][itemlist[j].toString()]['data'][k].length;
                      v++) {
                    if (v !=
                        input[i][itemlist[j].toString()]['data'][k].length -
                            1) {
                      datacsvin.add(ConverstStr(
                          '${input[i][itemlist[j].toString()]['data'][k][v]}'));
                    } else {
                      datacsvin.add(ConverstStr(
                          '${input[i][itemlist[j].toString()]['data'][k][v]}'));
                    }
                  }
                }
              }
            }
          }

          // if (datacsvin.length == dataname.length) {
          datacsv.add(datacsvin);
          // }
        }

        // print(datacsv);
        //------------------------------------------------------data
        // print(dataname.length);
        // print(datacsv.length);
        // print(datacsv);

        //------------------------------------------------------make csv
        List<dynamic> row = [];
        List<List<dynamic>> rows = [];
        for (var s = 0; s < dataname.length; s++) {
          row.add(dataname[s]);
        }

        rows.add(row);

        for (var i = 0; i < datacsv.length; i++) {
          List<dynamic> rowin = [];
          for (var j = 0; j < datacsv[i].length; j++) {
            rowin.add(datacsv[i][j]);
          }
          rows.add(rowin);
        }

        String datetada = "${selectedDate.toLocal()}".split(' ')[0];
        String csv = const ListToCsvConverter().convert(rows);
        AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
          ..setAttribute("download",
              "${P01SumReportvar.MAT}-(${P01SumReportvar.startDATEout.year}-${P01SumReportvar.startDATEout.month}-${P01SumReportvar.startDATEout.day})-(${P01SumReportvar.endDATEout.year}-${P01SumReportvar.endDATEout.month}-${P01SumReportvar.endDATEout.day}).csv")
          ..click();
        //------------------------------------------------------make csv
      }
    }

    print(output.itemobject);

    Navigator.pop(CsvPickerContext);

    emit(output);
  }

  Future<void> _SumReportGET_flush(
      datauoutraw toAdd, Emitter<datauoutraw> emit) async {
    datauoutraw output = datauoutraw(itemobject: {});
    emit(output);
  }
}

ExpCSV(List<reportCSV> data) {
  List<List<dynamic>> rows = [];

  for (int i = -1; i < data.length; i++) {
    List<dynamic> row = [];
    if (i == -1) {
      row.add('PO');
      row.add('CP');
      row.add('DATE');
      row.add('TPKLOT');
      row.add('CUSTNAME');
      row.add('CUSLOTNO');
      row.add('PART');
      row.add('PARTNAME');
      row.add('MATERIAL');
      row.add('QUANTITY');
      row.add('Appearance for Rust');
      row.add('Appearance for Black stain');
      row.add('Appearance for Contaminant');
      row.add('Water wet ability');
      row.add('Remain of CN on part');
      row.add('Surface Hardness');
      row.add('Surface Hardness');
      row.add('Surface Hardness');
      row.add('Surface Roughness');
      row.add('Surface Roughness');
      row.add('Surface Roughness');
      row.add('Compound Layer');
      row.add('Compound Layer');
      row.add('Compound Layer');
      row.add('Porous Thickness');
      row.add('Porous Thickness');
      row.add('Porous Thickness');

      //F73
    } else {
      row.add(data[i].PO);
      row.add(data[i].CP);
      row.add(data[i].F21);
      row.add(data[i].F28);
      row.add(data[i].F22);
      row.add(data[i].F23);
      row.add(data[i].F24);
      row.add(data[i].F25);
      row.add(data[i].F26);
      row.add(data[i].F27);
      row.add(data[i].F01);
      row.add(data[i].F02);
      row.add(data[i].F03);
      row.add(data[i].F04);
      row.add(data[i].F05);
      row.add(data[i].F09);
      row.add(data[i].F10);
      row.add(data[i].F11);
      row.add(data[i].F06);
      row.add(data[i].F07);
      row.add(data[i].F08);
      //
      row.add(data[i].F12);
      row.add(data[i].F13);
      row.add(data[i].F14);
      row.add(data[i].F15);
      row.add(data[i].F16);
      row.add(data[i].F17);
    }

    rows.add(row);
  }
  String datetada = "${selectedDate.toLocal()}".split(' ')[0];
  String csv = const ListToCsvConverter().convert(rows);
  AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
    ..setAttribute("download", "test ${datetada}.csv")
    ..click();
}

class datauoutraw {
  datauoutraw({
    this.itemlist = const [],
    this.itemobject = const {},
    // this.dataset = const [],
    // this.upper = const [],
    // this.data = const [],
    // this.under = const [],
    // this.datedata = const {},
  });

  Map<String, String> itemobject;
  List<String> itemlist;
  // List<datainlist> dataset;
  // List<FlSpot> data;
  // List<FlSpot> under;
  // Map<String, String>? datedata;
}

// class datainlist {
//   datainlist({
//     this.itemid = '',
//     this.item = '',
//     this.upper = const [],
//     this.data = const [],
//     this.under = const [],
//     this.datedata = const {},
//   });

//   String itemid;
//   String item;
//   List<FlSpot> upper;
//   List<FlSpot> data;
//   List<FlSpot> under;
//   Map<String, String>? datedata;
// }
