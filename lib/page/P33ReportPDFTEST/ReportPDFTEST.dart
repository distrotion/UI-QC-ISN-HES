import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Cubit/33-ReportPDFNISHINBOcubit.dart';
import '../../widget/ReportComponent/CommonReport.dart';
import '../../widget/ReportComponent/PicSlot.dart';
import '../../widget/ReportComponent/SignSide.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
import '../../widget/common/imgset.dart';
import '../../widget/function/helper.dart';
import 'ReportPDFTESTvar.dart';

late BuildContext ReportPDFACTcontext;

class ReportPDFTEST extends StatefulWidget {
  ReportPDFTEST({
    Key? key,
    this.dataACT,
  }) : super(key: key);
  NISHINBOReportOutput? dataACT;
  @override
  State<ReportPDFTEST> createState() => _ReportPDFTESTState();
}

class _ReportPDFTESTState extends State<ReportPDFTEST> {
  @override
  void initState() {
    if (ReportPDFTESTvar.PO != '') {
      ReportPDFTESTvar.canf = false;
      context
          .read<ReportPDFNISHINBOcubit_Cubit>()
          .ReportPDF_ACT(ReportPDFTESTvar.PO);
    }
    super.initState();
  }

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ReportPDFACTcontext = context;

    NISHINBOReportOutput _dataACT = widget.dataACT ??
        NISHINBOReportOutput(
          databasic: BasicNISHINBODATA(),
        );
    if (_dataACT.datain.isNotEmpty) {
      //
      ReportPDFTESTvar.STATUS = 'REPORT READY';

      ReportPDFTESTvar.CUSTOMER = _dataACT.databasic.CUSTOMER;
      ReportPDFTESTvar.PROCESS = _dataACT.databasic.PROCESS;
      ReportPDFTESTvar.PARTNAME = _dataACT.databasic.PARTNAME;
      ReportPDFTESTvar.PARTNO = _dataACT.databasic.PARTNO;
      ReportPDFTESTvar.CUSLOT = _dataACT.databasic.CUSLOT;
      ReportPDFTESTvar.TPKLOT = _dataACT.databasic.TPKLOT;
      ReportPDFTESTvar.MATERIAL = _dataACT.databasic.MATERIAL;
      ReportPDFTESTvar.QTY =
          double.parse(ConverstStr(_dataACT.databasic.QTY)).toStringAsFixed(0);

      ReportPDFTESTvar.PIC01 = _dataACT.databasic.PIC01;
      ReportPDFTESTvar.PIC02 = _dataACT.databasic.PIC02;
      ReportPDFTESTvar.PICstd = _dataACT.databasic.PICstd;

      ReportPDFTESTvar.PASS = _dataACT.databasic.PASS;

      ReportPDFTESTvar.INC01 = '';
      ReportPDFTESTvar.INC02 = '';

      ReportPDFTESTvar.INC01 = _dataACT.databasic.INC01;
      ReportPDFTESTvar.INC02 = _dataACT.databasic.INC02;

      if (_dataACT.databasic.PARTNAMEref != '') {
        ReportPDFTESTvar.remark =
            'Reference data from\n${_dataACT.databasic.PARTNAMEref}\n${_dataACT.databasic.PARTref}';
      }

      for (var i = 0; i < _dataACT.datain.length; i++) {
        for (var j = 0; j < _dataACT.datain.length; j++) {
          //
          if (i == 0 &&
              _dataACT.datain[j].ITEM == 'ITEMs-5f19aa43fe12be0020dbd3bf') {
            String Loadin = '';
            if (_dataACT.datain[i].LOAD != '' &&
                _dataACT.datain[i].LOAD != '-') {
              Loadin = "( Load ${_dataACT.datain[i].LOAD} )";
            }

            ReportPDFTESTvar.datalist[i].ITEMname =
                _dataACT.datain[j].ITEMname + ' ' + Loadin;
            ReportPDFTESTvar.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFTESTvar.datalist[i].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFTESTvar.datalist[i].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFTESTvar.datalist[i].SPECIFICATIONname =
                _dataACT.datain[j].SPECIFICATIONname;
            ReportPDFTESTvar.datalist[i].RESULT = _dataACT.datain[j].RESULT;
          }

          if (i == 1 &&
              _dataACT.datain[j].ITEM == 'ITEMs-60403f1693e8d91950acb5c0') {
            String Loadin = '';
            if (_dataACT.datain[i].LOAD != '' &&
                _dataACT.datain[i].LOAD != '-') {
              Loadin = "( Load ${_dataACT.datain[i].LOAD} )";
            }
            ReportPDFTESTvar.datalist[i].ITEMname =
                _dataACT.datain[j].ITEMname + ' ' + Loadin;
            ReportPDFTESTvar.datalist[i].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFTESTvar.datalist[i].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFTESTvar.datalist[i].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFTESTvar.datalist[i].SPECIFICATIONname =
                _dataACT.datain[j].SPECIFICATIONname;
            ReportPDFTESTvar.datalist[i].RESULT = _dataACT.datain[j].RESULT;
          }

          if (i == 2 &&
              _dataACT.datain[j].ITEM == 'ITEMs-5f19a97cfe12be0020dbd3bc') {
            String Loadin = '';
            if (_dataACT.datain[i].LOAD != '' &&
                _dataACT.datain[i].LOAD != '-') {
              Loadin = "( Load ${_dataACT.datain[i].LOAD} )";
            }
            ReportPDFTESTvar.datalist[5].ITEMname =
                _dataACT.datain[j].ITEMname + ' ' + Loadin;
            ReportPDFTESTvar.datalist[5].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFTESTvar.datalist[5].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFTESTvar.datalist[5].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFTESTvar.datalist[5].CONTROLlimmit =
                _dataACT.datain[j].CONTROLlimmit;
            ReportPDFTESTvar.datalist[5].SPECIFICATION =
                _dataACT.datain[j].SPECIFICATION;
            ReportPDFTESTvar.datalist[5].DATA01 = _dataACT.datain[j].DATA01;
            ReportPDFTESTvar.datalist[5].DATA02 = _dataACT.datain[j].DATA02;
            ReportPDFTESTvar.datalist[5].DATA03 = _dataACT.datain[j].DATA03;
            ReportPDFTESTvar.datalist[5].DATAAVG = _dataACT.datain[j].DATAAVG;
          }

          if (i == 3 &&
              _dataACT.datain[j].ITEM == 'ITEMs-6040810993e8d91950acb5d4') {
            String Loadin = '';
            if (_dataACT.datain[i].LOAD != '' &&
                _dataACT.datain[i].LOAD != '-') {
              Loadin = "( Load ${_dataACT.datain[i].LOAD} )";
            }
            ReportPDFTESTvar.datalist[6].ITEMname =
                _dataACT.datain[j].ITEMname + ' ' + Loadin;
            ReportPDFTESTvar.datalist[6].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFTESTvar.datalist[6].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFTESTvar.datalist[6].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFTESTvar.datalist[6].CONTROLlimmit =
                _dataACT.datain[j].CONTROLlimmit;
            ReportPDFTESTvar.datalist[6].SPECIFICATION =
                _dataACT.datain[j].SPECIFICATION;
            ReportPDFTESTvar.datalist[6].DATA01 = _dataACT.datain[j].DATA01;
            ReportPDFTESTvar.datalist[6].DATA02 = _dataACT.datain[j].DATA02;
            ReportPDFTESTvar.datalist[6].DATA03 = _dataACT.datain[j].DATA03;
            ReportPDFTESTvar.datalist[6].DATAAVG = _dataACT.datain[j].DATAAVG;
          }

          if (i == 4 &&
              _dataACT.datain[j].ITEM == 'ITEMs-5f19a922fe12be0020dbd3ba') {
            String Loadin = '';
            if (_dataACT.datain[i].LOAD != '' &&
                _dataACT.datain[i].LOAD != '-') {
              Loadin = "( Load ${_dataACT.datain[i].LOAD} )";
            }
            ReportPDFTESTvar.datalist[7].ITEMname =
                _dataACT.datain[j].ITEMname + ' ' + Loadin;
            ReportPDFTESTvar.datalist[7].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFTESTvar.datalist[7].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFTESTvar.datalist[7].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFTESTvar.datalist[7].CONTROLlimmit =
                _dataACT.datain[j].CONTROLlimmit;
            ReportPDFTESTvar.datalist[7].SPECIFICATION =
                _dataACT.datain[j].SPECIFICATION;
            ReportPDFTESTvar.datalist[7].DATA01 = _dataACT.datain[j].DATA01;
            ReportPDFTESTvar.datalist[7].DATA02 = _dataACT.datain[j].DATA02;
            ReportPDFTESTvar.datalist[7].DATA03 = _dataACT.datain[j].DATA03;
            ReportPDFTESTvar.datalist[7].DATAAVG = _dataACT.datain[j].DATAAVG;
          }

          if (i == 5 &&
              _dataACT.datain[j].ITEM == 'ITEMs-60407f6193e8d91950acb5cf') {
            String Loadin = '';
            if (_dataACT.datain[i].LOAD != '' &&
                _dataACT.datain[i].LOAD != '-') {
              Loadin = "( Load ${_dataACT.datain[i].LOAD} )";
            }
            ReportPDFTESTvar.datalist[8].ITEMname =
                _dataACT.datain[j].ITEMname + ' ' + Loadin;
            ReportPDFTESTvar.datalist[8].SCMARK = _dataACT.datain[j].SCMARK;
            ReportPDFTESTvar.datalist[8].METHODname =
                _dataACT.datain[j].METHODname;
            ReportPDFTESTvar.datalist[8].FREQ = _dataACT.datain[j].FREQ;
            ReportPDFTESTvar.datalist[8].CONTROLlimmit =
                _dataACT.datain[j].CONTROLlimmit;
            ReportPDFTESTvar.datalist[8].SPECIFICATION =
                _dataACT.datain[j].SPECIFICATION;
            ReportPDFTESTvar.datalist[8].DATA01 = _dataACT.datain[j].DATA01;
            ReportPDFTESTvar.datalist[8].DATA02 = _dataACT.datain[j].DATA02;
            ReportPDFTESTvar.datalist[8].DATA03 = _dataACT.datain[j].DATA03;
            ReportPDFTESTvar.datalist[8].DATAAVG = _dataACT.datain[j].DATAAVG;
          }
        }
      }
    } else {
      ReportPDFTESTvar.STATUS = 'WATTING or NO-DATA';

      ReportPDFTESTvar.CUSTOMER = '';
      ReportPDFTESTvar.PROCESS = '';
      ReportPDFTESTvar.PARTNAME = '';
      ReportPDFTESTvar.PARTNO = '';
      ReportPDFTESTvar.CUSLOT = '';
      ReportPDFTESTvar.TPKLOT = '';
      ReportPDFTESTvar.MATERIAL = '';
      ReportPDFTESTvar.QTY = '';

      ReportPDFTESTvar.PICstd = '';
      ReportPDFTESTvar.PIC01 = '';
      ReportPDFTESTvar.PIC02 = '';
      ReportPDFTESTvar.PASS = '';

      ReportPDFTESTvar.datalist = [
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: ComInputText(
                  height: 40,
                  width: 200,
                  isContr: ReportPDFTESTvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFTESTvar.iscontrol = input;
                    });
                  },
                  isEnabled: ReportPDFTESTvar.canf,
                  sValue: ReportPDFTESTvar.PO,
                  returnfunc: (String s) {
                    ReportPDFTESTvar.PO = s;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    if (ReportPDFTESTvar.PO != '') {
                      ReportPDFTESTvar.canf = false;
                      context
                          .read<ReportPDFNISHINBOcubit_Cubit>()
                          .ReportPDF_ACT(ReportPDFTESTvar.PO);
                    }
                  },
                  child: Container(
                    color: Colors.black,
                    height: 40,
                    width: 40,
                    child: const Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    context.read<ReportPDFNISHINBOcubit_Cubit>().Flush();
                    ReportPDFTESTvar.canf = true;
                    ReportPDFTESTvar.iscontrol = true;
                    ReportPDFTESTvar.PO = '';
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.red,
                    height: 40,
                    width: 100,
                    child: const Center(
                      child: Text("CLEAR"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  color: ReportPDFTESTvar.STATUS == 'REPORT READY'
                      ? Colors.green
                      : Colors.yellow,
                  height: 40,
                  width: 200,
                  child: Center(
                    child: Text(ReportPDFTESTvar.STATUS),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    PDFloader(context);
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      captureToback(
                        _globalKey,
                        ReportPDFTESTvar.PO,
                      ).then((value) {
                        print(value);

                        Navigator.pop(context);
                      });
                    });
                  },
                  child: Container(
                    color: Colors.yellow,
                    height: 50,
                    width: 100,
                    child: const Center(
                      child: Text("Print"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: RepaintBoundary(
              key: _globalKey,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 24.0, right: 16.0, left: 16.0, bottom: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // const SizedBox(
                        //   width: 50,
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 2000,
                            width: 1364,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                              // color: Colors.red,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(0)),
                            ),
                            child: Column(
                              children: [
                                HEAD3SLOT(
                                  ListFlex: const [5, 4, 1],
                                  widget01: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Container(
                                          height: 120,
                                          width: 230,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/images/logoonly_tpkpng.png",
                                              ),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // PicShow(
                                      //     width: 120, height: 230, base64: tpklogo),
                                      SizedBox(
                                        height: 120,
                                        width: 400,
                                        child: Column(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 20,
                                              ),
                                              child: Text(
                                                "THAI PARKERIZING CO.,LTD.",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 40,
                                              ),
                                              child: Text(
                                                "Heat & Surface Treatment Division",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  widget02: Column(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: 120,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 3,
                                                  style: BorderStyle.solid),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 20,
                                                      ),
                                                      child: Text(
                                                        "Quality Testing Report (ISONITE ESIE 1)",
                                                        style: TextStyle(
                                                          fontSize: 24,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 30, bottom: 10),
                                                      child: Text(
                                                        "(ใบรายงานผลการตรวจสอบผลิตภัณฑ์สำหรับกระบวนการ ISN)",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          height: 60,
                                          child: Center(
                                            child: Text(
                                              "FR-HQC-03/028-00-25/10/22",
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  widget03: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 40,
                                              ),
                                              child: Text(
                                                "PAGE",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 30, bottom: 10),
                                              child: Text(
                                                "1/1",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                HEAD4SLOT(
                                  ListFlex: [4, 8, 3, 5],
                                  widget01: const Center(
                                    child: Text(
                                      "Customer",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget02: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        ReportPDFTESTvar.CUSTOMER,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  widget03: const Center(
                                    child: Text(
                                      "Process",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget04: Center(
                                    child: Text(
                                      ReportPDFTESTvar.PROCESS,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                BODY4SLOT(
                                  ListFlex: [4, 8, 3, 5],
                                  widget01: const Center(
                                    child: Text(
                                      "Part Name",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget02: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        ReportPDFTESTvar.PARTNAME,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  widget03: const Center(
                                    child: Text(
                                      "Part No.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget04: Center(
                                    child: Text(
                                      ReportPDFTESTvar.PARTNO,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                BODY2SLOT(
                                  ListFlex: [4, 16],
                                  widget01: const Center(
                                    child: Text(
                                      "Customer Lot No.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget02: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        ReportPDFTESTvar.CUSLOT,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                BODY6SLOT(
                                  ListFlex: [4, 6, 3, 3, 1, 3],
                                  widget01: const Center(
                                    child: Text(
                                      "TPK. Lot No.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget02: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        ReportPDFTESTvar.TPKLOT,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  widget03: const Center(
                                    child: Text(
                                      "Material",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget04: Center(
                                    child: Text(
                                      ReportPDFTESTvar.MATERIAL,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget05: const Center(
                                    child: Text(
                                      "Qty.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget06: Center(
                                    child: Text(
                                      ReportPDFTESTvar.QTY,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                HEAD1SLOT(
                                  widget01: const Center(
                                    child: Text(
                                      "INCOMING INSPECTION",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                HEAD7SLOT(
                                  ListFlex: [6, 1, 4, 2, 2, 2, 2],
                                  widget01: const Center(
                                    child: Text(
                                      "ITEM",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget02: const Center(
                                    child: Text(
                                      "SC",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget03: const Center(
                                    child: Text(
                                      "Check Method",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget04: const Center(
                                    child: Text(
                                      "Frequency",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget05: const Center(
                                    child: Text(
                                      "Specification",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget06: const Center(
                                    child: Text(
                                      "Result",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                BODY7SLOT(
                                  ListFlex: const [6, 1, 4, 2, 2, 2, 2],
                                  widget01: Center(
                                    child: Text(
                                      ReportPDFTESTvar.INC01 != ''
                                          ? "Appearance for Rust"
                                          : "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget02: const Center(
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget03: Center(
                                    child: Text(
                                      ReportPDFTESTvar.INC01 != ''
                                          ? "Visual"
                                          : "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget04: Center(
                                    child: Text(
                                      ReportPDFTESTvar.INC01 != ''
                                          ? "10 pcs/rcv.Lot"
                                          : "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget05: Center(
                                    child: Text(
                                      ReportPDFTESTvar.INC01 != ''
                                          ? "No Rust"
                                          : "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget06: Center(
                                    child: Text(
                                      ReportPDFTESTvar.INC01 != ''
                                          ? "No Rust"
                                          : "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget07: const Center(
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                BODY7SLOT(
                                  ListFlex: [6, 1, 4, 2, 2, 2, 2],
                                  widget01: Center(
                                    child: Text(
                                      ReportPDFTESTvar.INC02 != ''
                                          ? "Appearance for scratch"
                                          : "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget02: Center(
                                    child: Text(
                                      ReportPDFTESTvar.INC02 != '' ? "" : "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget03: Center(
                                    child: Text(
                                      ReportPDFTESTvar.INC02 != ''
                                          ? "Visual"
                                          : "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget04: Center(
                                    child: Text(
                                      ReportPDFTESTvar.INC02 != ''
                                          ? "10 pcs/rcv.Lot"
                                          : "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget05: Center(
                                    child: Text(
                                      ReportPDFTESTvar.INC02 != ''
                                          ? "No Scratch"
                                          : "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget06: Center(
                                    child: Text(
                                      ReportPDFTESTvar.INC02 != ''
                                          ? "No Scratch"
                                          : "",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget07: const Center(
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                HEAD1SLOT(
                                  widget01: const Center(
                                    child: Text(
                                      "FINAL INSPECTION",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                HEAD6SLOT(
                                  ListFlex: [5, 1, 3, 2, 4, 4],
                                  widget01: const Center(
                                    child: Text(
                                      "ITEM",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget02: const Center(
                                    child: Text(
                                      "SC",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget03: const Center(
                                    child: Text(
                                      "Check Method",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget04: const Center(
                                    child: Text(
                                      "Frequency",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget05: const Center(
                                    child: Text(
                                      "Specification",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget06: const Center(
                                    child: Text(
                                      "Result",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                BODY6SLOT(
                                  ListFlex: [5, 1, 3, 2, 4, 4],
                                  widget01: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[0].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget02: Center(
                                    child:
                                        ReportPDFTESTvar.datalist[0].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK03)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                  ),
                                  widget03: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[0].METHODname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget04: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[0].FREQ,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget05: Center(
                                    child: Text(
                                      ReportPDFTESTvar
                                          .datalist[0].SPECIFICATIONname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget06: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[0].RESULT,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                BODY6SLOT(
                                  ListFlex: [5, 1, 3, 2, 4, 4],
                                  widget01: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[1].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget02: Center(
                                    child:
                                        ReportPDFTESTvar.datalist[1].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK03)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                  ),
                                  widget03: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[1].METHODname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget04: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[1].FREQ,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget05: Center(
                                    child: Text(
                                      ReportPDFTESTvar
                                          .datalist[1].SPECIFICATIONname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget06: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[1].RESULT,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                BODY6SLOT(
                                  ListFlex: [5, 1, 3, 2, 4, 4],
                                  widget01: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[2].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget02: Center(
                                    child:
                                        ReportPDFTESTvar.datalist[2].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK03)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                  ),
                                  widget03: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[2].METHODname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget04: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[2].FREQ,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget05: Center(
                                    child: Text(
                                      ReportPDFTESTvar
                                          .datalist[2].SPECIFICATIONname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget06: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[2].RESULT,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                BODY6SLOT(
                                  ListFlex: [5, 1, 3, 2, 4, 4],
                                  widget01: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[3].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget02: Center(
                                    child:
                                        ReportPDFTESTvar.datalist[3].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK03)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                  ),
                                  widget03: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[3].METHODname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget04: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[3].FREQ,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget05: Center(
                                    child: Text(
                                      ReportPDFTESTvar
                                          .datalist[3].SPECIFICATIONname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget06: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[3].RESULT,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                BODY6SLOT(
                                  ListFlex: [5, 1, 3, 2, 4, 4],
                                  widget01: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[4].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget02: Center(
                                    child:
                                        ReportPDFTESTvar.datalist[4].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK03)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                  ),
                                  widget03: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[4].METHODname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget04: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[4].FREQ,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget05: Center(
                                    child: Text(
                                      ReportPDFTESTvar
                                          .datalist[4].SPECIFICATIONname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget06: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[4].RESULT,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                // HEAD1SLOT(),
                                const SizedBox(
                                  height: 15,
                                ),
                                HEAD9SLOT(
                                  ListFlex: [16, 4, 12, 8, 6, 6, 4, 4, 4, 4, 4],
                                  widget01: const Center(
                                    child: Text(
                                      "ITEM",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget02: const Center(
                                    child: Text(
                                      "SC",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget03: const Center(
                                    child: Text(
                                      "Check Method",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget04: const Center(
                                    child: Text(
                                      "Frequency",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget05: const Center(
                                    child: Text(
                                      "Specification",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget06: const Center(
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget07: const Center(
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget08: const Center(
                                    child: Text(
                                      "3",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  widget09: const Center(
                                    child: Text(
                                      "AVG",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                BODY9SLOT(
                                  ListFlex: [16, 4, 12, 8, 6, 6, 4, 4, 4, 4, 4],
                                  widget01: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[5].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget02: Center(
                                    child:
                                        ReportPDFTESTvar.datalist[5].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK03)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                  ),
                                  widget03: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[5].METHODname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget04: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[5].FREQ,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget05: Center(
                                    child: Text(
                                      ReportPDFTESTvar
                                          .datalist[5].SPECIFICATION,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget06: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[5].DATA01,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget07: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[5].DATA02,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget08: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[5].DATA03,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget09: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[5].DATAAVG,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                BODY9SLOT(
                                  ListFlex: [16, 4, 12, 8, 6, 6, 4, 4, 4, 4, 4],
                                  widget01: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[6].ITEMname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget02: Center(
                                    child:
                                        ReportPDFTESTvar.datalist[6].SCMARK ==
                                                'YES'
                                            ? PicShow(
                                                width: 42,
                                                height: 42,
                                                base64: SCMASK03)
                                            : const Text(
                                                "",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                  ),
                                  widget03: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[6].METHODname,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget04: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[6].FREQ,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget05: Center(
                                    child: Text(
                                      ReportPDFTESTvar
                                          .datalist[6].SPECIFICATION,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget06: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[6].DATA01,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget07: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[6].DATA02,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget08: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[6].DATA03,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  widget09: Center(
                                    child: Text(
                                      ReportPDFTESTvar.datalist[6].DATAAVG,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),

                                BODY9SLOTX2(
                                  ListFlex: [16, 4, 12, 8, 6, 6, 4, 4, 4, 4, 4],
                                  widget01: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 47,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 3,
                                                  style: BorderStyle.solid),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              ReportPDFTESTvar
                                                  .datalist[7].ITEMname,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          height: 60,
                                          child: Center(
                                            child: Text(
                                              ReportPDFTESTvar
                                                  .datalist[8].ITEMname,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  widget02: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 47,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 3,
                                                  style: BorderStyle.solid),
                                            ),
                                          ),
                                          child: Center(
                                            child: ReportPDFTESTvar
                                                        .datalist[7].SCMARK ==
                                                    'YES'
                                                ? PicShow(
                                                    width: 42,
                                                    height: 42,
                                                    base64: SCMASK03)
                                                : const Text(
                                                    "",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          height: 60,
                                          child: Center(
                                            child: ReportPDFTESTvar
                                                        .datalist[8].SCMARK ==
                                                    'YES'
                                                ? PicShow(
                                                    width: 42,
                                                    height: 42,
                                                    base64: SCMASK03)
                                                : const Text(
                                                    "",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  widget03: const SizedBox(
                                    height: 97,
                                    child: Center(
                                      child: Text(
                                        "Micro Vickers Scope (X 500)",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  widget04: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 47,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 3,
                                                  style: BorderStyle.solid),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              ReportPDFTESTvar.datalist[7].FREQ,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          height: 60,
                                          child: Center(
                                            child: Text(
                                              ReportPDFTESTvar.datalist[8].FREQ,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  widget05: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 47,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 3,
                                                  style: BorderStyle.solid),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              ReportPDFTESTvar
                                                  .datalist[7].SPECIFICATION,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          height: 60,
                                          child: Center(
                                            child: Text(
                                              "${ReportPDFTESTvar.datalist[8].SPECIFICATION}",
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  widget06: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 47,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 3,
                                                  style: BorderStyle.solid),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              ReportPDFTESTvar
                                                  .datalist[7].DATA01,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          height: 60,
                                          child: Center(
                                            child: Text(
                                              ReportPDFTESTvar
                                                  .datalist[8].DATA01,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  widget07: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 47,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 3,
                                                  style: BorderStyle.solid),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              ReportPDFTESTvar
                                                  .datalist[7].DATA02,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          height: 60,
                                          child: Center(
                                            child: Text(
                                              ReportPDFTESTvar
                                                  .datalist[8].DATA02,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  widget08: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 47,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 3,
                                                  style: BorderStyle.solid),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              ReportPDFTESTvar
                                                  .datalist[7].DATA03,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          height: 60,
                                          child: Center(
                                            child: Text(
                                              ReportPDFTESTvar
                                                  .datalist[8].DATA03,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  widget09: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 47,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 3,
                                                  style: BorderStyle.solid),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              ReportPDFTESTvar
                                                  .datalist[7].DATAAVG,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          height: 60,
                                          child: Center(
                                            child: Text(
                                              ReportPDFTESTvar
                                                  .datalist[8].DATAAVG,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                PICSLOT(
                                  PIC01: _dataACT.databasic.PIC01,
                                  PIC02: _dataACT.databasic.PIC02,
                                ),
                                TAILSLOT(
                                  PASS: ReportPDFTESTvar.PASS,
                                  PICS: _dataACT.databasic.PICstd,
                                  Remark: ReportPDFTESTvar.remark,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 50,
          ),
        ],
      ),
    );
  }
}
