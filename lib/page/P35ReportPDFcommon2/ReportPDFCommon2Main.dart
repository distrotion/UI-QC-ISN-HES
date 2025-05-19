import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/Cubit/31-ReportPDFCommoncubit.dart';
import '../../data/global.dart';
import '../../widget/ReportComponent/CommonReport.dart';
import '../../widget/ReportComponent/PicSlot.dart';
import '../../widget/ReportComponent/SignSide.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
import '../../widget/common/imgset.dart';
import '../../widget/function/helper.dart';
import '../P303QMMASTERQC/P303QMMASTERQCVAR.dart';
import '../P31ReportPDFcommon/ReportPDFCommonMain.dart';
import 'ReportPDFCommon2var.dart';

late BuildContext ReportPDFCommon2context;

class ReportPDFCommon2 extends StatefulWidget {
  ReportPDFCommon2({
    Key? key,
    this.dataCommon,
  }) : super(key: key);
  CommonReportOutput? dataCommon;
  @override
  State<ReportPDFCommon2> createState() => _ReportPDFCommon2State();
}

class _ReportPDFCommon2State extends State<ReportPDFCommon2> {
  @override
  void initState() {
    ReportPDFCommon2var.PASS = '';
    RepoteData.SUMLOT = '-';
    ReportPDFCommon2var.SCMASKTYPE = SCMASK03;
    if (ReportPDFCommon2var.PO != '') {
      ReportPDFCommon2var.canf = false;
      context
          .read<ReportPDFCommon_Cubit>()
          .ReportPDFCommonCubit(ReportPDFCommon2var.PO);
    }
    super.initState();
  }

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ReportPDFCommon2context = context;

