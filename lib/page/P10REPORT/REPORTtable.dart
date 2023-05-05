import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:js' as js;

import '../../bloc/BlocEvent/10-01-REPORT.dart';
import '../../bloc/BlocEvent/10-02-REPORT-CALL.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../model/model.dart';
import '../../styles/TextStyle.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Freescroll.dart';
import '../../widget/common/Loading.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P31ReportPDFcommon/ReportPDFCommonvar.dart';
import '../P32ReportPDFACT/ReportPDFACTvar.dart';
import '../P33ReportPDFTEST/ReportPDFTESTvar.dart';
import '../Page32.dart';
import '../page31.dart';
import '../page33.dart';
import 'REPORTvar.dart';

late BuildContext REPORTuiMAINcontext;

class _REPORTuiVAR {
  static String searchResult = '';
}

class REPORTuiMAIN extends StatelessWidget {
  REPORTuiMAIN({Key? key, this.data}) : super(key: key);
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Page10BlocTableCALL(
      data: data,
    );
  }
}

class Page10BlocTableCALL extends StatelessWidget {
  Page10BlocTableCALL({Key? key, this.data}) : super(key: key);
  List<dataset>? data;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => REPORT_CALL_Bloc(),
        child: BlocBuilder<REPORT_CALL_Bloc, String>(
          builder: (context, ret) {
            return REPORTuiBODY(
              data: data,
              ret: ret,
            );
          },
        ));
  }
}

class REPORTuiBODY extends StatefulWidget {
  REPORTuiBODY({Key? key, this.data, this.ret}) : super(key: key);
  List<dataset>? data;
  String? ret;

  @override
  _REPORTuiBODYState createState() => _REPORTuiBODYState();
}

