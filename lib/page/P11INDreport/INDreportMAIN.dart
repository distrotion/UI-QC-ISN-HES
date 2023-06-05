import 'dart:convert';
import 'dart:html';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/11-01-ReportCSV.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../widget/common/Advancedropdown.dart';
import 'INDreportVAR.dart';

DateTime selectedDate = DateTime.now();

late BuildContext CsvPickerContext;

class CsvPicker extends StatefulWidget {
  CsvPicker({Key? key, this.dataACT}) : super(key: key);

  dataoutCSV? dataACT;

  @override
  State<CsvPicker> createState() => _CsvPickerState();
}

class _CsvPickerState extends State<CsvPicker> {
  @override
  Widget build(BuildContext context) {
    CsvPickerContext = context;
    // Future<void> _selectDate(BuildContext context) async {
    //   final DateTime? picked = await showDatePicker(
    //       context: context,
    //       initialDate: selectedDate,
    //       firstDate: DateTime(2015, 8),
    //       lastDate: DateTime(2101));
    //   if (picked != null && picked != selectedDate)
    //     setState(() {
    //       selectedDate = picked;
    //       // print(selectedDate);
    //     });
    // }

    // print(dataACT.length);
    dataoutCSV _data = widget.dataACT ?? dataoutCSV(data: []);

    if (_data.name == "ACT") {
      ExpCSV(_data.data);
      context.read<ReportCSV_Bloc>().add(ReportACT_flush());
    } else if (_data.name == "NISHINBO") {
      ExpCSV2(_data.data);
      context.read<ReportCSV_Bloc>().add(ReportACT_flush());
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Row(
              children: [
                // InkWell(
                //   onTap: () {
                //     // _selectDate(context);
                //   },
                //   child: SizedBox(
                //     height: 50,
                //     width: 100,
                //     child: Center(
                //         child: Text("${selectedDate.toLocal()}".split(' ')[0])),
                //   ),
                // ),
                const SizedBox(
                  width: 100,
                ),
                SizedBox(
                  width: 100,
                  height: 64,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        height: 40,
                        child: Center(
                          child: Text("Select report"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: AdvanceDropDown(
                    sLabel: "YEAR",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: const [
                      MapEntry("", ""),
                      MapEntry("2022", "2022"),
                      MapEntry("2023", "2023"),
                      MapEntry("2024", "2024"),
                      MapEntry("2025", "2025"),
                    ],
                    onChangeinside: (d, v) {
                      setState(() {
                        INDreportVAR.YEAR = d;
                      });
                    },
                    value: INDreportVAR.YEAR,
                    height: 40,
                    width: 100,
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: AdvanceDropDown(
                    sLabel: "MONTH",
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: const [
                      MapEntry("", ""),
                      MapEntry("1", "1"),
                      MapEntry("2", "2"),
                      MapEntry("3", "3"),
                      MapEntry("4", "4"),
                      MapEntry("5", "5"),
                      MapEntry("6", "6"),
                      MapEntry("7", "7"),
                      MapEntry("8", "8"),
                      MapEntry("9", "9"),
                      MapEntry("10", "10"),
                      MapEntry("11", "11"),
                      MapEntry("12", "12"),
                    ],
                    onChangeinside: (d, v) {
                      setState(() {
                        INDreportVAR.MONTH = d;
                      });
                    },
                    value: INDreportVAR.MONTH,
                    height: 40,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 100,
              ),
              Container(
                color: Colors.blue,
                height: 40,
                width: 300,
                child: InkWell(
                    child: const Center(
                      child: Text(
                        "Export ACT",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        // ExpCSV(dataACT);
                        context.read<ReportCSV_Bloc>().add(ReportACT_GET());
                      });
                    }),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 100,
              ),
              Container(
                color: Colors.green,
                height: 40,
                width: 300,
                child: InkWell(
                    child: const Center(
                      child: Text(
                        "Export NISHINBO",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        // ExpCSV(dataACT);
                        context
                            .read<ReportCSV_Bloc>()
                            .add(ReportNISHINBO_GET());
                      });
                    }),
              ),
            ],
          ),
          // TableCsvPreview(data: widget.datatable ?? [])
        ],
      ),
    );
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
    ..setAttribute("download", "ISN-ACT-DATA ${datetada}.csv")
    ..click();
}

ExpCSV2(List<reportCSV> data) {
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
      row.add('Appearance for Contaminant');

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
      row.add(data[i].F06);
      row.add(data[i].F07);
      row.add(data[i].F08);
      row.add(data[i].F09);
      row.add(data[i].F10);
      row.add(data[i].F11);
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
    ..setAttribute("download", "ISN-NISHINBO-DATA ${datetada}.csv")
    ..click();
}
