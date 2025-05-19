import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/global.dart';

import '../../page/P303QMMASTERQC/P303QMMASTERQCVAR.dart';
import '../../page/P31ReportPDFcommon/ReportPDFCommonvar.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

abstract class P303QMMASTERQCget_Event {}

class P303QMMASTERQCget_GET extends P303QMMASTERQCget_Event {}

class P303QMMASTERQCget_GET2 extends P303QMMASTERQCget_Event {}

class P303QMMASTERQCget_GET3 extends P303QMMASTERQCget_Event {}

class P303QMMASTERQCget_FLUSH extends P303QMMASTERQCget_Event {}

class P303QMMASTERQCget_Bloc
    extends Bloc<P303QMMASTERQCget_Event, List<P303QMMASTERQCgetclass>> {
  P303QMMASTERQCget_Bloc() : super([]) {
    on<P303QMMASTERQCget_GET>((event, emit) {
      return _P303QMMASTERQCget_GET([], emit);
    });

    on<P303QMMASTERQCget_GET2>((event, emit) {
      return _P303QMMASTERQCget_GET2([], emit);
    });
    on<P303QMMASTERQCget_GET3>((event, emit) {
      return _P303QMMASTERQCget_GET3([], emit);
    });
    on<P303QMMASTERQCget_FLUSH>((event, emit) {
      return _P303QMMASTERQCget_FLUSH([], emit);
    });
  }

  Future<void> _P303QMMASTERQCget_GET(List<P303QMMASTERQCgetclass> toAdd,
      Emitter<List<P303QMMASTERQCgetclass>> emit) async {
    // FreeLoadingTan(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
    List<P303QMMASTERQCgetclass> output = [];
    //-------------------------------------------------------------------------------------
    final response = await Dio().post(
      "${server2}QMINCOMING/GETDATA",
      data: {
        "HEADER": {
          "FROM_DATE":
              "${P303QMMASTERQCVAR.day}.${P303QMMASTERQCVAR.month}.${P303QMMASTERQCVAR.year}",
          "TO_DATE":
              "${P303QMMASTERQCVAR.day_next}.${P303QMMASTERQCVAR.month_next}.${P303QMMASTERQCVAR.year_next}",
          "PLANT": P303QMMASTERQCVAR.PLANT,
          // "LOT_ORI": P303QMMASTERQCVAR.LOT_ORI,
          "LOT_ORI": "03",
          "MATERIAL": "",
          "BATCH": "",
          "LOT_NO": ""
        }
      },
    );
    var input = [];
    // Navigator.pop(P19PROGRESSMAINcontext);
    if (response.statusCode == 200) {
      // print(response.statusCode);
      // print(response.data);
      var databuff = response.data;
      // print(databuff);
//INSP_LOT

      if (databuff['INSP_LOT'].length > 0) {
        for (var i = 0; i < databuff['INSP_LOT'].length; i++) {
          // if (ReportPDFCommonvar.PO != '') {
          //   if ('00' + ReportPDFCommonvar.PO ==
          //       databuff['INSP_LOT'][i]['PROCESS_ORDER'].toString()) {
          //     output.add(P303QMMASTERQCgetclass(
          //       INSP_LOT: databuff['INSP_LOT'][i]['INSP_LOT'].toString(),
          //       INSP_LOT_STATUS:
          //           databuff['INSP_LOT'][i]['INSP_LOT_STATUS'].toString(),
          //       INSP_LOT_ORIGIN:
          //           databuff['INSP_LOT'][i]['INSP_LOT_ORIGIN'].toString(),
          //       PLANT: databuff['INSP_LOT'][i]['PLANT'].toString(),
          //       INSPTYPE: databuff['INSP_LOT'][i]['INSPTYPE'].toString(),
          //       CREATED_ON: databuff['INSP_LOT'][i]['CREATED_ON'].toString(),
          //       CREATED_TIME:
          //           databuff['INSP_LOT'][i]['CREATED_TIME'].toString(),
          //       CREATED_BY: databuff['INSP_LOT'][i]['CREATED_BY'].toString(),
          //       MATERIAL: databuff['INSP_LOT'][i]['MATERIAL'].toString(),
          //       MAT_DESC: databuff['INSP_LOT'][i]['MAT_DESC'].toString(),
          //       OLD_MAT: databuff['INSP_LOT'][i]['OLD_MAT'].toString(),
          //       TTSL: databuff['INSP_LOT'][i]['TTSL'].toString(),
          //       TTSL_PERIOD: databuff['INSP_LOT'][i]['TTSL_PERIOD'].toString(),
          //       MIN_TTSL: databuff['INSP_LOT'][i]['MIN_TTSL'].toString(),
          //       INSP_QTY: databuff['INSP_LOT'][i]['INSP_QTY'].toString(),
          //       INSP_UOM: databuff['INSP_LOT'][i]['INSP_UOM'].toString(),
          //       BATCH: databuff['INSP_LOT'][i]['BATCH'].toString(),
          //       STORAGE: databuff['INSP_LOT'][i]['STORAGE'].toString(),
          //       BATCH_IND: databuff['INSP_LOT'][i]['BATCH_IND'].toString(),
          //       TASK_LIST_TYPE:
          //           databuff['INSP_LOT'][i]['TASK_LIST_TYPE'].toString(),
          //       GROUP: databuff['INSP_LOT'][i]['GROUP'].toString(),
          //       USAGE: databuff['INSP_LOT'][i]['USAGE'].toString(),
          //       GROUP_COUNTER:
          //           databuff['INSP_LOT'][i]['GROUP_COUNTER'].toString(),
          //       INSP_POINT: databuff['INSP_LOT'][i]['INSP_POINT'].toString(),
          //       KEY_DATE: databuff['INSP_LOT'][i]['KEY_DATE'].toString(),
          //       PROCESS_ORDER:
          //           databuff['INSP_LOT'][i]['PROCESS_ORDER'].toString(),
          //       CUSTOMER: databuff['INSP_LOT'][i]['CUSTOMER'].toString(),
          //       CUST_NAME1: databuff['INSP_LOT'][i]['CUST_NAME1'].toString(),
          //       CUST_NAME2: databuff['INSP_LOT'][i]['CUST_NAME2'].toString(),
          //       SUPPLIER: databuff['INSP_LOT'][i]['SUPPLIER'].toString(),
          //       SUPPLIER_NAME1:
          //           databuff['INSP_LOT'][i]['SUPPLIER_NAME1'].toString(),
          //       SUPPLIER_NAME2:
          //           databuff['INSP_LOT'][i]['SUPPLIER_NAME2'].toString(),
          //       PUR_ORG: databuff['INSP_LOT'][i]['PUR_ORG'].toString(),
          //       PUR_DOC: databuff['INSP_LOT'][i]['PUR_DOC'].toString(),
          //       PUR_ITEM: databuff['INSP_LOT'][i]['PUR_ITEM'].toString(),
          //       MATDOC_YEAR: databuff['INSP_LOT'][i]['MATDOC_YEAR'].toString(),
          //       MATDOC: databuff['INSP_LOT'][i]['MATDOC'].toString(),
          //       MATDOC_ITEM: databuff['INSP_LOT'][i]['MATDOC_ITEM'].toString(),
          //       POSTING_DATE:
          //           databuff['INSP_LOT'][i]['POSTING_DATE'].toString(),
          //       MVT: databuff['INSP_LOT'][i]['MVT'].toString(),
          //       SHORT_TEXT: databuff['INSP_LOT'][i]['SHORT_TEXT'].toString(),
          //       UD_PLANT: databuff['INSP_LOT'][i]['UD_PLANT'].toString(),
          //       UD_SELECTEDSET:
          //           databuff['INSP_LOT'][i]['UD_SELECTEDSET'].toString(),
          //       UD_CODEGROUP:
          //           databuff['INSP_LOT'][i]['UD_CODEGROUP'].toString(),
          //       UD_CODE: databuff['INSP_LOT'][i]['UD_CODE'].toString(),
          //       VALUATION: databuff['INSP_LOT'][i]['VALUATION'].toString(),
          //       UD_MADEBY: databuff['INSP_LOT'][i]['UD_MADEBY'].toString(),
          //       UD_MADEON: databuff['INSP_LOT'][i]['UD_MADEON'].toString(),
          //       UD_MADETIME: databuff['INSP_LOT'][i]['UD_MADETIME'].toString(),
          //       UD_MADE: databuff['INSP_LOT'][i]['UD_MADE'].toString(),
          //       UD_POSTINGCOMP:
          //           databuff['INSP_LOT'][i]['UD_POSTINGCOMP'].toString(),
          //       UD_POSTQTY: databuff['INSP_LOT'][i]['UD_POSTQTY'].toString(),
          //       UD_POSTUR: databuff['INSP_LOT'][i]['UD_POSTUR'].toString(),
          //       UD_POSTBLOCK:
          //           databuff['INSP_LOT'][i]['UD_POSTBLOCK'].toString(),
          //       UD_POSTSUPPLIER:
          //           databuff['INSP_LOT'][i]['UD_POSTSUPPLIER'].toString(),
          //       UD_MASTER: databuff['INSP_LOT'][i]['UD_MASTER'].toString(),
          //     ));
          //   }
          // } else {
          output.add(P303QMMASTERQCgetclass(
            INSP_LOT: databuff['INSP_LOT'][i]['INSP_LOT'].toString(),
            INSP_LOT_STATUS:
                databuff['INSP_LOT'][i]['INSP_LOT_STATUS'].toString(),
            INSP_LOT_ORIGIN:
                databuff['INSP_LOT'][i]['INSP_LOT_ORIGIN'].toString(),
            PLANT: databuff['INSP_LOT'][i]['PLANT'].toString(),
            INSPTYPE: databuff['INSP_LOT'][i]['INSPTYPE'].toString(),
            CREATED_ON: databuff['INSP_LOT'][i]['CREATED_ON'].toString(),
            CREATED_TIME: databuff['INSP_LOT'][i]['CREATED_TIME'].toString(),
            CREATED_BY: databuff['INSP_LOT'][i]['CREATED_BY'].toString(),
            MATERIAL: databuff['INSP_LOT'][i]['MATERIAL'].toString(),
            MAT_DESC: databuff['INSP_LOT'][i]['MAT_DESC'].toString(),
            OLD_MAT: databuff['INSP_LOT'][i]['OLD_MAT'].toString(),
            TTSL: databuff['INSP_LOT'][i]['TTSL'].toString(),
            TTSL_PERIOD: databuff['INSP_LOT'][i]['TTSL_PERIOD'].toString(),
            MIN_TTSL: databuff['INSP_LOT'][i]['MIN_TTSL'].toString(),
            INSP_QTY: databuff['INSP_LOT'][i]['INSP_QTY'].toString(),
            INSP_UOM: databuff['INSP_LOT'][i]['INSP_UOM'].toString(),
            BATCH: databuff['INSP_LOT'][i]['BATCH'].toString(),
            STORAGE: databuff['INSP_LOT'][i]['STORAGE'].toString(),
            BATCH_IND: databuff['INSP_LOT'][i]['BATCH_IND'].toString(),
            TASK_LIST_TYPE:
                databuff['INSP_LOT'][i]['TASK_LIST_TYPE'].toString(),
            GROUP: databuff['INSP_LOT'][i]['GROUP'].toString(),
            USAGE: databuff['INSP_LOT'][i]['USAGE'].toString(),
            GROUP_COUNTER: databuff['INSP_LOT'][i]['GROUP_COUNTER'].toString(),
            INSP_POINT: databuff['INSP_LOT'][i]['INSP_POINT'].toString(),
            KEY_DATE: databuff['INSP_LOT'][i]['KEY_DATE'].toString(),
            PROCESS_ORDER: databuff['INSP_LOT'][i]['PROCESS_ORDER'].toString(),
            CUSTOMER: databuff['INSP_LOT'][i]['CUSTOMER'].toString(),
            CUST_NAME1: databuff['INSP_LOT'][i]['CUST_NAME1'].toString(),
            CUST_NAME2: databuff['INSP_LOT'][i]['CUST_NAME2'].toString(),
            SUPPLIER: databuff['INSP_LOT'][i]['SUPPLIER'].toString(),
            SUPPLIER_NAME1:
                databuff['INSP_LOT'][i]['SUPPLIER_NAME1'].toString(),
            SUPPLIER_NAME2:
                databuff['INSP_LOT'][i]['SUPPLIER_NAME2'].toString(),
            PUR_ORG: databuff['INSP_LOT'][i]['PUR_ORG'].toString(),
            PUR_DOC: databuff['INSP_LOT'][i]['PUR_DOC'].toString(),
            PUR_ITEM: databuff['INSP_LOT'][i]['PUR_ITEM'].toString(),
            MATDOC_YEAR: databuff['INSP_LOT'][i]['MATDOC_YEAR'].toString(),
            MATDOC: databuff['INSP_LOT'][i]['MATDOC'].toString(),
            MATDOC_ITEM: databuff['INSP_LOT'][i]['MATDOC_ITEM'].toString(),
            POSTING_DATE: databuff['INSP_LOT'][i]['POSTING_DATE'].toString(),
            MVT: databuff['INSP_LOT'][i]['MVT'].toString(),
            SHORT_TEXT: databuff['INSP_LOT'][i]['SHORT_TEXT'].toString(),
            UD_PLANT: databuff['INSP_LOT'][i]['UD_PLANT'].toString(),
            UD_SELECTEDSET:
                databuff['INSP_LOT'][i]['UD_SELECTEDSET'].toString(),
            UD_CODEGROUP: databuff['INSP_LOT'][i]['UD_CODEGROUP'].toString(),
            UD_CODE: databuff['INSP_LOT'][i]['UD_CODE'].toString(),
            VALUATION: databuff['INSP_LOT'][i]['VALUATION'].toString(),
            UD_MADEBY: databuff['INSP_LOT'][i]['UD_MADEBY'].toString(),
            UD_MADEON: databuff['INSP_LOT'][i]['UD_MADEON'].toString(),
            UD_MADETIME: databuff['INSP_LOT'][i]['UD_MADETIME'].toString(),
            UD_MADE: databuff['INSP_LOT'][i]['UD_MADE'].toString(),
            UD_POSTINGCOMP:
                databuff['INSP_LOT'][i]['UD_POSTINGCOMP'].toString(),
            UD_POSTQTY: databuff['INSP_LOT'][i]['UD_POSTQTY'].toString(),
            UD_POSTUR: databuff['INSP_LOT'][i]['UD_POSTUR'].toString(),
            UD_POSTBLOCK: databuff['INSP_LOT'][i]['UD_POSTBLOCK'].toString(),
            UD_POSTSUPPLIER:
                databuff['INSP_LOT'][i]['UD_POSTSUPPLIER'].toString(),
            UD_MASTER: databuff['INSP_LOT'][i]['UD_MASTER'].toString(),
          ));
        }
        // }
      }

      // Navigator.pop(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
    } else {
      print("where is my server");
    }

    emit(output);
  }

  Future<void> _P303QMMASTERQCget_GET2(List<P303QMMASTERQCgetclass> toAdd,
      Emitter<List<P303QMMASTERQCgetclass>> emit) async {
    List<P303QMMASTERQCgetclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P303QMMASTERQCgetclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P303QMMASTERQCget_GET3(List<P303QMMASTERQCgetclass> toAdd,
      Emitter<List<P303QMMASTERQCgetclass>> emit) async {
    List<P303QMMASTERQCgetclass> output = [];
    //-------------------------------------------------------------------------------------
    List<P303QMMASTERQCgetclass> datadummy = [];

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P303QMMASTERQCget_FLUSH(List<P303QMMASTERQCgetclass> toAdd,
      Emitter<List<P303QMMASTERQCgetclass>> emit) async {
    List<P303QMMASTERQCgetclass> output = [];
    emit(output);
  }
}

class P303QMMASTERQCgetclass {
  P303QMMASTERQCgetclass({
    this.INSP_LOT = '',
    this.INSP_LOT_STATUS = '',
    this.INSP_LOT_ORIGIN = '',
    this.PLANT = '',
    this.INSPTYPE = '',
    this.CREATED_ON = '',
    this.CREATED_TIME = '',
    this.CREATED_BY = '',
    this.MATERIAL = '',
    this.MAT_DESC = '',
    this.OLD_MAT = '',
    this.TTSL = '',
    this.TTSL_PERIOD = '',
    this.MIN_TTSL = '',
    this.INSP_QTY = '',
    this.INSP_UOM = '',
    this.BATCH = '',
    this.STORAGE = '',
    this.BATCH_IND = '',
    this.TASK_LIST_TYPE = '',
    this.GROUP = '',
    this.USAGE = '',
    this.GROUP_COUNTER = '',
    this.INSP_POINT = '',
    this.KEY_DATE = '',
    this.PROCESS_ORDER = '',
    this.CUSTOMER = '',
    this.CUST_NAME1 = '',
    this.CUST_NAME2 = '',
    this.SUPPLIER = '',
    this.SUPPLIER_NAME1 = '',
    this.SUPPLIER_NAME2 = '',
    this.PUR_ORG = '',
    this.PUR_DOC = '',
    this.PUR_ITEM = '',
    this.MATDOC_YEAR = '',
    this.MATDOC = '',
    this.MATDOC_ITEM = '',
    this.POSTING_DATE = '',
    this.MVT = '',
    this.SHORT_TEXT = '',
    this.UD_PLANT = '',
    this.UD_SELECTEDSET = '',
    this.UD_CODEGROUP = '',
    this.UD_CODE = '',
    this.VALUATION = '',
    this.UD_MADEBY = '',
    this.UD_MADEON = '',
    this.UD_MADETIME = '',
    this.UD_MADE = '',
    this.UD_POSTINGCOMP = '',
    this.UD_POSTQTY = '',
    this.UD_POSTUR = '',
    this.UD_POSTBLOCK = '',
    this.UD_POSTSUPPLIER = '',
    this.UD_MASTER = '',
  });

  String INSP_LOT;
  String INSP_LOT_STATUS;
  String INSP_LOT_ORIGIN;
  String PLANT;
  String INSPTYPE;
  String CREATED_ON;
  String CREATED_TIME;
  String CREATED_BY;
  String MATERIAL;
  String MAT_DESC;
  String OLD_MAT;
  String TTSL;
  String TTSL_PERIOD;
  String MIN_TTSL;
  String INSP_QTY;
  String INSP_UOM;
  String BATCH;
  String STORAGE;
  String BATCH_IND;
  String TASK_LIST_TYPE;
  String GROUP;
  String USAGE;
  String GROUP_COUNTER;
  String INSP_POINT;
  String KEY_DATE;
  String PROCESS_ORDER;
  String CUSTOMER;
  String CUST_NAME1;
  String CUST_NAME2;
  String SUPPLIER;
  String SUPPLIER_NAME1;
  String SUPPLIER_NAME2;
  String PUR_ORG;
  String PUR_DOC;
  String PUR_ITEM;
  String MATDOC_YEAR;
  String MATDOC;
  String MATDOC_ITEM;
  String POSTING_DATE;
  String MVT;
  String SHORT_TEXT;
  String UD_PLANT;
  String UD_SELECTEDSET;
  String UD_CODEGROUP;
  String UD_CODE;
  String VALUATION;
  String UD_MADEBY;
  String UD_MADEON;
  String UD_MADETIME;
  String UD_MADE;
  String UD_POSTINGCOMP;
  String UD_POSTQTY;
  String UD_POSTUR;
  String UD_POSTBLOCK;
  String UD_POSTSUPPLIER;
  String UD_MASTER;
}

String savenull(input) {
  String output = '-';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