class _REPORTuiBODYState extends State<REPORTuiBODY> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    context.read<REPORT_Bloc>().add(REPORT_GET());
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScrollController controllerReport = ScrollController();
    REPORTuiMAINcontext = context;
    final _MyData _data = _MyData(context, widget.data ?? []);

    void _sort<T>(Comparable<T> Function(dataset d) getField, int columnIndex,
        bool ascending) {
      _data._sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

    if (widget.ret == 'get') {
      //

      if (REPORTvar.reportTYPE == 0) {
        js.context.callMethod('open', [
          'http://172.20.30.46/ReportServer?%2fReport+Project4%2fHESISN-STD&rs:Format=PDF&rs:Command=Render&PO=${REPORTvar.PO}'
        ]);
        context.read<REPORT_CALL_Bloc>().add(REPORT_CALL_FLUSH());
        widget.ret = '';
        // REPORTvar.PO = '';
        REPORTvar.reportTYPE = 0;
      } else if (REPORTvar.reportTYPE == 2) {
        js.context.callMethod('open', [
          'http://172.20.30.46/ReportServer?%2fReport+Project4%2fHESISN-ACTN&rs:Format=PDF&rs:Command=Render&PO=${REPORTvar.PO}'
        ]);
        context.read<REPORT_CALL_Bloc>().add(REPORT_CALL_FLUSH());
        widget.ret = '';
        // REPORTvar.PO = '';
        REPORTvar.reportTYPE = 0;
      } else {
        js.context.callMethod('open', [
          'http://172.20.30.46/ReportServer?%2fReport+Project4%2fHESISN-COMMON1&rs:Format=PDF&rs:Command=Render&PO=${REPORTvar.PO}'
        ]);
        context.read<REPORT_CALL_Bloc>().add(REPORT_CALL_FLUSH());
        widget.ret = '';
        // REPORTvar.PO = '';
        REPORTvar.reportTYPE = 0;
      }
    }

    if (widget.ret == 'R_OK') {
      setState(() {});
      context.read<REPORT_CALL_Bloc>().add(REPORT_CALL_FLUSH());
      context.read<REPORT_Bloc>().add(REPORT_GET());
    }

    if (widget.ret == 'C_OK') {
      context.read<REPORT_CALL_Bloc>().add(REPORT_CALL_FLUSH());
      BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
          "Success", "PO have returned", enumNotificationlist.Success);
    } else if (widget.ret == 'C_NOK') {
      context.read<REPORT_CALL_Bloc>().add(REPORT_CALL_FLUSH());
      BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
          "Error", "PO have problem", enumNotificationlist.Error);
    }

    return SingleChildScrollView(
      child: SizedBox(
        width: 1200,
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.search),
                title: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: (value) {
                      setState(() {
                        _REPORTuiVAR.searchResult = value;
                      });
                    }),
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      controller.clear();
                      _REPORTuiVAR.searchResult = '';
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 1200,
                  child: Scrollbar(
                    controller: controllerReport,
                    thumbVisibility: true,
                    interactive: true,
                    thickness: 10,
                    radius: const Radius.circular(20),
                    child: PaginatedDataTable(
                      controller: controllerReport,
                      source: _data,
                      header: Row(
                        children: [
                          const Text('ISN REPORT'),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 2, end: 2, top: 10, bottom: 10),
                            child: InkWell(
                              onTap: () {
                                WORNINGpop(context, "Please clear cookies ");
                                context
                                    .read<REPORT_CALL_Bloc>()
                                    .add(REPORT_CALL_RESET());
                              },
                              child: Container(
                                width: 100,
                                color: Colors.red,
                                child: const Center(
                                  child: Text(
                                    "RESET REPORT",
                                    style: TxtStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      columns: [
                        // DataColumn(
                        //     label: const Text('ID'),
                        //     onSort: (int columnIndex, bool ascending) => _sort<num>(
                        //         (dataset d) => d.id, columnIndex, ascending)),
                        DataColumn(
                            label: const Text('PO'),
                            onSort: (int columnIndex, bool ascending) =>
                                _sort<String>((dataset d) => d.f01, columnIndex,
                                    ascending)),
                        DataColumn(
                            label: const Text('CP'),
                            onSort: (int columnIndex, bool ascending) =>
                                _sort<String>((dataset d) => d.f02, columnIndex,
                                    ascending)),
                        DataColumn(
                            label: const Text('CUSTOMER'),
                            onSort: (int columnIndex, bool ascending) =>
                                _sort<String>((dataset d) => d.f03, columnIndex,
                                    ascending)),
                        DataColumn(
                            label: const Text('PART'),
                            onSort: (int columnIndex, bool ascending) =>
                                _sort<String>((dataset d) => d.f04, columnIndex,
                                    ascending)),
                        DataColumn(
                            label: const Text('PARTNAME'),
                            onSort: (int columnIndex, bool ascending) =>
                                _sort<String>((dataset d) => d.f05, columnIndex,
                                    ascending)),
                        DataColumn(
                            label: const Text('ACTION'),
                            onSort: (int columnIndex, bool ascending) =>
                                _sort<String>((dataset d) => d.f05, columnIndex,
                                    ascending)),
                      ],
                      columnSpacing: 100,
                      horizontalMargin: 10,
                      rowsPerPage: 5,
                      sortColumnIndex: _sortColumnIndex,
                      sortAscending: _sortAscending,
                      showCheckboxColumn: false,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: 1200,
              child: Center(
                child: Row(
                  children: [
                    //

                    ComInputText(
                      sLabel: "original",
                      height: 40,
                      width: 120,
                      isContr: REPORTvar.iscontrol,
                      fnContr: (input) {
                        setState(() {
                          REPORTvar.iscontrol = input;
                        });
                      },
                      sValue: REPORTvar.original,
                      returnfunc: (String s) {
                        REPORTvar.original = s;
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ComInputText(
                      sLabel: "newreport",
                      height: 40,
                      width: 120,
                      isContr: REPORTvar.iscontrol,
                      fnContr: (input) {
                        setState(() {
                          REPORTvar.iscontrol = input;
                        });
                      },
                      sValue: REPORTvar.newreport,
                      returnfunc: (String s) {
                        REPORTvar.newreport = s;
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        //
                        print("object");
                        context.read<REPORT_CALL_Bloc>().add(REPORT_COPPY());
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        color: Colors.blue,
                        child: const Center(
                            child: Text(
                          "COPY",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: 1200,
              child: Row(
                children: [
                  ComInputText(
                    sLabel: "Recall order",
                    height: 40,
                    width: 120,
                    isContr: REPORTvar.iscontrol,
                    fnContr: (input) {
                      setState(() {
                        REPORTvar.iscontrol = input;
                      });
                    },
                    sValue: REPORTvar.recall,
                    returnfunc: (String s) {
                      REPORTvar.recall = s;
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      //

                      context.read<REPORT_CALL_Bloc>().add(DATA_RECAL());
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      color: Colors.blue,
                      child: const Center(
                          child: Text(
                        "RECALL",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      //

                      context.read<REPORT_CALL_Bloc>().add(DATA_RECAL_CLEAR());
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      color: Colors.red,
                      child: const Center(
                          child: Text(
                        "CLEAR RECALL",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// The "soruce" of the table
class _MyData extends DataTableSource {
  // Generate some made-up data
  final BuildContext context;
  late List<dataset> _data;
  late List<dataset> input;
  List<dataset> _data_exp = [];

  int _selectedCount = 0;
  _MyData.empty(this.context) {
    _data = [];
  }
  _MyData(this.context, this.input) {
    _data = input;
    _data_exp = [];

    for (int i = 0; i < _data.length; i++) {
      if (_data[i].f01.contains(_REPORTuiVAR.searchResult) ||
          _data[i].f02.contains(_REPORTuiVAR.searchResult) ||
          _data[i].f03.contains(_REPORTuiVAR.searchResult) ||
          _data[i].f04.contains(_REPORTuiVAR.searchResult) ||
          _data[i].f05.contains(_REPORTuiVAR.searchResult)) {
        _data_exp.add(_data[i]);
      }
    }
  }

  void _sort<T>(Comparable<T> Function(dataset d) getField, bool ascending) {
    _data.sort((dataset a, dataset b) {
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data_exp.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    final dataset data = _data_exp[index];

    return DataRow.byIndex(
        index: index,
        selected: data.selected,
        onSelectChanged: (value) {
          if (data.selected != value) {
            //function
          }
        },
        cells: [
          // DataCell(Text(data.id.toString())),
          DataCell(Text(data.f01)),
          DataCell(Text(data.f02)),
          DataCell(Text(data.f03)),
          DataCell(Text(data.f04)),
          DataCell(Text(data.f05)),
          DataCell(Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    ReportPDFTESTvar.PO = data.f01;
                    NEWreport(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 100,
                      color: Colors.pink,
                      child: const Center(
                          child: Text(
                        "STD test",
                        style: TxtStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // onLoadingFAKE(context);
                    // REPORTvar.reportTYPE = 0;
                    // REPORTvar.PO = data.f01;
                    // context.read<REPORT_CALL_Bloc>().add(REPORT_CALL());
                    ReportPDFCommonvar.PO = data.f01;
                    STDreport(context);
                  },
                  child: Container(
                    color: Colors.blue,
                    child: const Center(
                        child: Text(
                      "REPORT",
                      style: TxtStyle(color: Colors.white),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // onLoadingFAKE(context);
                    // REPORTvar.reportTYPE = 2;
                    // REPORTvar.PO = data.f01;
                    // context.read<REPORT_CALL_Bloc>().add(REPORT_CALL());
                    ReportPDFACTvar.PO = data.f01;
                    ACTreport(context);
                  },
                  child: Container(
                    width: 50,
                    color: Colors.orange,
                    child: const Center(
                        child: Text(
                      "ACT",
                      style: TxtStyle(color: Colors.white),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // onLoadingFAKE(context);
                    REPORTvar.reportTYPE = 1;
                    REPORTvar.PO = data.f01;
                    context.read<REPORT_CALL_Bloc>().add(REPORT_CALL());
                  },
                  child: Container(
                    color: Colors.black,
                    child: const Center(
                        child: Text(
                      "COMMON",
                      style: TxtStyle(color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          )),
        ]);
  }
}

void ACTreport(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
            height: 1000,
            width: 1500,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Page32(),
                ))),
      );
    },
  );
}

void STDreport(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          height: 1000,
          width: 1500,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Page31(),
            ),
          ),
        ),
      );
    },
  );
}

void NEWreport(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
            height: 1000,
            width: 1500,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Page33(),
                ))),
      );
    },
  );
}
