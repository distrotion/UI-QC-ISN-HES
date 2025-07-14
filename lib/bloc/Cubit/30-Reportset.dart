import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/ACTtestdata.dart';
import '../../data/CommonTestData.dart';
import '../../data/global.dart';
import '../../widget/common/Safty.dart';

String server = 'http://172.23.10.40:16700/';
// String server = 'http://127.0.0.1:16700/';

class Reportset_Cubit extends Cubit<CommonReportSet> {
  Reportset_Cubit() : super(CommonReportSet(databasic: BasicCommonDATAset()));

  Future<void> ReportsetCubit(String PO) async {
    CommonReportSet output = CommonReportSet(databasic: BasicCommonDATAset());
    BasicCommonDATAset BasicCommonDATAsets = BasicCommonDATAset();
    List<String> passlist = [];

    final response = await Dio().post(
      server + "INS_Report_PDF",
      data: {
        "PO": PO,
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      // var databuff = test01;
      // print("----------------->");
      // print(databuff['PATTERN'][0]['reportset']);
      // print("----------------->>");
      //commontest04
      // var databuff = ACTtestdata01;

      if (databuff['DATA'] != null && (databuff['DATA']?.length ?? 0) != 0) {
        var FINALANSdata = databuff['DATA']?[0]['FINAL_ANS'] ?? {};
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
        var DESIMALlist = databuff['DESIMAL'] ?? [];

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

        print(">>>>>>>>>>>>>>>>>-----+");
        print(databuff['PATTERN'][0]['reportset']);
        print(">>>>>>>>>>>>>>>>>-----+");

        print(databuff['PATTERN'][0]['logoset']);
        print(">>>>>>>>>>>>>>>>>-----+");

        BasicCommonDATAsets = BasicCommonDATAset(
          reportset: databuff['PATTERN'][0]['reportset'] != null
              ? databuff['PATTERN'][0]['reportset'].toString()
              : '-',

          logoset: databuff['PATTERN'][0]['logoset'] != null
              ? databuff['PATTERN'][0]['logoset'].toString()
              : '',
          // PO: BasicDATAr['PO'] != null ? BasicDATAr['PO'].toString() : '',
          // CP: BasicDATAr['CP'] != null ? BasicDATAr['CP'].toString() : '',
          // CUSTOMER: BasicDATAr['CUSTNAME'] != null
          //     ? BasicDATAr['CUSTNAME'].toString()
          //     : '',
          // PROCESS: BasicDATAr['PROCESS'] != null
          //     ? BasicDATAr['PROCESS'].toString()
          //     : '',
          // PARTNAME: BasicDATAr['PARTNAME'] != null
          //     ? BasicDATAr['PARTNAME'].toString()
          //     : '',
          // PARTNO:
          //     BasicDATAr['PART'] != null ? BasicDATAr['PART'].toString() : '',
          // CUSLOT: BasicDATAr['CUSLOT'] != null
          //     ? BasicDATAr['CUSLOT'].toString()
          //     : '',
          // TPKLOT: BasicDATAr['FG_CHARG'] != null
          //     ? BasicDATAr['FG_CHARG'].toString()
          //     : '',
          // MATERIAL: BasicDATAr['MATERIAL'] != null
          //     ? BasicDATAr['MATERIAL'].toString()
          //     : '',
          // QTY: BasicDATAr['QTY'] != null ? BasicDATAr['QTY'].toString() : '',
          // UNITSAP: BasicDATAr['UNITSAP'] != null
          //     ? BasicDATAr['UNITSAP'].toString()
          //     : 'PCS',
          // INC01: inc01,
          // INC02: inc02,
          // PICstd: BasicDATAr['PIC'] != null
          //     ? BasicDATAr['PIC'].toString().split(',')[1]
          //     : '',
        );

        // if (BasicDATAr['ReferFrom'].toString() != PO) {
        //   if (BasicDATAr['ReferFrom'] != null) {
        //     final response02 = await Dio().post(
        //       server + "INS_Report_PDF",
        //       data: {
        //         "PO": BasicDATAr['ReferFrom'].toString(),
        //       },
        //     );

        //     if (response02.statusCode == 200) {
        //       var databuffref = response02.data;
        //       // print(databuffref);
        //       BasicCommonDATAsets.PARTNAMEref =
        //           databuffref['DATA']?[0]['PARTNAME'].toString() ?? '';
        //       BasicCommonDATAsets.PARTref =
        //           databuffref['DATA']?[0]['PART'].toString() ?? '';
        //       // print(databuffref['DATA']?[0]['PART']);
        //       // print(databuffref['DATA']?[0]['PARTNAME']);
        //     }
        //   }
        // }

        // print(PATTERNlist['FINAL'].length);

        output.databasic = BasicCommonDATAsets;
        output.datain = ITEMlist;
      }
      //-----------
    }
    print(passlist);
    // print(BasicCommonDATAsets.PASS);

    emit(output);
  }

  Future<void> Flush() async {
    CommonReportSet output = CommonReportSet(
      databasic: BasicCommonDATAset(),
    );
    emit(output);
  }
}

class FINALCHECKlistCommonClass {
  FINALCHECKlistCommonClass({
    this.NO = 0,
    this.TYPE = '',
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
    this.Cross = '',
    this.Remark = '',
  });
  int NO;
  String TYPE;
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
  String Cross;
  String Remark;
}

// class datainlist {
//   datainlist({
//     this.dimensionX = 0,
//     this.dimensionY = 0,
//     this.DATA01 = '',
//     this.DATA02 = '',
//     this.DATA03 = '',
//     this.DATA04 = '',
//     this.DATA05 = '',
//     this.DATA06 = '',
//     this.DATA07 = '',
//     this.DATA08 = '',
//     this.DATA09 = '',
//     this.DATA10 = '',
//     this.DATA11 = '',
//     this.DATA12 = '',
//     this.DATA13 = '',
//     this.DATA14 = '',
//     this.DATA15 = '',
//     this.DATA16 = '',
//     this.DATA17 = '',
//     this.DATA18 = '',
//     this.DATA19 = '',
//     this.DATA20 = '',
//     this.DATAAVG = '',
//   });

//   int dimensionX;
//   int dimensionY;

//   String DATA01;
//   String DATA02;
//   String DATA03;
//   String DATA04;
//   String DATA05;
//   String DATA06;
//   String DATA07;
//   String DATA08;
//   String DATA09;
//   String DATA10;
//   String DATA11;
//   String DATA12;
//   String DATA13;
//   String DATA14;
//   String DATA15;
//   String DATA16;
//   String DATA17;
//   String DATA18;
//   String DATA19;
//   String DATA20;
//   String DATAAVG;
// }

class datainlist {
  datainlist({
    this.TYPE = '',
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
    this.DATA01p = '',
    this.DATA02p = '',
    this.DATA03p = '',
    this.DATA04p = '',
    this.DATA05p = '',
    this.DATA06p = '',
    this.DATA07p = '',
    this.DATA08p = '',
    this.DATA09p = '',
    this.DATA10p = '',
    this.DATA11p = '',
    this.DATA12p = '',
    this.DATA13p = '',
    this.DATA14p = '',
    this.DATA15p = '',
    this.DATA16p = '',
    this.DATA17p = '',
    this.DATA18p = '',
    this.DATA19p = '',
    this.DATA20p = '',
    this.DATAAVG = '',
  });
  String TYPE;
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
  String DATA01p;
  String DATA02p;
  String DATA03p;
  String DATA04p;
  String DATA05p;
  String DATA06p;
  String DATA07p;
  String DATA08p;
  String DATA09p;
  String DATA10p;
  String DATA11p;
  String DATA12p;
  String DATA13p;
  String DATA14p;
  String DATA15p;
  String DATA16p;
  String DATA17p;
  String DATA18p;
  String DATA19p;
  String DATA20p;
  String DATAAVG;
}

class BasicCommonDATAset {
  BasicCommonDATAset({
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
    this.USER_STATUS = '',
    this.reportset = '',
    this.logoset = '',
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

  String USER_STATUS;
  String reportset;
  String logoset;
}

class CommonReportSet {
  CommonReportSet({
    this.datain = const [],
    required this.databasic,
  });

  List<FINALCHECKlistCommonClass> datain;
  BasicCommonDATAset databasic;
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
