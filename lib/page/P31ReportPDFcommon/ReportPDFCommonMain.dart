import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Cubit/31-ReportPDFCommoncubit.dart';
import '../../widget/ReportComponent/CommonReport.dart';
import '../../widget/ReportComponent/PicSlot.dart';
import '../../widget/ReportComponent/SignSide.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';
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
    if (ReportPDFCommonvar.PO != '') {
      ReportPDFCommonvar.canf = false;
      context
          .read<ReportPDFCommon_Cubit>()
          .ReportPDFCommonCubit(ReportPDFCommonvar.PO);
    }
    super.initState();
  }

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ReportPDFCommoncontext = context;

    CommonReportOutput _dataCOMMON = widget.dataCommon ??
        CommonReportOutput(
          databasic: BasicCommonDATA(),
        );
    int HardnessNO = 1;
    int CompoundNO = 1;
    int RoughnessNO = 1;
    if (_dataCOMMON.datain.isNotEmpty) {
      //
      ReportPDFCommonvar.STATUS = 'REPORT READY';
      ReportPDFCommonvar.CUSTOMER = _dataCOMMON.databasic.CUSTOMER;
      ReportPDFCommonvar.PROCESS = _dataCOMMON.databasic.PROCESS;
      ReportPDFCommonvar.PARTNAME = _dataCOMMON.databasic.PARTNAME;
      ReportPDFCommonvar.PARTNO = _dataCOMMON.databasic.PARTNO;
      ReportPDFCommonvar.CUSLOT = _dataCOMMON.databasic.CUSLOT;
      ReportPDFCommonvar.TPKLOT = _dataCOMMON.databasic.TPKLOT;
      ReportPDFCommonvar.MATERIAL = _dataCOMMON.databasic.MATERIAL;
      if (_dataCOMMON.databasic.UNITSAP.toUpperCase() != 'KG') {
        ReportPDFCommonvar.QTY =
            '${double.parse(ConverstStr(_dataCOMMON.databasic.QTY)).toStringAsFixed(0)} ${_dataCOMMON.databasic.UNITSAP}';
      } else {
        ReportPDFCommonvar.QTY =
            '${double.parse(ConverstStr(_dataCOMMON.databasic.QTY)).toStringAsFixed(1)} ${_dataCOMMON.databasic.UNITSAP}';
      }

      ReportPDFCommonvar.PIC01 = _dataCOMMON.databasic.PIC01;
      ReportPDFCommonvar.PIC02 = _dataCOMMON.databasic.PIC02;
      ReportPDFCommonvar.PICstd = _dataCOMMON.databasic.PICstd;

      ReportPDFCommonvar.PASS = _dataCOMMON.databasic.PASS;
      ReportPDFCommonvar.remark = '';

      ReportPDFCommonvar.INC01 = _dataCOMMON.databasic.INC01;
      ReportPDFCommonvar.INC02 = _dataCOMMON.databasic.INC02;

      if (_dataCOMMON.databasic.PARTNAMEref != '') {
        ReportPDFCommonvar.remark =
            'Reference data from\n${_dataCOMMON.databasic.PARTNAMEref}\n${_dataCOMMON.databasic.PARTref}';
      }
//remark

      // print(_dataCOMMON.datain[0]);
      // print(_dataCOMMON.datain.length);

      for (var i = 0; i < _dataCOMMON.datain.length; i++) {
        String Loadin = '';
        if (_dataCOMMON.datain[i].LOAD != '' &&
            _dataCOMMON.datain[i].LOAD != '-') {
          Loadin = "( Load ${_dataCOMMON.datain[i].LOAD} )";
        }
        ReportPDFCommonvar.datalist[i].ITEMname =
            " ${_dataCOMMON.datain[i].ITEMname} ${Loadin}";
        ReportPDFCommonvar.datalist[i].SCMARK = _dataCOMMON.datain[i].SCMARK;
        ReportPDFCommonvar.datalist[i].METHODname =
            _dataCOMMON.datain[i].METHODname;
        ReportPDFCommonvar.datalist[i].FREQ = _dataCOMMON.datain[i].FREQ;
        ReportPDFCommonvar.datalist[i].SPECIFICATIONname =
            _dataCOMMON.datain[i].SPECIFICATION;
        ReportPDFCommonvar.datalist[i].RESULT = _dataCOMMON.datain[i].RESULT;
        //print(ReportPDFCommonvar.datalist[i].RESULT.length);
        //Surface Hardness

        if (_dataCOMMON.datain[i].ITEMname.contains('Hardness') ||
            _dataCOMMON.datain[i].ITEMname.contains('hardness')) {
          for (var li = 0;
              li < _dataCOMMON.datain[i].datapackset.length;
              li++) {
            // print(_dataCOMMON.datain[i].datapackset[li].dimensionX);

            if (_dataCOMMON.datain[i].datapackset[li].dimensionX == 0) {}
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 1) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '1',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA01,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '2',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '3',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '4',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '5',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '6',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '7',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '8',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '9',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '10',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '11',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '12',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '13',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '14',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '15',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '16',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '17',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '18',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
                DATANO: HardnessNO.toString(),
                DATAPCS: '19',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
              ReportPDFCommonvar.rawlistHardness.add(rawlist(
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
          ReportPDFCommonvar.commp = _dataCOMMON.datain[i].ITEMname;

          for (var li = 0;
              li < _dataCOMMON.datain[i].datapackset.length;
              li++) {
            // print(_dataCOMMON.datain[i].datapackset[li].dimensionX);
            // print(_dataCOMMON.datain[i].datapackset[li].dimensionY);

            if (_dataCOMMON.datain[i].datapackset[li].dimensionX == 0) {}
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 1) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '1',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA01,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '2',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '3',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '4',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '5',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '6',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '7',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '8',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '9',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '10',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '11',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '12',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '13',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '14',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '15',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '16',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '17',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '18',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '19',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
              ReportPDFCommonvar.rawlistCompound.add(rawlist(
                DATANO: CompoundNO.toString(),
                DATAPCS: '20',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA20,
              ));
            }
            CompoundNO++;
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
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '1',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA01,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 2) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '2',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA02,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 3) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '3',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA03,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 4) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '4',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA04,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 5) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '5',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA05,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 6) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '6',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA06,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 7) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '7',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA07,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 8) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '8',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA08,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 9) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '9',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA09,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 10) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '10',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA10,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 11) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '11',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA11,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 12) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '12',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA12,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 13) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '13',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA13,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 14) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '14',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA14,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 15) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '15',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA15,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 16) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '16',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA16,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 17) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '17',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA17,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 18) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '18',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA18,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 19) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '19',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA19,
              ));
            }
            if (_dataCOMMON.datain[i].datapackset[li].dimensionX >= 20) {
              ReportPDFCommonvar.rawlistRoughness.add(rawlist(
                DATANO: RoughnessNO.toString(),
                DATAPCS: '20',
                DATA: _dataCOMMON.datain[i].datapackset[li].DATA20,
              ));
            }
            RoughnessNO++;
          }
        }
      }

      // print(ReportPDFCommonvar.datalist);
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
                    if (ReportPDFCommonvar.PO != '') {
                      context
                          .read<ReportPDFCommon_Cubit>()
                          .ReportPDFCommonCubit(ReportPDFCommonvar.PO);
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
                    ReportPDFCommonvar.canf = true;
                    ReportPDFCommonvar.iscontrol = true;
                    ReportPDFCommonvar.PO = '';
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
                      MapEntry("TYPE02", "2"),
                    ],
                    onChangeinside: (d, v) {
                      // print(d);
                      ReportPDFCommonvar.TYPE = d;
                      if (d == '2') {
                        setState(() {
                          ReportPDFCommonvar.SCMASKTYPE = SCMASK02;
                        });
                      } else {
                        setState(() {
                          ReportPDFCommonvar.SCMASKTYPE = SCMASK03;
                        });
                      }
                    },
                    value: ReportPDFCommonvar.TYPE,
                    height: 40,
                    width: 100,
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
          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 60),
          //       child: ComInputText(
          //         sLabel: "Remark",
          //         height: 40,
          //         width: 500,
          //         nLimitedChar: 500,
          //         isContr: ReportPDFCommonvar.iscontrol,
          //         fnContr: (input) {
          //           setState(() {
          //             ReportPDFCommonvar.iscontrol = input;
          //           });
          //         },
          //         // isEnabled: ReportPDFCommonvar.canf,
          //         sValue: ReportPDFCommonvar.remark,
          //         returnfunc: (String s) {
          //           setState(() {
          //             ReportPDFCommonvar.remark = s;
          //           });
          //         },
          //       ),
          //     ),
          //   ],
          // ),
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
                                ListFlex: const [6, 1, 4, 2, 2, 2, 2],
                                widget01: Center(
                                  child: Text(
                                    ReportPDFCommonvar.INC01 != ''
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
                                    ReportPDFCommonvar.INC01 != ''
                                        ? "Visual"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommonvar.INC01 != ''
                                        ? "10 pcs/rcv.Lot"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommonvar.INC01 != ''
                                        ? "No Rust"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommonvar.INC01 != ''
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
                                    ReportPDFCommonvar.INC02 != ''
                                        ? "Appearance for scratch"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: Text(
                                    ReportPDFCommonvar.INC02 != '' ? "" : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommonvar.INC02 != ''
                                        ? "Visual"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommonvar.INC02 != ''
                                        ? "10 pcs/rcv.Lot"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommonvar.INC02 != ''
                                        ? "No Scratch"
                                        : "",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommonvar.INC02 != ''
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
                                    ReportPDFCommonvar.datalist[0].ITEMname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFCommonvar
                                              .datalist[0].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 42,
                                          height: 42,
                                          base64: ReportPDFCommonvar.SCMASKTYPE)
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
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar.datalist[0]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommonvar.datalist[0].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar
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
                                    ReportPDFCommonvar.datalist[1].ITEMname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFCommonvar
                                              .datalist[1].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 42,
                                          height: 42,
                                          base64: ReportPDFCommonvar.SCMASKTYPE)
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
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar.datalist[1]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommonvar.datalist[1].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar
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
                                    ReportPDFCommonvar.datalist[2].ITEMname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFCommonvar
                                              .datalist[2].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 42,
                                          height: 42,
                                          base64: ReportPDFCommonvar.SCMASKTYPE)
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
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar.datalist[2]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommonvar.datalist[2].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar
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
                                    ReportPDFCommonvar.datalist[3].ITEMname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFCommonvar
                                              .datalist[3].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 42,
                                          height: 42,
                                          base64: ReportPDFCommonvar.SCMASKTYPE)
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
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar.datalist[3]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommonvar.datalist[3].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar
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
                                    ReportPDFCommonvar.datalist[4].ITEMname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFCommonvar
                                              .datalist[4].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 42,
                                          height: 42,
                                          base64: ReportPDFCommonvar.SCMASKTYPE)
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
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar.datalist[4]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommonvar.datalist[4].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar
                                                  .datalist[4].RESULT.length >
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
                                    ReportPDFCommonvar.datalist[5].ITEMname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFCommonvar
                                              .datalist[5].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 42,
                                          height: 42,
                                          base64: ReportPDFCommonvar.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommonvar.datalist[5].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommonvar.datalist[5].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommonvar
                                        .datalist[5].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar.datalist[5]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommonvar.datalist[5].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar
                                                  .datalist[5].RESULT.length >
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
                                    ReportPDFCommonvar.datalist[6].ITEMname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget02: Center(
                                  child: ReportPDFCommonvar
                                              .datalist[6].SCMARK ==
                                          'YES'
                                      ? PicShow(
                                          width: 42,
                                          height: 42,
                                          base64: ReportPDFCommonvar.SCMASKTYPE)
                                      : const Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                                widget03: Center(
                                  child: Text(
                                    ReportPDFCommonvar.datalist[6].METHODname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget04: Center(
                                  child: Text(
                                    ReportPDFCommonvar.datalist[6].FREQ,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                widget05: Center(
                                  child: Text(
                                    ReportPDFCommonvar
                                        .datalist[6].SPECIFICATIONname,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar.datalist[6]
                                                  .SPECIFICATIONname.length >
                                              30
                                          ? 12
                                          : 16,
                                    ),
                                  ),
                                ),
                                widget06: Center(
                                  child: Text(
                                    ReportPDFCommonvar.datalist[6].RESULT,
                                    style: TextStyle(
                                      fontSize: ReportPDFCommonvar
                                                  .datalist[6].RESULT.length >
                                              30
                                          ? 12
                                          : 16,
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
                                widget02: Center(
                                  child: Text(
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            1
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            2
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            3
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            4
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            5
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            6
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            7
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            8
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            9
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            10
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            11
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            12
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            13
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            14
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            15
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            1
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            2
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            3
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            4
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            5
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            6
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            7
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            8
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            9
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            10
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            11
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            12
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            13
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            14
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            15
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            1
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            2
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            3
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            4
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            5
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            6
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            7
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            8
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            9
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            10
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            11
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            12
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            13
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            14
                                        ? ReportPDFCommonvar
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
                                    ReportPDFCommonvar.rawlistHardness.length >=
                                            15
                                        ? ReportPDFCommonvar
                                            .rawlistHardness[14].DATA
                                        : '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  1
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  2
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  3
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  4
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  5
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  1
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  2
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  3
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  4
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  5
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  1
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  2
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  3
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  4
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.rawlistRoughness
                                                      .length >=
                                                  5
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  1
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  2
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  3
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  4
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  5
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  1
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  2
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  3
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  4
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  5
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar.commp,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      widget02: Center(
                                        child: Text(
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  1
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  2
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  3
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  4
                                              ? ReportPDFCommonvar
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
                                          ReportPDFCommonvar
                                                      .rawlistCompound.length >=
                                                  5
                                              ? ReportPDFCommonvar
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
                                PASS: ReportPDFCommonvar.PASS,
                                PICS: _dataCOMMON.databasic.PICstd,
                                Remark: ReportPDFCommonvar.remark,
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
