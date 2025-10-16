// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';

import '../../bloc/BlocEvent/P303-01-P303QMMASTERQCget.dart';
import '../../bloc/BlocEvent/P303-02-P303QMMASTERQCINSP_SPEC.dart';

import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Calendarwid.dart';
import '../../widget/common/ComInputText.dart';

import '../../widget/common/ErrorPopup.dart';
import '../../widget/common/Error_NO_Popup.dart';
import '../../widget/common/Safty.dart';
import '../../widget/common/popup.dart';
import '../../widget/newtable/INSP_SPECtable.dart';
import '../../widget/newtable/QMMAASTERQCtable.dart';

import 'P303QMMASTERQCVAR.dart';

late BuildContext P303QMMASTERQCMAINcontext;
late BuildContext P303QMMASTERQCMAINcontextpop1;

class P303QMMASTERQCMAIN extends StatefulWidget {
  P303QMMASTERQCMAIN({
    super.key,
    this.data,
  });
  List<P303QMMASTERQCgetclass>? data;

  @override
  State<P303QMMASTERQCMAIN> createState() => _P303QMMASTERQCMAINState();
}

class _P303QMMASTERQCMAINState extends State<P303QMMASTERQCMAIN> {
  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    // var now = DateTime.now().subtract(Duration(days: 15));
    // P303QMMASTERQCVAR.formattedDate = DateFormat('dd-MM-yy').format(now);
    if (P303QMMASTERQCVAR.SETDAY == '') {
      P303QMMASTERQCVAR.day = DateFormat('dd').format(now);
      P303QMMASTERQCVAR.month = DateFormat('MM').format(now);
      P303QMMASTERQCVAR.year = DateFormat('yyyy').format(now);
      P303QMMASTERQCVAR.SEARCH = '';
    }

    P303QMMASTERQCVAR.day_next = DateFormat('dd').format(now);
    P303QMMASTERQCVAR.month_next = DateFormat('MM').format(now);
    P303QMMASTERQCVAR.year_next = DateFormat('yyyy').format(now);

    // P303QMMASTERQCVAR.day_next = "05";
    // P303QMMASTERQCVAR.month_next = "04";
    // P303QMMASTERQCVAR.year_next = "2025";

    P303QMMASTERQCVAR.PLANT = "2100";
    P303QMMASTERQCVAR.LOT_ORI = "03";

    P303QMMASTERQCVAR.iscontrol = true;

