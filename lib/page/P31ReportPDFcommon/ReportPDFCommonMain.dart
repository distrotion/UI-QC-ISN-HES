import 'package:flutter/material.dart';

import '../../bloc/Cubit/31-ReportPDFCommoncubit.dart';
import '../../widget/ReportComponent/CommonReport.dart';
import '../../widget/ReportComponent/PicSlot.dart';
import '../../widget/ReportComponent/SignSide.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/imgset.dart';
import '../../widget/function/helper.dart';
import 'ReportPDFCommonvar.dart';

late BuildContext ReportPDFCommoncontext;

class ReportPDFCommon extends StatefulWidget {
  ReportPDFCommon({
    Key? key,
    this.dataCommon,
  }) : super(key: key);
  CommonReportOutput? dataCommon;
  @override
  State<ReportPDFCommon> createState() => _ReportPDFCommonState();
}

class _ReportPDFCommonState extends State<ReportPDFCommon> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ReportPDFCommoncontext = context;

    CommonReportOutput _dataACT = widget.dataCommon ??
        CommonReportOutput(
          databasic: BasicCommonDATA(),
        );
    if (_dataACT.datain.isNotEmpty) {
      //
      ReportPDFCommonvar.STATUS = 'REPORT READY';
      ReportPDFCommonvar.CUSTOMER = _dataACT.databasic.CUSTOMER;
      ReportPDFCommonvar.PROCESS = _dataACT.databasic.PROCESS;
      ReportPDFCommonvar.PARTNAME = _dataACT.databasic.PARTNAME;
      ReportPDFCommonvar.PARTNO = _dataACT.databasic.PARTNO;
      ReportPDFCommonvar.CUSLOT = _dataACT.databasic.CUSLOT;
      ReportPDFCommonvar.TPKLOT = _dataACT.databasic.TPKLOT;
      ReportPDFCommonvar.MATERIAL = _dataACT.databasic.MATERIAL;
      ReportPDFCommonvar.QTY = _dataACT.databasic.QTY;

      ReportPDFCommonvar.PIC01 = _dataACT.databasic.PIC01;
      ReportPDFCommonvar.PIC02 = _dataACT.databasic.PIC02;
      ReportPDFCommonvar.PICstd = _dataACT.databasic.PICstd;
    } else {
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
                  isContr: ReportPDFCommonvar.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFCommonvar.iscontrol = input;
                    });
                  },
                  isEnabled: ReportPDFCommonvar.canf,
                  sValue: ReportPDFCommonvar.PO,
                  returnfunc: (String s) {
                    ReportPDFCommonvar.PO = s;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    if (ReportPDFCommonvar.PO != '') {}
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
                  onTap: () {},
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
                  color: ReportPDFCommonvar.STATUS == 'REPORT READY'
                      ? Colors.green
                      : Colors.yellow,
                  height: 40,
                  width: 200,
                  child: Center(
                    child: Text(ReportPDFCommonvar.STATUS),
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
                      capture(
                        _globalKey,
                        ReportPDFCommonvar.PO,
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
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
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
                                    ReportPDFCommonvar.CUSTOMER,
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
                                  ReportPDFCommonvar.PROCESS,
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
                                    ReportPDFCommonvar.PARTNAME,
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
                                  ReportPDFCommonvar.PARTNO,
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
                                    ReportPDFCommonvar.CUSLOT,
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
                                    ReportPDFCommonvar.TPKLOT,
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
                                  ReportPDFCommonvar.MATERIAL,
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
                                  ReportPDFCommonvar.QTY,
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
                              widget07: const Center(
                                child: Text(
                                  "Remark",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            BODY7SLOT(
                              ListFlex: [6, 1, 4, 2, 2, 2, 2],
                              widget01: const Center(
                                child: Text(
                                  "Appearance for Rust",
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
                              widget03: const Center(
                                child: Text(
                                  "Visual",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget04: const Center(
                                child: Text(
                                  "10 pcs/rcv.Lot",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget05: const Center(
                                child: Text(
                                  "No Rust",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget06: const Center(
                                child: Text(
                                  "No Rust",
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
                              widget01: const Center(
                                child: Text(
                                  "",
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
                              widget03: const Center(
                                child: Text(
                                  "",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget04: const Center(
                                child: Text(
                                  "",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget05: const Center(
                                child: Text(
                                  "",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget06: const Center(
                                child: Text(
                                  "",
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
                              widget07: const Center(
                                child: Text(
                                  "Remark",
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
                                  ReportPDFCommonvar.datalist[0].ITEMname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget02: Center(
                                child: ReportPDFCommonvar.datalist[0].SCMARK ==
                                        'YES'
                                    ? PicShow(
                                        width: 42, height: 42, base64: SCMASK01)
                                    : const Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                              ),
                              widget03: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[0].METHODname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget04: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[0].FREQ,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget05: Center(
                                child: Text(
                                  ReportPDFCommonvar
                                      .datalist[0].SPECIFICATIONname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget06: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[0].RESULT,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            BODY7SLOT(
                              ListFlex: [6, 1, 4, 2, 2, 2, 2],
                              widget01: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[1].ITEMname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget02: Center(
                                child: ReportPDFCommonvar.datalist[1].SCMARK ==
                                        'YES'
                                    ? PicShow(
                                        width: 42, height: 42, base64: SCMASK01)
                                    : const Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                              ),
                              widget03: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[1].METHODname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget04: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[1].FREQ,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget05: Center(
                                child: Text(
                                  ReportPDFCommonvar
                                      .datalist[1].SPECIFICATIONname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget06: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[1].RESULT,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            BODY7SLOT(
                              ListFlex: [6, 1, 4, 2, 2, 2, 2],
                              widget01: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[2].ITEMname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget02: Center(
                                child: ReportPDFCommonvar.datalist[2].SCMARK ==
                                        'YES'
                                    ? PicShow(
                                        width: 42, height: 42, base64: SCMASK01)
                                    : const Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                              ),
                              widget03: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[2].METHODname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget04: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[2].FREQ,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget05: Center(
                                child: Text(
                                  ReportPDFCommonvar
                                      .datalist[2].SPECIFICATIONname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget06: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[2].RESULT,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            BODY7SLOT(
                              ListFlex: [6, 1, 4, 2, 2, 2, 2],
                              widget01: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[3].ITEMname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget02: Center(
                                child: ReportPDFCommonvar.datalist[3].SCMARK ==
                                        'YES'
                                    ? PicShow(
                                        width: 42, height: 42, base64: SCMASK01)
                                    : const Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                              ),
                              widget03: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[3].METHODname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget04: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[3].FREQ,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget05: Center(
                                child: Text(
                                  ReportPDFCommonvar
                                      .datalist[3].SPECIFICATIONname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget06: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[3].RESULT,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            BODY7SLOT(
                              ListFlex: [6, 1, 4, 2, 2, 2, 2],
                              widget01: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[4].ITEMname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget02: Center(
                                child: ReportPDFCommonvar.datalist[4].SCMARK ==
                                        'YES'
                                    ? PicShow(
                                        width: 42, height: 42, base64: SCMASK01)
                                    : const Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                              ),
                              widget03: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[4].METHODname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget04: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[4].FREQ,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget05: Center(
                                child: Text(
                                  ReportPDFCommonvar
                                      .datalist[4].SPECIFICATIONname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget06: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[4].RESULT,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            BODY7SLOT(
                              ListFlex: [6, 1, 4, 2, 2, 2, 2],
                              widget01: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[4].ITEMname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget02: Center(
                                child: ReportPDFCommonvar.datalist[4].SCMARK ==
                                        'YES'
                                    ? PicShow(
                                        width: 42, height: 42, base64: SCMASK01)
                                    : const Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                              ),
                              widget03: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[4].METHODname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget04: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[4].FREQ,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget05: Center(
                                child: Text(
                                  ReportPDFCommonvar
                                      .datalist[4].SPECIFICATIONname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget06: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[4].RESULT,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            BODY7SLOT(
                              ListFlex: [6, 1, 4, 2, 2, 2, 2],
                              widget01: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[4].ITEMname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget02: Center(
                                child: ReportPDFCommonvar.datalist[4].SCMARK ==
                                        'YES'
                                    ? PicShow(
                                        width: 42, height: 42, base64: SCMASK01)
                                    : const Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                              ),
                              widget03: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[4].METHODname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget04: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[4].FREQ,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget05: Center(
                                child: Text(
                                  ReportPDFCommonvar
                                      .datalist[4].SPECIFICATIONname,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              widget06: Center(
                                child: Text(
                                  ReportPDFCommonvar.datalist[4].RESULT,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            HEAD16SLOT(
                              ListFlex: S16slot,
                              widget01: const Center(
                                child: Text(
                                  "SAMPLE NO.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            BODY16SLOT(
                              ListFlex: S16slot,
                              widget01: const Center(
                                child: Text(
                                  "POINT NO.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            BODY16SLOT(
                              ListFlex: S16slot,
                              widget01: const Center(
                                child: Text(
                                  "Surface Hardness",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            PICSLO2SIDE(
                              PIC01: _dataACT.databasic.PIC01,
                              PIC02: _dataACT.databasic.PIC02,
                              widget01: Column(
                                children: [
                                  HEAD6SLOT(
                                    ListFlex: [2, 1, 1, 1, 1, 1],
                                    widget01: const Center(
                                      child: Text(
                                        "SAMPLE NO.",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY6SLOT(
                                    ListFlex: [2, 1, 1, 1, 1, 1],
                                    widget01: const Center(
                                      child: Text(
                                        "POINT NO.",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY6SLOT(
                                    ListFlex: [2, 1, 1, 1, 1, 1],
                                    widget01: const Center(
                                      child: Text(
                                        "Surface Roughness",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  HEAD6SLOT(
                                    ListFlex: [2, 1, 1, 1, 1, 1],
                                    widget01: const Center(
                                      child: Text(
                                        "SAMPLE NO.",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY6SLOT(
                                    ListFlex: [2, 1, 1, 1, 1, 1],
                                    widget01: const Center(
                                      child: Text(
                                        "POINT NO.",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  BODY6SLOT(
                                    ListFlex: [2, 1, 1, 1, 1, 1],
                                    widget01: const Center(
                                      child: Text(
                                        "Compound Layes",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TAILSLOT(
                              PICS: _dataACT.databasic.PICstd,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
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

List<int> S16slot = const [
  3,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1
];