    CommonReportOutput _dataCOMMON = widget.dataCommon ??
        CommonReportOutput(
          databasic: BasicCommonDATA(),
        );
    int HardnessNO = 1;
    int CompoundNO = 1;
    int DiaNO = 1;
    int RoughnessNO = 1;
    if (_dataCOMMON.datain.isNotEmpty) {
      //
      ReportPDFCommon2var.STATUS = 'REPORT READY';
      ReportPDFCommon2var.CUSTOMER = _dataCOMMON.databasic.CUSTOMER;
      ReportPDFCommon2var.PROCESS = _dataCOMMON.databasic.PROCESS;
      ReportPDFCommon2var.PARTNAME = _dataCOMMON.databasic.PARTNAME;
      ReportPDFCommon2var.PARTNO = _dataCOMMON.databasic.PARTNO;
      ReportPDFCommon2var.CUSLOT = _dataCOMMON.databasic.CUSLOT;
      ReportPDFCommon2var.TPKLOT = _dataCOMMON.databasic.TPKLOT;
      ReportPDFCommon2var.MATERIAL = _dataCOMMON.databasic.MATERIAL;
      if (_dataCOMMON.databasic.UNITSAP.toUpperCase() != 'KG') {
        ReportPDFCommon2var.QTY =
            '${double.parse(ConverstStr(_dataCOMMON.databasic.QTY)).toStringAsFixed(0)} ${_dataCOMMON.databasic.UNITSAP}';
      } else {
        ReportPDFCommon2var.QTY =
            '${double.parse(ConverstStr(_dataCOMMON.databasic.QTY)).toStringAsFixed(1)} ${_dataCOMMON.databasic.UNITSAP}';
      }

      ReportPDFCommon2var.PIC01 = _dataCOMMON.databasic.PIC01;
      ReportPDFCommon2var.PIC02 = _dataCOMMON.databasic.PIC02;
      ReportPDFCommon2var.PICstd = _dataCOMMON.databasic.PICstd;

      if (ReportPDFCommon2var.PASS != 'N/A') {
        ReportPDFCommon2var.PASS = _dataCOMMON.databasic.PASS;
      }
      ReportPDFCommon2var.remark = '';

      ReportPDFCommon2var.INC01 = _dataCOMMON.databasic.INC01;
      ReportPDFCommon2var.INC02 = _dataCOMMON.databasic.INC02;

      if (_dataCOMMON.databasic.PARTNAMEref != '') {
        ReportPDFCommon2var.remark =
            'Reference data from\n${_dataCOMMON.databasic.PARTNAMEref}\n${_dataCOMMON.databasic.PARTref}';
      }
//remark

      // print(_dataCOMMON.datain[0]);
      // print(_dataCOMMON.datain.length);
      ReportPDFCommon2var.rawlistHardness = [];
      ReportPDFCommon2var.rawlistCompound = [];
      ReportPDFCommon2var.rawlistDia = [];
      ReportPDFCommon2var.rawlistRoughness = [];
      ReportPDFCommon2var.rawlistCORE = [];

      for (var i = 0; i < _dataCOMMON.datain.length; i++) {
        String Loadin = '';
        if (_dataCOMMON.datain[i].LOAD != '' &&
            _dataCOMMON.datain[i].LOAD != '-') {
          Loadin = "( Load ${_dataCOMMON.datain[i].LOAD} )";
        }
        ReportPDFCommon2var.datalist[i].ITEMname =
            " ${_dataCOMMON.datain[i].ITEMname} ${Loadin}";
        ReportPDFCommon2var.datalist[i].SCMARK = _dataCOMMON.datain[i].SCMARK;
        ReportPDFCommon2var.datalist[i].METHODname =
            _dataCOMMON.datain[i].METHODname;
        ReportPDFCommon2var.datalist[i].FREQ = _dataCOMMON.datain[i].FREQ;
        ReportPDFCommon2var.datalist[i].SPECIFICATIONname =
            _dataCOMMON.datain[i].SPECIFICATION;
        ReportPDFCommon2var.datalist[i].RESULT = _dataCOMMON.datain[i].RESULT;
        //print(ReportPDFCommon2var.datalist[i].RESULT.length);
        //Surface Hardness

        if (_dataCOMMON.datain[i].ITEMname.contains('Hardness') ||
            _dataCOMMON.datain[i].ITEMname.contains('hardness')) {
          for (var li = 0;
              li < _dataCOMMON.datain[i].datapackset.length;
              li++) {
            // print(_dataCOMMON.datain[i].datapackset[li].dimensionX);

            if (_dataCOMMON.datain[i].datapackset[li].dimensionX == 0) {}
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 1) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '1',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA01,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '2',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '3',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '4',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '5',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '6',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '7',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '8',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '9',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '10',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '11',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '12',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '13',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '14',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '15',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '16',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '17',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '18',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '19',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
              ReportPDFCommon2var.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '20',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA20,
              ));
            }
            HardnessNO++;
            // print('>>${HardnessNO}');
          }
        }
        //Compound Layer

        if (_dataCOMMON.datain[i].ITEMname.contains('Compound') ||
            _dataCOMMON.datain[i].ITEMname.contains('compound') ||
            _dataCOMMON.datain[i].ITEMname.contains('Total')) {
          ReportPDFCommon2var.commp = _dataCOMMON.datain[i].ITEMname;

          for (var li = 0;
              li < _dataCOMMON.datain[i].datapackset.length;
              li++) {
            // print(_dataCOMMON.datain[i].datapackset[li].dimensionX);
            // print(_dataCOMMON.datain[i].datapackset[li].dimensionY);

            if (_dataCOMMON.datain[i].datapackset[li].dimensionX == 0) {}
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 1) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '1',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA01,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '2',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '3',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '4',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '5',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '6',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '7',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '8',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '9',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '10',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '11',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '12',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '13',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '14',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '15',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '16',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '17',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '18',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '19',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
              ReportPDFCommon2var.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '20',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA20,
              ));
            }
            CompoundNO++;
          }
        }
        if (

            // _dataCOMMON.datain[i].ITEMname.contains('Compound') ||
            //   _dataCOMMON.datain[i].ITEMname.contains('compound') ||
            // _dataCOMMON.datain[i].ITEMname.contains('Total'))
            _dataCOMMON.datain[i].ITEMname.contains('Dia')) {
          // ReportPDFCommon2var.commp = _dataCOMMON.datain[i].ITEMname;

          for (var li = 0;
              li < _dataCOMMON.datain[i].datapackset.length;
              li++) {
            // print(_dataCOMMON.datain[i].datapackset[li].dimensionX);
            // print(_dataCOMMON.datain[i].datapackset[li].dimensionY);

            // if (_dataCOMMON.datain[i].datapackset[li].dimensionX == 0) {}
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 1) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '1',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA01,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '2',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '3',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '4',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '5',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '6',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '7',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '8',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '9',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '10',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '11',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '12',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '13',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '14',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '15',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '16',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '17',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '18',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '19',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
              ReportPDFCommon2var.rawlistDia.add(rawlist(
                DATANO: DiaNO.toString(),
                DATAPCS: '20',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA20,
              ));
            }
            DiaNO++;
          }
        }
        // Roughness

        if (_dataCOMMON.datain[i].ITEMname.contains('Roughness') ||
            _dataCOMMON.datain[i].ITEMname.contains('roughness')) {
          for (var li = 0;
              li < _dataCOMMON.datain[i].datapackset.length;
              li++) {
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX == 0) {}
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 1) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '1',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA01,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '2',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '3',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '4',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '5',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '6',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '7',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '8',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '9',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '10',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '11',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '12',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '13',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '14',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '15',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '16',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '17',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '18',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '19',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
              ReportPDFCommon2var.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '20',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA20,
              ));
            }
            RoughnessNO++;
          }
        }
      }

      // print(ReportPDFCommon2var.datalist);
    } else {
      ReportPDFCommon2var.STATUS = 'WATTING or NO-DATA';

      ReportPDFCommon2var.CUSTOMER = '';
      ReportPDFCommon2var.PROCESS = '';
      ReportPDFCommon2var.PARTNAME = '';
      ReportPDFCommon2var.PARTNO = '';
      ReportPDFCommon2var.CUSLOT = '';
      ReportPDFCommon2var.TPKLOT = '';
      ReportPDFCommon2var.MATERIAL = '';
      ReportPDFCommon2var.QTY = '';

      ReportPDFCommon2var.PICstd = '';
      ReportPDFCommon2var.PIC01 = '';
      ReportPDFCommon2var.PIC02 = '';

      ReportPDFCommon2var.INC01 = '';
      ReportPDFCommon2var.INC02 = '';

      ReportPDFCommon2var.rawlistHardness = [];
      ReportPDFCommon2var.rawlistCompound = [];
      ReportPDFCommon2var.rawlistRoughness = [];
      ReportPDFCommon2var.rawlistCORE = [];

      ReportPDFCommon2var.datalist = [
        ReportPDFCommon2list(),
        ReportPDFCommon2list(),
        ReportPDFCommon2list(),
        ReportPDFCommon2list(),
        ReportPDFCommon2list(),
        ReportPDFCommon2list(),
        ReportPDFCommon2list(),
        ReportPDFCommon2list(),
        ReportPDFCommon2list(),
        ReportPDFCommon2list(),
        ReportPDFCommon2list(),
        ReportPDFCommon2list(),
        ReportPDFCommon2list(),
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
                  isContr: ReportPDFCommon2var.iscontrol,
                  fnContr: (input) {
                    setState(() {
                      ReportPDFCommon2var.iscontrol = input;
                    });
                  },
                  isEnabled: ReportPDFCommon2var.canf,
                  sValue: ReportPDFCommon2var.PO,
                  returnfunc: (String s) {
                    ReportPDFCommon2var.PO = s;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {
                    if (ReportPDFCommon2var.PO != '') {
                      context
                          .read<ReportPDFCommon_Cubit>()
                          .ReportPDFCommonCubit(ReportPDFCommon2var.PO);
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
                    context.read<ReportPDFCommon_Cubit>().Flush();
                    ReportPDFCommon2var.canf = true;
                    ReportPDFCommon2var.iscontrol = true;
                    ReportPDFCommon2var.PO = '';
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
                  color: ReportPDFCommon2var.STATUS == 'REPORT READY'
                      ? Colors.green
                      : Colors.yellow,
                  height: 40,
                  width: 200,
                  child: Center(
                    child: Text(ReportPDFCommon2var.STATUS),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  height: 40,
                  width: 150,
                  child: AdvanceDropDown(
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: const [
                      MapEntry("-", "-"),
                      MapEntry("TYPE01", "1"),
                      MapEntry("ihara", "2"),
                      MapEntry("TYPE03", "3"),
                      MapEntry("KJN", "4"),
                      MapEntry("KMT", "5"),
                    ],
                    onChangeinside: (d, v) {
                      // print(d);
                      ReportPDFCommon2var.TYPE = d;
                      if (d == '2') {
                        setState(() {
                          ReportPDFCommon2var.SCMASKTYPE = SCMASK02;
                        });
                      } else if (d == '3') {
                        setState(() {
                          ReportPDFCommon2var.SCMASKTYPE = SCMASK04;
                        });
                      } else if (d == '4') {
                        setState(() {
                          ReportPDFCommon2var.SCMASKTYPE = new19062401;
                        });
                      } else if (d == '5') {
                        setState(() {
                          ReportPDFCommon2var.SCMASKTYPE = new19062402;
                        });
                      } else {
                        setState(() {
                          ReportPDFCommon2var.SCMASKTYPE = SCMASK03;
                        });
                      }
                    },
                    value: ReportPDFCommon2var.TYPE,
                    height: 40,
                    width: 100,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  height: 40,
                  width: 150,
                  child: AdvanceDropDown(
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: const [
                      MapEntry("", "-"),
                      MapEntry("SUM", "SUM"),
                    ],
                    onChangeinside: (d, v) {
                      // print(d);
                      RepoteData.SUMLOT = d;
                      context
                          .read<ReportPDFCommon_Cubit>()
                          .ReportPDFCommonCubit(ReportPDFCommon2var.PO);
                    },
                    value: RepoteData.SUMLOT,
                    height: 40,
                    width: 100,
                  ),
                ),
              ),
              if (ReportPDFCommon2var.PASS == "PASSED") ...[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: InkWell(
                    onTap: () {
                      PDFloader(context);
                      Future.delayed(const Duration(milliseconds: 1000), () {
                        captureToback(
                          _globalKey,
                          ReportPDFCommon2var.PO,
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
              ] else ...[
                if (USERDATA.UserLV > 5) ...[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: InkWell(
                      onTap: () {
                        ReportPDFCommon2var.PASS = "N/A";
                        setState(() {});
                        PDFloader(context);
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          captureToback(
                            _globalKey,
                            ReportPDFCommon2var.PO,
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
                ]
              ],
            ],
          ),

          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 60),
          //       child: ComInputText(
          //         sLabel: "Remark",
          //         height: 40,
          //         width: 500,
          //         nLimitedChar: 500,
          //         isContr: ReportPDFCommon2var.iscontrol,
          //         fnContr: (input) {
          //           setState(() {
          //             ReportPDFCommon2var.iscontrol = input;
          //           });
          //         },
          //         // isEnabled: ReportPDFCommon2var.canf,
          //         sValue: ReportPDFCommon2var.remark,
          //         returnfunc: (String s) {
          //           setState(() {
          //             ReportPDFCommon2var.remark = s;
          //           });
          //         },
          //       ),
          //     ),
          //   ],
          // ),

          Row(children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                onTap: () {
                  P303QMMASTERQCVAR.SETDAY = 'OK';
                  P303QMMASTERQCVAR.SEARCH = ReportPDFCommon2var.PO;
                  var now = DateTime.now().subtract(Duration(days: 25));
                  P303QMMASTERQCVAR.day = DateFormat('dd').format(now);
                  P303QMMASTERQCVAR.month = DateFormat('MM').format(now);
                  P303QMMASTERQCVAR.year = DateFormat('yyyy').format(now);
                  STDreport2(context);
                },
                child: Container(
                  color: Colors.yellow,
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text("UD and QCFN"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                onTap: () {
                  //ReportPDFCommon2var.PO
                  QCFN(context);
                },
                child: Container(
                  color: Colors.yellow,
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text("_QCFN"),
                  ),
                ),
              ),
            ),
          ]),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: RepaintBoundary(
              key: _globalKey,
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
                                      ReportPDFCommon2var.CUSTOMER,
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
                                    ReportPDFCommon2var.PROCESS,
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
                                      ReportPDFCommon2var.PARTNAME,
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
                                    ReportPDFCommon2var.PARTNO,
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
                                      ReportPDFCommon2var.CUSLOT,
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
                                      ReportPDFCommon2var.TPKLOT,
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
                                    ReportPDFCommon2var.MATERIAL,
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
                                    ReportPDFCommon2var.QTY,
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
                                ListFlex: const [6, 1, 4, 2, 2, 2, 2],
                                widget01: Center(
                                  child: Text(
                                    ReportPDFCommon2var.INC01 != ''
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
                                    ReportPDFCommon2var.INC01 != ''
                                        ? "Visual"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommon2var.INC01 != ''
                                        ? "10 pcs/rcv.Lot"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommon2var.INC01 != ''
                                        ? "No Rust"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommon2var.INC01 != ''
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
                                    ReportPDFCommon2var.INC02 != ''
                                        ? "Appearance for scratch"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: Text(
                                    ReportPDFCommon2var.INC02 != '' ? "" : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommon2var.INC02 != ''
                                        ? "Visual"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommon2var.INC02 != ''
                                        ? "10 pcs/rcv.Lot"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommon2var.INC02 != ''
                                        ? "No Scratch"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommon2var.INC02 != ''
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
                                    ReportPDFCommon2var.datalist[0].ITEMname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFCommon2var
                                              .datalist[0].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 42,
                                          height: 42,
                                          base64:
                                              ReportPDFCommon2var.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[0].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[0].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                        .datalist[0].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommon2var.datalist[0]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[0].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommon2var
                                                  .datalist[0].RESULT.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                              ),
                              BODY7SLOT(
                                ListFlex: [6, 1, 4, 2, 2, 2, 2],
                                widget01: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[1].ITEMname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFCommon2var
                                              .datalist[1].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 42,
                                          height: 42,
                                          base64:
                                              ReportPDFCommon2var.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[1].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[1].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                        .datalist[1].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommon2var.datalist[1]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[1].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommon2var
                                                  .datalist[1].RESULT.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                              ),
                              BODY7SLOT(
                                ListFlex: [6, 1, 4, 2, 2, 2, 2],
                                widget01: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[2].ITEMname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFCommon2var
                                              .datalist[2].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 42,
                                          height: 42,
                                          base64:
                                              ReportPDFCommon2var.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[2].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[2].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                        .datalist[2].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommon2var.datalist[2]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[2].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommon2var
                                                  .datalist[2].RESULT.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                              ),
                              BODY7SLOT(
                                ListFlex: [6, 1, 4, 2, 2, 2, 2],
                                widget01: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[3].ITEMname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFCommon2var
                                              .datalist[3].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 42,
                                          height: 42,
                                          base64:
                                              ReportPDFCommon2var.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[3].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[3].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                        .datalist[3].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommon2var.datalist[3]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[3].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommon2var
                                                  .datalist[3].RESULT.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                              ),
                              BODY7SLOT(
                                ListFlex: [6, 1, 4, 2, 2, 2, 2],
                                widget01: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[4].ITEMname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFCommon2var
                                              .datalist[4].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 42,
                                          height: 42,
                                          base64:
                                              ReportPDFCommon2var.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[4].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[4].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                        .datalist[4].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommon2var.datalist[4]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommon2var.datalist[4].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommon2var
                                                  .datalist[4].RESULT.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                              ),
                              // BODY7SLOT(
                              //   ListFlex: [6, 1, 4, 2, 2, 2, 2],
                              //   widget01: Center(
                              //     child: Text(
                              //       ReportPDFCommon2var.datalist[5].ITEMname,
                              //       style: const TextStyle(
                              //         fontSize: 16,
                              //       ),
                              //     ),
                              //   ),
                              //   widget02: Center(
                              //     child: ReportPDFCommon2var
                              //                 .datalist[5].SCMARK ==
                              //             'YES'
                              //         ? PicShow(
                              //             width: 42,
                              //             height: 42,
                              //             base64:
                              //                 ReportPDFCommon2var.SCMASKTYPE)
                              //         : const Text(
                              //             "",
                              //             style: TextStyle(
                              //               fontSize: 16,
                              //             ),
                              //           ),
                              //   ),
                              //   widget03: Center(
                              //     child: Text(
                              //       ReportPDFCommon2var.datalist[5].METHODname,
                              //       style: const TextStyle(
                              //         fontSize: 16,
                              //       ),
                              //     ),
                              //   ),
                              //   widget04: Center(
                              //     child: Text(
                              //       ReportPDFCommon2var.datalist[5].FREQ,
                              //       style: const TextStyle(
                              //         fontSize: 16,
                              //       ),
                              //     ),
                              //   ),
                              //   widget05: Center(
                              //     child: Text(
                              //       ReportPDFCommon2var
                              //           .datalist[5].SPECIFICATIONname,
                              //       style: TextStyle(
                              //         fontSize: ReportPDFCommon2var.datalist[5]
                              //                     .SPECIFICATIONname.length >
                              //                 30
                              //             ? 12
                              //             : 16,
                              //       ),
                              //     ),
                              //   ),
                              //   widget06: Center(
                              //     child: Text(
                              //       ReportPDFCommon2var.datalist[5].RESULT,
                              //       style: TextStyle(
                              //         fontSize: ReportPDFCommon2var
                              //                     .datalist[5].RESULT.length >
                              //                 30
                              //             ? 12
                              //             : 16,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // BODY7SLOT(
                              //   ListFlex: [6, 1, 4, 2, 2, 2, 2],
                              //   widget01: Center(
                              //     child: Text(
                              //       ReportPDFCommon2var.datalist[6].ITEMname,
                              //       style: const TextStyle(
                              //         fontSize: 16,
                              //       ),
                              //     ),
                              //   ),
                              //   widget02: Center(
                              //     child: ReportPDFCommon2var
                              //                 .datalist[6].SCMARK ==
                              //             'YES'
                              //         ? PicShow(
                              //             width: 42,
                              //             height: 42,
                              //             base64:
                              //                 ReportPDFCommon2var.SCMASKTYPE)
                              //         : const Text(
                              //             "",
                              //             style: TextStyle(
                              //               fontSize: 16,
                              //             ),
                              //           ),
                              //   ),
                              //   widget03: Center(
                              //     child: Text(
                              //       ReportPDFCommon2var.datalist[6].METHODname,
                              //       style: const TextStyle(
                              //         fontSize: 16,
                              //       ),
                              //     ),
                              //   ),
                              //   widget04: Center(
                              //     child: Text(
                              //       ReportPDFCommon2var.datalist[6].FREQ,
                              //       style: const TextStyle(
                              //         fontSize: 16,
                              //       ),
                              //     ),
                              //   ),
                              //   widget05: Center(
                              //     child: Text(
                              //       ReportPDFCommon2var
                              //           .datalist[6].SPECIFICATIONname,
                              //       style: TextStyle(
                              //         fontSize: ReportPDFCommon2var.datalist[6]
                              //                     .SPECIFICATIONname.length >
                              //                 30
                              //             ? 12
                              //             : 16,
                              //       ),
                              //     ),
                              //   ),
                              //   widget06: Center(
                              //     child: Text(
                              //       ReportPDFCommon2var.datalist[6].RESULT,
                              //       style: TextStyle(
                              //         fontSize: ReportPDFCommon2var
                              //                     .datalist[6].RESULT.length >
                              //                 30
                              //             ? 12
                              //             : 16,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(
                                height: 5,
                              ),
                              //-------->
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
                                widget02: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            1
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[0].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            2
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[1].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            3
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[2].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            4
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[3].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            5
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[4].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget07: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            6
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[5].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget08: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            7
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[6].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget09: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            8
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[7].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget10: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            9
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[8].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget11: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            10
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[9].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget12: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            11
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[10].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget13: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            12
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[11].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget14: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            13
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[12].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget15: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            14
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[13].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget16: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            15
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[14].DATANO
                                        : '',
                                    style: const TextStyle(
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
                                widget02: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            1
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[0].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            2
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[1].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            3
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[2].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            4
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[3].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            5
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[4].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget07: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            6
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[5].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget08: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            7
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[6].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget09: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            8
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[7].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget10: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            9
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[8].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget11: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            10
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[9].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget12: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            11
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[10].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget13: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            12
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[11].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget14: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            13
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[12].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget15: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            14
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[13].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget16: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            15
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[14].DATAPCS
                                        : '',
                                    style: const TextStyle(
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
                                widget02: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            1
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[0].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            2
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[1].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            3
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[2].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            4
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[3].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            5
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[4].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget07: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            6
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[5].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget08: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            7
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[6].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget09: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            8
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[7].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget10: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            9
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[8].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget11: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            10
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[9].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget12: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            11
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[10].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget13: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            12
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[11].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget14: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            13
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[12].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget15: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            14
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[13].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget16: Center(
                                  child: Text(
                                    ReportPDFCommon2var
                                                .rawlistHardness.length >=
                                            15
                                        ? ReportPDFCommon2var
                                            .rawlistHardness[14].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              //-------->
                              SizedBox(
                                height: 5,
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
                                widget02: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 1
                                        ? ReportPDFCommon2var
                                            .rawlistDia[0].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 2
                                        ? ReportPDFCommon2var
                                            .rawlistDia[1].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 3
                                        ? ReportPDFCommon2var
                                            .rawlistDia[2].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 4
                                        ? ReportPDFCommon2var
                                            .rawlistDia[3].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 5
                                        ? ReportPDFCommon2var
                                            .rawlistDia[4].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget07: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 6
                                        ? ReportPDFCommon2var
                                            .rawlistDia[5].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget08: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 7
                                        ? ReportPDFCommon2var
                                            .rawlistDia[6].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget09: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 8
                                        ? ReportPDFCommon2var
                                            .rawlistDia[7].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget10: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 9
                                        ? ReportPDFCommon2var
                                            .rawlistDia[8].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget11: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 10
                                        ? ReportPDFCommon2var
                                            .rawlistDia[9].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget12: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 11
                                        ? ReportPDFCommon2var
                                            .rawlistDia[10].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget13: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 12
                                        ? ReportPDFCommon2var
                                            .rawlistDia[11].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget14: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 13
                                        ? ReportPDFCommon2var
                                            .rawlistDia[12].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget15: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 14
                                        ? ReportPDFCommon2var
                                            .rawlistDia[13].DATANO
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget16: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 15
                                        ? ReportPDFCommon2var
                                            .rawlistDia[14].DATANO
                                        : '',
                                    style: const TextStyle(
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
                                widget02: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 1
                                        ? ReportPDFCommon2var
                                            .rawlistDia[0].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 2
                                        ? ReportPDFCommon2var
                                            .rawlistDia[1].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 3
                                        ? ReportPDFCommon2var
                                            .rawlistDia[2].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 4
                                        ? ReportPDFCommon2var
                                            .rawlistDia[3].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 5
                                        ? ReportPDFCommon2var
                                            .rawlistDia[4].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget07: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 6
                                        ? ReportPDFCommon2var
                                            .rawlistDia[5].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget08: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 7
                                        ? ReportPDFCommon2var
                                            .rawlistDia[6].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget09: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 8
                                        ? ReportPDFCommon2var
                                            .rawlistDia[7].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget10: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 9
                                        ? ReportPDFCommon2var
                                            .rawlistDia[8].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget11: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 10
                                        ? ReportPDFCommon2var
                                            .rawlistDia[9].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget12: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 11
                                        ? ReportPDFCommon2var
                                            .rawlistDia[10].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget13: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 12
                                        ? ReportPDFCommon2var
                                            .rawlistDia[11].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget14: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 13
                                        ? ReportPDFCommon2var
                                            .rawlistDia[12].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget15: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 14
                                        ? ReportPDFCommon2var
                                            .rawlistDia[13].DATAPCS
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget16: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 15
                                        ? ReportPDFCommon2var
                                            .rawlistDia[14].DATAPCS
                                        : '',
                                    style: const TextStyle(
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
                                    "Diameter",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 1
                                        ? ReportPDFCommon2var.rawlistDia[0].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 2
                                        ? ReportPDFCommon2var.rawlistDia[1].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 3
                                        ? ReportPDFCommon2var.rawlistDia[2].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 4
                                        ? ReportPDFCommon2var.rawlistDia[3].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 5
                                        ? ReportPDFCommon2var.rawlistDia[4].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget07: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 6
                                        ? ReportPDFCommon2var.rawlistDia[5].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget08: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 7
                                        ? ReportPDFCommon2var.rawlistDia[6].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget09: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 8
                                        ? ReportPDFCommon2var.rawlistDia[7].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget10: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 9
                                        ? ReportPDFCommon2var.rawlistDia[8].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget11: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 10
                                        ? ReportPDFCommon2var.rawlistDia[9].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget12: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 11
                                        ? ReportPDFCommon2var
                                            .rawlistDia[10].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget13: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 12
                                        ? ReportPDFCommon2var
                                            .rawlistDia[11].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget14: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 13
                                        ? ReportPDFCommon2var
                                            .rawlistDia[12].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget15: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 14
                                        ? ReportPDFCommon2var
                                            .rawlistDia[13].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                widget16: Center(
                                  child: Text(
                                    ReportPDFCommon2var.rawlistDia.length >= 15
                                        ? ReportPDFCommon2var
                                            .rawlistDia[14].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              //-------->
                              PICSLO2SIDE(
                                PIC01: _dataCOMMON.databasic.PIC01,
                                PIC02: _dataCOMMON.databasic.PIC02,
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
                                      widget02: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  1
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[0].DATANO
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  2
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[1].DATANO
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  3
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[2].DATANO
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  4
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[3].DATANO
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  5
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[4].DATANO
                                              : '',
                                          style: const TextStyle(
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
                                      widget02: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  1
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[0].DATAPCS
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  2
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[1].DATAPCS
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  3
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[2].DATAPCS
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  4
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[3].DATAPCS
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  5
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[4].DATAPCS
                                              : '',
                                          style: const TextStyle(
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
                                      widget02: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  1
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[0].DATA
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  2
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[1].DATA
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  3
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[2].DATA
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  4
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[3].DATA
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFCommon2var.rawlistRoughness
                                                      .length >=
                                                  5
                                              ? ReportPDFCommon2var
                                                  .rawlistRoughness[4].DATA
                                              : '',
                                          style: const TextStyle(
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
                                      widget02: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  1
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[0].DATANO
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  2
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[1].DATANO
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  3
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[2].DATANO
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  4
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[3].DATANO
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  5
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[4].DATANO
                                              : '',
                                          style: const TextStyle(
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
                                      widget02: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  1
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[0].DATAPCS
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  2
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[1].DATAPCS
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  3
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[2].DATAPCS
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  4
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[3].DATAPCS
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  5
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[4].DATAPCS
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BODY6SLOT(
                                      ListFlex: [2, 1, 1, 1, 1, 1],
                                      widget01: Center(
                                        child: Text(
                                          ReportPDFCommon2var.commp,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget02: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  1
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[0].DATA
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget03: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  2
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[1].DATA
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget04: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  3
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[2].DATA
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget05: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  4
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[3].DATA
                                              : '',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget06: Center(
                                        child: Text(
                                          ReportPDFCommon2var
                                                      .rawlistCompound.length >=
                                                  5
                                              ? ReportPDFCommon2var
                                                  .rawlistCompound[4].DATA
                                              : '',
                                          style: const TextStyle(
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
                                PASS: ReportPDFCommon2var.PASS,
                                PICS: _dataCOMMON.databasic.PICstd,
                                Remark: ReportPDFCommon2var.remark,
                                NAME01: "",
                                NAME02: "",
                                NAME03: "Saowapak",
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