    P303QMMASTERQCVAR.holding = 999;
    context.read<P303QMMASTERQCget_Bloc>().add(P303QMMASTERQCget_GET());
  }

  @override
  Widget build(BuildContext context) {
    P303QMMASTERQCMAINcontext = context;
    List<P303QMMASTERQCgetclass> _datain = widget.data ?? [];
    List<P303QMMASTERQCgetclass> _datasearch = [];

    List<P303QMMASTERQCgetclass> _data_exp = [];

    for (int i = 0; i < _datain.length; i++) {
      if (_datain[i].PROCESS_ORDER.contains(P303QMMASTERQCVAR.SEARCH) ||
          _datain[i].MATERIAL.contains(P303QMMASTERQCVAR.SEARCH) ||
          _datain[i].MAT_DESC.contains(P303QMMASTERQCVAR.SEARCH) ||
          _datain[i].OLD_MAT.contains(P303QMMASTERQCVAR.SEARCH) ||
          _datain[i].BATCH.contains(P303QMMASTERQCVAR.SEARCH)) {
        _data_exp.add(_datain[i]);
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                          width: 200,
                          // child: Icon(
                          //   Icons.arrow_back_ios,
                          //   size: 40,
                          //   color: Colors.blue,
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: const [
                          Colors.blueAccent,
                          Colors.lightBlueAccent
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        'SELECT OPERATION PROGRESS',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // MainBodyContext.read<ChangePage_Bloc>()
                          //     .ChangePage_nodrower('', Page1());
                        },
                        child: SizedBox(
                          width: 200,
                          // child: Icon(
                          //   Icons.arrow_back_ios,
                          //   size: 40,
                          //   color: Colors.blue,
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    // width: 900,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      border: Border(
                        top: BorderSide(),
                        left: BorderSide(),
                        right: BorderSide(),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "บริษัท ไทยปาร์คเกอร์ไรซิ่ง จำกัด",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    // width: 900,
                    decoration: BoxDecoration(
                      // color: Colors.blue.shade900,
                      border: Border(
                        top: BorderSide(),
                        left: BorderSide(),
                        right: BorderSide(),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Incoming Table",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      DateTime calendaset = DateTime.now();
                      //
                      CalendaSelectDates(context, calendaset,
                          (day, month, year) {
                        //
                        P303QMMASTERQCVAR.day = day;
                        P303QMMASTERQCVAR.month = month;
                        P303QMMASTERQCVAR.year = year;

                        setState(() {});
                        context
                            .read<P303QMMASTERQCget_Bloc>()
                            .add(P303QMMASTERQCget_GET());
                      });
                    },
                    child: Container(
                      height: 30,
                      // width: 900,
                      decoration: BoxDecoration(
                        // color: Colors.blue.shade900,
                        border: Border(
                          top: BorderSide(),
                          left: BorderSide(),
                          right: BorderSide(),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "วันที่ : ${P303QMMASTERQCVAR.day}-${P303QMMASTERQCVAR.month}-${P303QMMASTERQCVAR.year}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      DateTime calendaset = DateTime.now();
                      //
                      CalendaSelectDates(context, calendaset,
                          (day, month, year) {
                        //
                        P303QMMASTERQCVAR.day_next = day;
                        P303QMMASTERQCVAR.month_next = month;
                        P303QMMASTERQCVAR.year_next = year;

                        setState(() {});
                        context
                            .read<P303QMMASTERQCget_Bloc>()
                            .add(P303QMMASTERQCget_GET());
                      });
                    },
                    child: Container(
                      height: 30,
                      // width: 900,
                      decoration: BoxDecoration(
                        // color: Colors.blue.shade900,
                        border: Border(
                          top: BorderSide(),
                          left: BorderSide(),
                          right: BorderSide(),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "ถึงวันที่ : ${P303QMMASTERQCVAR.day_next}-${P303QMMASTERQCVAR.month_next}-${P303QMMASTERQCVAR.year_next}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    // width: 900,
                    decoration: BoxDecoration(
                      // color: Colors.blue.shade900,
                      border: Border(
                        top: BorderSide(),
                        left: BorderSide(),
                        right: BorderSide(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: ComInputText(
                          height: 40,
                          width: 500,
                          isContr: P303QMMASTERQCVAR.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              P303QMMASTERQCVAR.iscontrol = input;
                            });
                          },
                          sPlaceholder: "search",
                          sValue: P303QMMASTERQCVAR.SEARCH,
                          returnfunc: (String s) {
                            setState(() {
                              P303QMMASTERQCVAR.SEARCH = s;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  QMMAASTERQCtable(),
                  // if (_datasearch
                  //     .any((item) => item.PLANT == 'noxrust'))
                  SizedBox(
                    height: 500,
                    child: SingleChildScrollView(
                      child: Container(
                        // width: 1100,
                        child: Column(
                          children: [
                            for (int i = 0; i < _data_exp.length; i++) ...[
                              // for (int i = 0; i < 10; i++) ...[
                              InkWell(
                                onTap: () {
                                  //
                                  P303QMMASTERQCVAR.pagepop = 0;
                                  P303QMMASTERQCVAR.INSP_LOTset =
                                      _data_exp[i].INSP_LOT;
                                  P303QMMASTERQCVAR.TO_UR =
                                      _data_exp[i].INSP_QTY;

                                  P303QMMASTERQCVAR.PROCESS_ORDERset =
                                      _data_exp[i].PROCESS_ORDER;

                                  P303QMMASTERQCVAR.TO_ALL =
                                      _data_exp[i].INSP_QTY;
                                  P303QMMASTERQCVAR.TO_BL = "";
                                  P303QMMASTERQCVAR.INSP_SPECdata = [];
                                  P303QMMASTERQCVAR.SELECTED_SETdata = [];
                                  P303QMMASTERQCVAR.UDCODEdata = [];

                                  _QMI003POP(context);
                                },
                                onHover: (v) {
                                  //
                                  // print(v.toString() + ":" + i.toString());
                                  setState(() {
                                    P303QMMASTERQCVAR.holding = i;
                                  });
                                },
                                child: QMMAASTERQCitem(
                                  holding: P303QMMASTERQCVAR.holding == i,
                                  text01: _data_exp[i].MATERIAL,
                                  text02: _data_exp[i].PROCESS_ORDER,
                                  text03: _data_exp[i].MAT_DESC,
                                  text04: _data_exp[i].OLD_MAT,
                                  text05: _data_exp[i].BATCH,
                                  text06: _data_exp[i].INSP_LOT,
                                  text07: _data_exp[i].INSP_QTY +
                                      ' ' +
                                      _data_exp[i].INSP_UOM,
                                  text08: _data_exp[i].INSP_LOT_STATUS,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _QMI003POP(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: QMI003POPBloc(),
      );
    },
  );
}

class QMI003POPBloc extends StatelessWidget {
  QMI003POPBloc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P303QMMASTERQCgetINSP_SPEC_Bloc(),
        child: BlocBuilder<P303QMMASTERQCgetINSP_SPEC_Bloc,
            P303QMMASTERQCgetINSP_SPECclassSET>(
          builder: (context, data) {
            return NEWNEWREQUEST(
              datain: data,
            );
          },
        ));
  }
}

class NEWNEWREQUEST extends StatefulWidget {
  NEWNEWREQUEST({
    super.key,
    this.datain,
  });
  P303QMMASTERQCgetINSP_SPECclassSET? datain;
  @override
  State<NEWNEWREQUEST> createState() => _NEWNEWREQUESTState();
}

class _NEWNEWREQUESTState extends State<NEWNEWREQUEST> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<P303QMMASTERQCgetINSP_SPEC_Bloc>()
        .add(P303QMMASTERQCgetINSP_SPEC_GET());
  }

  @override
  Widget build(BuildContext context) {
    P303QMMASTERQCMAINcontextpop1 = context;
    P303QMMASTERQCgetINSP_SPECclassSET _datain = widget.datain ??
        P303QMMASTERQCgetINSP_SPECclassSET(
          INSP_SPEC: [],
          SELECTED_SET: [],
          UDCODE: [],
        );

//INSP_LOT
    if (P303QMMASTERQCVAR.INSP_SPECdata.length == 0) {
      for (var i = 0; i < _datain.INSP_SPEC.length; i++) {
        //
        if (P303QMMASTERQCVAR.INSP_LOTset == _datain.INSP_SPEC[i].INSP_LOT) {
          P303QMMASTERQCVAR.INSP_SPECdata.add(PINSP_SPECHSclass(
            INSP_LOT: _datain.INSP_SPEC[i].INSP_LOT,
            NODE: _datain.INSP_SPEC[i].NODE,
            INSP_CHAR: _datain.INSP_SPEC[i].INSP_CHAR,
            INSP_STATUS: _datain.INSP_SPEC[i].INSP_STATUS,
            CONTROL_IND: _datain.INSP_SPEC[i].CONTROL_IND,
            CHAR_TYPE: _datain.INSP_SPEC[i].CHAR_TYPE,
            REC_TYPE: _datain.INSP_SPEC[i].REC_TYPE,
            MIC_PLANT: _datain.INSP_SPEC[i].MIC_PLANT,
            MIC: _datain.INSP_SPEC[i].MIC,
            MIC_VERSION: _datain.INSP_SPEC[i].MIC_VERSION,
            MIC_SHORTTEXT: _datain.INSP_SPEC[i].MIC_SHORTTEXT,
            METHOD_PLANT: _datain.INSP_SPEC[i].METHOD_PLANT,
            METHOD: _datain.INSP_SPEC[i].METHOD,
            METHOD_VERSION: _datain.INSP_SPEC[i].METHOD_VERSION,
            SELECTEDSET_IND: _datain.INSP_SPEC[i].SELECTEDSET_IND,
            CATALOGTYPE: _datain.INSP_SPEC[i].CATALOGTYPE,
            SLECTEDSET: _datain.INSP_SPEC[i].SLECTEDSET,
            SELECTEDSET_PLANT: _datain.INSP_SPEC[i].SELECTEDSET_PLANT,
            DECIMAL: _datain.INSP_SPEC[i].DECIMAL,
            UOM: _datain.INSP_SPEC[i].UOM,
            UPPER: _datain.INSP_SPEC[i].UPPER,
            UPPER_IND: _datain.INSP_SPEC[i].UPPER_IND,
            LOWER: _datain.INSP_SPEC[i].LOWER,
            LOWER_IND: _datain.INSP_SPEC[i].LOWER_IND,
            STUPPER: _datain.INSP_SPEC[i].STUPPER,
            STUPPER_IND: _datain.INSP_SPEC[i].STUPPER_IND,
            STLOWER: _datain.INSP_SPEC[i].STLOWER,
            STLOWER_IND: _datain.INSP_SPEC[i].STLOWER_IND,
          ));
        }
      }
    }
    return Container(
      height: 500,
      width: 800,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                child: Center(
                  child: Text("Quality control management"),
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              SingleChildScrollView(
                child: Container(
                  // width: 1100,
                  // height: 500,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ComInputText(
                              isEnabled: false,
                              height: 40,
                              width: 300,
                              isContr: P303QMMASTERQCVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  P303QMMASTERQCVAR.iscontrol = input;
                                });
                              },
                              sValue: P303QMMASTERQCVAR.TO_ALL,
                              returnfunc: (String s) {
                                P303QMMASTERQCVAR.TO_ALL = s;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ComInputText(
                              sLabel: "GOOD",
                              height: 40,
                              width: 300,
                              isContr: P303QMMASTERQCVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  P303QMMASTERQCVAR.iscontrol = input;
                                });
                              },
                              sValue: P303QMMASTERQCVAR.TO_UR,
                              returnfunc: (String s) {
                                P303QMMASTERQCVAR.TO_UR = s;
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ComInputText(
                              sLabel: "NO GOOD",
                              height: 40,
                              width: 300,
                              isContr: P303QMMASTERQCVAR.iscontrol,
                              fnContr: (input) {
                                setState(() {
                                  P303QMMASTERQCVAR.iscontrol = input;
                                });
                              },
                              sValue: P303QMMASTERQCVAR.TO_BL,
                              returnfunc: (String s) {
                                P303QMMASTERQCVAR.TO_BL = s;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: InkWell(
                                onTap: () {
                                  //ReportPDFCommonvar.PO
                                  _QCFN(context);
                                },
                                child: Container(
                                  color: Colors.yellow,
                                  height: 50,
                                  width: 100,
                                  child: const Center(
                                    child: Text("QCFN ONLY"),
                                  ),
                                ),
                              ),
                            ),
                            for (int i = 0; i < _datain.UDCODE.length; i++) ...[
                              if (int.parse(
                                      ConverstStr(P303QMMASTERQCVAR.TO_ALL)) ==
                                  int.parse(ConverstStr(
                                      P303QMMASTERQCVAR.TO_BL))) ...[
                                if (_datain.UDCODE[i].CODE == 'R1' ||
                                    _datain.UDCODE[i].CODE == 'R2') ...[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        if (int.parse(ConverstStr(
                                                P303QMMASTERQCVAR.TO_ALL)) ==
                                            (int.parse(ConverstStr(
                                                    P303QMMASTERQCVAR.TO_UR))) +
                                                (int.parse(ConverstStr(
                                                    P303QMMASTERQCVAR
                                                        .TO_BL)))) {
                                          Map<String, Map<String, String>>
                                              output = {
                                            "UD": {
                                              "INSPLOT":
                                                  P303QMMASTERQCVAR.INSP_LOTset,
                                              "UD_SELECTED_SET": "",
                                              "UD_PLANT": "",
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                              "TO_UR": "",
                                              "TO_BLOCKED": "",
                                              "TO_RETURN": ""
                                            },
                                            "UDTEMPSAVE": {
                                              "GOOD": P303QMMASTERQCVAR.TO_UR,
                                              "NGOOD": P303QMMASTERQCVAR.TO_BL,
                                              "PROCESS_ORDER": P303QMMASTERQCVAR
                                                  .PROCESS_ORDERset,
                                              "CODE_TEXT":
                                                  _datain.UDCODE[i].CODE_TEXT,
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                            }
                                          };

                                          Dio()
                                              .post(
                                            "${server2}QMINCOMING/UDSAVEQC",
                                            // "${'http://127.0.0.1:14094/'}QMINCOMING/UDSAVEQC",
                                            data: output,
                                          )
                                              .then((v) {
                                            // Navigator.pop(context);
                                            // P303QMMASTERQCMAINcontext.read<
                                            //         P303QMMASTERQCget_Bloc>()
                                            //     .add(P303QMMASTERQCget_GET());
                                            // //
                                            print(v.data);
                                            if (v.data.length > 0) {
                                              if (v.data[0]['TYPE'] != null) {
                                                if (v.data[0]['TYPE']
                                                        .toString() ==
                                                    'E') {
                                                  showErrorPopup(
                                                      P303QMMASTERQCMAINcontext,
                                                      v.data.toString());
                                                } else {
                                                  showGoodPopup(
                                                      P303QMMASTERQCMAINcontext,
                                                      v.data.toString());
                                                }
                                              }
                                            }
                                            // Dio().post(
                                            //   "${server2}10GETDATAFROMJOBBINGAQC/QCFN",
                                            //   // "${'http://127.0.0.1:14094/'}10GETDATAFROMJOBBINGAQC/QCFN",
                                            //   data: {
                                            //     "BAPI_NAME": "ZFMPP_QCFN_IN",
                                            //     "ORDERID": P303QMMASTERQCVAR
                                            //         .PROCESS_ORDERset,
                                            //     "PERNR_ID": USERDATA.ID
                                            //   },
                                            // ).then((v) {
                                            //   Navigator.pop(context);
                                            //   P303QMMASTERQCMAINcontext.read<
                                            //           P303QMMASTERQCget_Bloc>()
                                            //       .add(P303QMMASTERQCget_GET());
                                            //   //
                                            //   print(v.data);
                                            //   // if (v.data['ExportParameter'] !=
                                            //   //     null) {
                                            //   //   if (v.data['ExportParameter']
                                            //   //               ['INACT_NEW']
                                            //   //           .toString() ==
                                            //   //       'E') {
                                            //   //     showErrorPopup(
                                            //   //         P303QMMASTERQCMAINcontext,
                                            //   //         v.data.toString());
                                            //   //   } else {
                                            //   //     showGoodPopup(
                                            //   //         P303QMMASTERQCMAINcontext,
                                            //   //         v.data.toString());
                                            //   //   }
                                            //   // } else {
                                            //   //   showErrorPopup(
                                            //   //       P303QMMASTERQCMAINcontext,
                                            //   //       v.data.toString());
                                            //   // }
                                            // });
                                          });
                                        } else {
                                          //
                                          WORNINGpop(
                                              context,
                                              ["", "QTY is not same"],
                                              120,
                                              200);
                                        }
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 400,
                                        color: Colors.red,
                                        child: Center(
                                          child: Text(
                                            _datain.UDCODE[i].CODE_TEXT,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ] else ...[
                                if (_datain.UDCODE[i].CODE == 'A1' &&
                                    int.parse(ConverstStr(
                                            P303QMMASTERQCVAR.TO_ALL)) ==
                                        int.parse(ConverstStr(
                                            P303QMMASTERQCVAR.TO_UR))) ...[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        if (int.parse(ConverstStr(
                                                P303QMMASTERQCVAR.TO_ALL)) ==
                                            (int.parse(ConverstStr(
                                                    P303QMMASTERQCVAR.TO_UR))) +
                                                (int.parse(ConverstStr(
                                                    P303QMMASTERQCVAR
                                                        .TO_BL)))) {
                                          Map<String, Map<String, String>>
                                              output = {
                                            "UD": {
                                              "INSPLOT":
                                                  P303QMMASTERQCVAR.INSP_LOTset,
                                              "UD_SELECTED_SET": "",
                                              "UD_PLANT": "",
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                              "TO_UR": "",
                                              "TO_BLOCKED": "",
                                              "TO_RETURN": ""
                                            },
                                            "UDTEMPSAVE": {
                                              "GOOD": P303QMMASTERQCVAR.TO_UR,
                                              "NGOOD": P303QMMASTERQCVAR.TO_BL,
                                              "PROCESS_ORDER": P303QMMASTERQCVAR
                                                  .PROCESS_ORDERset,
                                              "CODE_TEXT":
                                                  _datain.UDCODE[i].CODE_TEXT,
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                            }
                                          };

                                          Dio()
                                              .post(
                                            "${server2}QMINCOMING/UDSAVEQC",
                                            // "${'http://127.0.0.1:14094/'}QMINCOMING/UDSAVEQC",
                                            data: output,
                                          )
                                              .then((v) {
                                            // Navigator.pop(context);
                                            // P303QMMASTERQCMAINcontext.read<
                                            //         P303QMMASTERQCget_Bloc>()
                                            //     .add(P303QMMASTERQCget_GET());
                                            //
                                            // print(v.data);
                                            print(v.data);
                                            if (v.data.length > 0) {
                                              if (v.data[0]['TYPE'] != null) {
                                                if (v.data[0]['TYPE']
                                                        .toString() ==
                                                    'E') {
                                                  showErrorPopup(
                                                      P303QMMASTERQCMAINcontext,
                                                      v.data.toString());
                                                } else {
                                                  showGoodPopup(
                                                      P303QMMASTERQCMAINcontext,
                                                      v.data.toString());
                                                }
                                              }
                                            }
                                            // Dio().post(
                                            //   "${server2}10GETDATAFROMJOBBINGAQC/QCFN",
                                            //   // "${'http://127.0.0.1:14094/'}10GETDATAFROMJOBBINGAQC/QCFN",
                                            //   data: {
                                            //     "BAPI_NAME": "ZFMPP_QCFN_IN",
                                            //     "ORDERID": P303QMMASTERQCVAR
                                            //             .PROCESS_ORDERset
                                            //         .substring(2, 12),
                                            //     "PERNR_ID": USERDATA.ID
                                            //   },
                                            // ).then((v) {
                                            //   Navigator.pop(context);
                                            //   P303QMMASTERQCMAINcontext.read<
                                            //           P303QMMASTERQCget_Bloc>()
                                            //       .add(P303QMMASTERQCget_GET());
                                            //   //
                                            //   print(v.data);
                                            //   // if (v.data['ExportParameter'] !=
                                            //   //     null) {
                                            //   //   if (v.data['ExportParameter']
                                            //   //               ['INACT_NEW']
                                            //   //           .toString() ==
                                            //   //       'E') {
                                            //   //     showErrorPopup(
                                            //   //         P303QMMASTERQCMAINcontext,
                                            //   //         v.data.toString());
                                            //   //   } else {
                                            //   //     showGoodPopup(
                                            //   //         P303QMMASTERQCMAINcontext,
                                            //   //         v.data.toString());
                                            //   //   }
                                            //   // } else {
                                            //   //   showErrorPopup(
                                            //   //       P303QMMASTERQCMAINcontext,
                                            //   //       v.data.toString());
                                            //   // }
                                            // });
                                          });
                                        } else {
                                          //
                                          WORNINGpop(
                                              context,
                                              ["", "QTY is not same"],
                                              120,
                                              200);
                                        }
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 400,
                                        color: Colors.green,
                                        child: Center(
                                          child: Text(
                                            _datain.UDCODE[i].CODE_TEXT,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                if (_datain.UDCODE[i].CODE == 'A5' &&
                                    (int.parse(ConverstStr(
                                                P303QMMASTERQCVAR.TO_ALL)) !=
                                            int.parse(ConverstStr(
                                                P303QMMASTERQCVAR.TO_UR)) ||
                                        (int.parse(ConverstStr(
                                                P303QMMASTERQCVAR.TO_ALL)) !=
                                            int.parse(ConverstStr(
                                                P303QMMASTERQCVAR
                                                    .TO_BL))))) ...[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        if (int.parse(ConverstStr(
                                                P303QMMASTERQCVAR.TO_ALL)) ==
                                            (int.parse(ConverstStr(
                                                    P303QMMASTERQCVAR.TO_UR))) +
                                                (int.parse(ConverstStr(
                                                    P303QMMASTERQCVAR
                                                        .TO_BL)))) {
                                          Map<String, Map<String, String>>
                                              output = {
                                            "UD": {
                                              "INSPLOT":
                                                  P303QMMASTERQCVAR.INSP_LOTset,
                                              "UD_SELECTED_SET": "",
                                              "UD_PLANT": "",
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                              "TO_UR": "",
                                              "TO_BLOCKED": "",
                                              "TO_RETURN": ""
                                            },
                                            "UDTEMPSAVE": {
                                              "GOOD": P303QMMASTERQCVAR.TO_UR,
                                              "NGOOD": P303QMMASTERQCVAR.TO_BL,
                                              "PROCESS_ORDER": P303QMMASTERQCVAR
                                                  .PROCESS_ORDERset,
                                              "CODE_TEXT":
                                                  _datain.UDCODE[i].CODE_TEXT,
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                            }
                                          };

                                          Dio()
                                              .post(
                                            "${server2}QMINCOMING/UDSAVEQC",
                                            // "${'http://127.0.0.1:14094/'}QMINCOMING/UDSAVEQC",
                                            data: output,
                                          )
                                              .then((v) {
                                            // Navigator.pop(context);
                                            // P303QMMASTERQCMAINcontext.read<
                                            //         P303QMMASTERQCget_Bloc>()
                                            //     .add(P303QMMASTERQCget_GET());
                                            // //
                                            // print(v.data);
                                            print(v.data);
                                            if (v.data.length > 0) {
                                              if (v.data[0]['TYPE'] != null) {
                                                if (v.data[0]['TYPE']
                                                        .toString() ==
                                                    'E') {
                                                  showErrorPopup(
                                                      P303QMMASTERQCMAINcontext,
                                                      v.data.toString());
                                                } else {
                                                  showGoodPopup(
                                                      P303QMMASTERQCMAINcontext,
                                                      v.data.toString());
                                                }
                                              }
                                            }
                                            // Dio().post(
                                            //   "${server2}10GETDATAFROMJOBBINGAQC/QCFN",
                                            //   // "${'http://127.0.0.1:14094/'}10GETDATAFROMJOBBINGAQC/QCFN",
                                            //   data: {
                                            //     "BAPI_NAME": "ZFMPP_QCFN_IN",
                                            //     "ORDERID": P303QMMASTERQCVAR
                                            //         .PROCESS_ORDERset,
                                            //     "PERNR_ID": USERDATA.ID
                                            //   },
                                            // ).then((v) {
                                            //   Navigator.pop(context);
                                            //   P303QMMASTERQCMAINcontext.read<
                                            //           P303QMMASTERQCget_Bloc>()
                                            //       .add(P303QMMASTERQCget_GET());
                                            //   //
                                            //   print(v.data);
                                            //   // if (v.data['ExportParameter'] !=
                                            //   //     null) {
                                            //   //   if (v.data['ExportParameter']
                                            //   //               ['INACT_NEW']
                                            //   //           .toString() ==
                                            //   //       'E') {
                                            //   //     showErrorPopup(
                                            //   //         P303QMMASTERQCMAINcontext,
                                            //   //         v.data.toString());
                                            //   //   } else {
                                            //   //     showGoodPopup(
                                            //   //         P303QMMASTERQCMAINcontext,
                                            //   //         v.data.toString());
                                            //   //   }
                                            //   // } else {
                                            //   //   showErrorPopup(
                                            //   //       P303QMMASTERQCMAINcontext,
                                            //   //       v.data.toString());
                                            //   // }
                                            // });
                                          });
                                        } else {
                                          //
                                          WORNINGpop(
                                              context,
                                              ["", "QTY is not same"],
                                              120,
                                              200);
                                        }
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 400,
                                        color: Colors.yellowAccent,
                                        child: Center(
                                          child: Text(
                                            _datain.UDCODE[i].CODE_TEXT,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                if (_datain.UDCODE[i].CODE == 'R2' &&
                                    (int.parse(ConverstStr(
                                            P303QMMASTERQCVAR.TO_ALL)) !=
                                        int.parse(ConverstStr(
                                            P303QMMASTERQCVAR.TO_UR)))) ...[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        if (int.parse(ConverstStr(
                                                P303QMMASTERQCVAR.TO_ALL)) ==
                                            (int.parse(ConverstStr(
                                                    P303QMMASTERQCVAR.TO_UR))) +
                                                (int.parse(ConverstStr(
                                                    P303QMMASTERQCVAR
                                                        .TO_BL)))) {
                                          Map<String, Map<String, String>>
                                              output = {
                                            "UD": {
                                              "INSPLOT":
                                                  P303QMMASTERQCVAR.INSP_LOTset,
                                              "UD_SELECTED_SET": "",
                                              "UD_PLANT": "",
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                              "TO_UR": "",
                                              "TO_BLOCKED": "",
                                              "TO_RETURN": ""
                                            },
                                            "UDTEMPSAVE": {
                                              "GOOD": P303QMMASTERQCVAR.TO_UR,
                                              "NGOOD": P303QMMASTERQCVAR.TO_BL,
                                              "PROCESS_ORDER": P303QMMASTERQCVAR
                                                  .PROCESS_ORDERset,
                                              "CODE_TEXT":
                                                  _datain.UDCODE[i].CODE_TEXT,
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                            }
                                          };

                                          Dio()
                                              .post(
                                            "${server2}QMINCOMING/UDSAVEQC",
                                            // "${'http://127.0.0.1:14094/'}QMINCOMING/UDSAVEQC",
                                            data: output,
                                          )
                                              .then((v) {
                                            // Navigator.pop(context);
                                            // P303QMMASTERQCMAINcontext.read<
                                            //         P303QMMASTERQCget_Bloc>()
                                            //     .add(P303QMMASTERQCget_GET());
                                            //
                                            print(v.data);
                                            if (v.data.length > 0) {
                                              if (v.data[0]['TYPE'] != null) {
                                                if (v.data[0]['TYPE']
                                                        .toString() ==
                                                    'E') {
                                                  showErrorPopup(
                                                      P303QMMASTERQCMAINcontext,
                                                      v.data.toString());
                                                } else {
                                                  showGoodPopup(
                                                      P303QMMASTERQCMAINcontext,
                                                      v.data.toString());
                                                }
                                              }
                                            }
                                            // Dio().post(
                                            //   "${server2}10GETDATAFROMJOBBINGAQC/QCFN",
                                            //   // "${'http://127.0.0.1:14094/'}10GETDATAFROMJOBBINGAQC/QCFN",
                                            //   data: {
                                            //     "BAPI_NAME": "ZFMPP_QCFN_IN",
                                            //     "ORDERID": P303QMMASTERQCVAR
                                            //         .PROCESS_ORDERset,
                                            //     "PERNR_ID": USERDATA.ID
                                            //   },
                                            // ).then((v) {
                                            //   Navigator.pop(context);
                                            //   P303QMMASTERQCMAINcontext.read<
                                            //           P303QMMASTERQCget_Bloc>()
                                            //       .add(P303QMMASTERQCget_GET());
                                            //   //
                                            //   print(v.data);
                                            //   // if (v.data['ExportParameter'] !=
                                            //   //     null) {
                                            //   //   if (v.data['ExportParameter']
                                            //   //               ['INACT_NEW']
                                            //   //           .toString() ==
                                            //   //       'E') {
                                            //   //     showErrorPopup(
                                            //   //         P303QMMASTERQCMAINcontext,
                                            //   //         v.data.toString());
                                            //   //   } else {
                                            //   //     showGoodPopup(
                                            //   //         P303QMMASTERQCMAINcontext,
                                            //   //         v.data.toString());
                                            //   //   }
                                            //   // } else {
                                            //   //   showErrorPopup(
                                            //   //       P303QMMASTERQCMAINcontext,
                                            //   //       v.data.toString());
                                            //   // }
                                            // });
                                          });
                                        } else {
                                          //
                                          WORNINGpop(
                                              context,
                                              ["", "QTY is not same"],
                                              120,
                                              200);
                                        }
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 400,
                                        color: Colors.orange,
                                        child: Center(
                                          child: Text(
                                            _datain.UDCODE[i].CODE_TEXT,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                if (_datain.UDCODE[i].CODE == 'A6' &&
                                    (int.parse(ConverstStr(
                                            P303QMMASTERQCVAR.TO_ALL)) !=
                                        int.parse(ConverstStr(
                                            P303QMMASTERQCVAR.TO_UR)))) ...[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        if (int.parse(ConverstStr(
                                                P303QMMASTERQCVAR.TO_ALL)) ==
                                            (int.parse(ConverstStr(
                                                    P303QMMASTERQCVAR.TO_UR))) +
                                                (int.parse(ConverstStr(
                                                    P303QMMASTERQCVAR
                                                        .TO_BL)))) {
                                          Map<String, Map<String, String>>
                                              output = {
                                            "UD": {
                                              "INSPLOT":
                                                  P303QMMASTERQCVAR.INSP_LOTset,
                                              "UD_SELECTED_SET": "",
                                              "UD_PLANT": "",
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                              "TO_UR": "",
                                              "TO_BLOCKED": "",
                                              "TO_RETURN": ""
                                            },
                                            "UDTEMPSAVE": {
                                              "GOOD": P303QMMASTERQCVAR.TO_UR,
                                              "NGOOD": P303QMMASTERQCVAR.TO_BL,
                                              "PROCESS_ORDER": P303QMMASTERQCVAR
                                                  .PROCESS_ORDERset,
                                              "CODE_TEXT":
                                                  _datain.UDCODE[i].CODE_TEXT,
                                              "UD_CODE_GROUP":
                                                  _datain.UDCODE[i].CODEGROUP,
                                              "UD_CODE": _datain.UDCODE[i].CODE,
                                            }
                                          };

                                          Dio()
                                              .post(
                                            "${server2}QMINCOMING/UDSAVEQC",
                                            // "${'http://127.0.0.1:14094/'}QMINCOMING/UDSAVEQC",
                                            data: output,
                                          )
                                              .then((v) {
                                            // Navigator.pop(context);
                                            // P303QMMASTERQCMAINcontext.read<
                                            //         P303QMMASTERQCget_Bloc>()
                                            //     .add(P303QMMASTERQCget_GET());
                                            //
                                            print(v.data);
                                            if (v.data.length > 0) {
                                              if (v.data[0]['TYPE'] != null) {
                                                if (v.data[0]['TYPE']
                                                        .toString() ==
                                                    'E') {
                                                  showErrorPopup(
                                                      P303QMMASTERQCMAINcontext,
                                                      v.data.toString());
                                                } else {
                                                  showGoodPopup(
                                                      P303QMMASTERQCMAINcontext,
                                                      v.data.toString());
                                                }
                                              }
                                            }
                                            // Dio().post(
                                            //   "${server2}10GETDATAFROMJOBBINGAQC/QCFN",
                                            //   // "${'http://127.0.0.1:14094/'}10GETDATAFROMJOBBINGAQC/QCFN",
                                            //   data: {
                                            //     "BAPI_NAME": "ZFMPP_QCFN_IN",
                                            //     "ORDERID": P303QMMASTERQCVAR
                                            //         .PROCESS_ORDERset,
                                            //     "PERNR_ID": USERDATA.ID
                                            //   },
                                            // ).then((v) {
                                            //   Navigator.pop(context);
                                            //   P303QMMASTERQCMAINcontext.read<
                                            //           P303QMMASTERQCget_Bloc>()
                                            //       .add(P303QMMASTERQCget_GET());
                                            //   //
                                            //   print(v.data);
                                            //   // if (v.data['ExportParameter'] !=
                                            //   //     null) {
                                            //   //   if (v.data['ExportParameter']
                                            //   //               ['INACT_NEW']
                                            //   //           .toString() ==
                                            //   //       'E') {
                                            //   //     showErrorPopup(
                                            //   //         P303QMMASTERQCMAINcontext,
                                            //   //         v.data.toString());
                                            //   //   } else {
                                            //   //     showGoodPopup(
                                            //   //         P303QMMASTERQCMAINcontext,
                                            //   //         v.data.toString());
                                            //   //   }
                                            //   // } else {
                                            //   //   showErrorPopup(
                                            //   //       P303QMMASTERQCMAINcontext,
                                            //   //       v.data.toString());
                                            //   // }
                                            // });
                                          });
                                        } else {
                                          //
                                          WORNINGpop(
                                              context,
                                              ["", "QTY is not same"],
                                              120,
                                              200);
                                        }
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 400,
                                        color: Colors.yellowAccent,
                                        child: Center(
                                          child: Text(
                                            _datain.UDCODE[i].CODE_TEXT,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ]
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}

void _QMI003POPapp(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: QMI003POPapp(),
      );
    },
  );
}

class QMI003POPapp extends StatefulWidget {
  const QMI003POPapp({super.key});

  @override
  State<QMI003POPapp> createState() => _QMI003POPappState();
}

class _QMI003POPappState extends State<QMI003POPapp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 600,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const SizedBox(
              child: Center(
                child: Text("Selected set"),
              ),
            ),
            if (P303QMMASTERQCVAR.pagepopapp == 0) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      child: Center(
                        child: Text("Appearance"),
                      ),
                    ),

                    // if (_datasearch
                    //     .any((item) => item.PLANT == 'noxrust'))
                    SingleChildScrollView(
                      child: Container(
                        // width: 1100,
                        child: Column(
                          children: [
                            for (int i = 0;
                                i < P303QMMASTERQCVAR.SELECTED_SETdata.length;
                                i++) ...[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    //

                                    P303QMMASTERQCVAR
                                            .INSP_SPECdata[P303QMMASTERQCVAR.iDATA]
                                            .DATAAP =
                                        P303QMMASTERQCVAR
                                            .SELECTED_SETdata[i].CODE;
                                    P303QMMASTERQCVAR
                                            .INSP_SPECdata[P303QMMASTERQCVAR.iDATA]
                                            .DATAAP_TEXT =
                                        P303QMMASTERQCVAR
                                            .SELECTED_SETdata[i].CODE_TEXT;

                                    P303QMMASTERQCVAR
                                            .INSP_SPECdata[P303QMMASTERQCVAR.iDATA]
                                            .CODEG =
                                        P303QMMASTERQCVAR
                                            .SELECTED_SETdata[i].CODEGROUP;

                                    P303QMMASTERQCVAR
                                            .INSP_SPECdata[P303QMMASTERQCVAR.iDATA]
                                            .VALUATION =
                                        P303QMMASTERQCVAR
                                            .SELECTED_SETdata[i].VALUATION;

                                    P303QMMASTERQCMAINcontextpop1.read<
                                            P303QMMASTERQCgetINSP_SPEC_Bloc>()
                                        .add(P303QMMASTERQCgetINSP_SPEC_GET());

                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 200,
                                    color: P303QMMASTERQCVAR.SELECTED_SETdata[i]
                                                .VALUATION ==
                                            'A'
                                        ? Colors.green
                                        : Colors.red,
                                    child: Center(
                                      child: Text(
                                        P303QMMASTERQCVAR
                                            .SELECTED_SETdata[i].CODE_TEXT,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ] else if (P303QMMASTERQCVAR.pagepopapp == 1) ...[
              //
              const SizedBox(
                child: Center(
                  child: Text("DATA"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ComInputText(
                  height: 40,
                  width: 300,
                  isContr: P303QMMASTERQCVAR.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      P303QMMASTERQCVAR.iscontrol = input;
                    });
                  },
                  sValue: P303QMMASTERQCVAR.DATASUM,
                  returnfunc: (String s) {
                    P303QMMASTERQCVAR.DATASUM = s;
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  //
                  // P303QMMASTERQCVAR.pagepop = 1;
                  // setState(() {});
                  P303QMMASTERQCVAR.INSP_SPECdata[P303QMMASTERQCVAR.iDATA]
                      .DATASUM = P303QMMASTERQCVAR.DATASUM;
                  P303QMMASTERQCVAR.INSP_SPECdata[P303QMMASTERQCVAR.iDATA]
                      .DATASUM_TEXT = "VALUE";

                  P303QMMASTERQCMAINcontextpop1.read<
                          P303QMMASTERQCgetINSP_SPEC_Bloc>()
                      .add(P303QMMASTERQCgetINSP_SPEC_GET());
                  Navigator.pop(context);
                  // P303QMMASTERQCVAR.INSP_SPECdata[ P303QMMASTERQCVAR.iDATA ].DATAAP_TEXT
                },
                child: Container(
                  width: 200,
                  height: 40,
                  color: Colors.blue,
                  child: Center(
                    child: Text("save"),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

void _QCFN(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: QCFNWD(),
      );
    },
  );
}

class QCFNWD extends StatefulWidget {
  const QCFNWD({super.key});

  @override
  State<QCFNWD> createState() => _QCFNWDState();
}

class _QCFNWDState extends State<QCFNWD> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 600,
      child: Center(
        child: SizedBox(
          child: InkWell(
            onTap: () {
              print(P303QMMASTERQCVAR.PROCESS_ORDERset);
              Dio().post(
                "${server2}10GETDATAFROMJOBBINGAQC/QCFN",
                // "${'http://127.0.0.1:14094/'}10GETDATAFROMJOBBINGAQC/QCFN",
                data: {
                  "BAPI_NAME": "ZFMPP_QCFN_IN",
                  "ORDERID": P303QMMASTERQCVAR.PROCESS_ORDERset,
                  "PERNR_ID": USERDATA.ID
                },
              ).then((v) {
                // Navigator.pop(context);

                //
                print(v.data);
                if (v.data['ExportParameter'] != null) {
                  if (v.data['ExportParameter']['INACT_NEW'].toString() ==
                      'E') {
                    showErrorPopup(
                        P303QMMASTERQCMAINcontext, v.data.toString());
                  } else {
                    showGoodPopup(P303QMMASTERQCMAINcontext, v.data.toString());
                  }
                } else {
                  showErrorPopup(P303QMMASTERQCMAINcontext, v.data.toString());
                }
              });
            },
            child: Container(
              width: 400,
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text("QCFN"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
