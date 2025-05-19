import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/global.dart';
import '../../page/P303QMMASTERQC/P303QMMASTERQCVAR.dart';
import '../../widget/common/Loading.dart';
//-------------------------------------------------

abstract class P303QMMASTERQCgetINSP_SPEC_Event {}

class P303QMMASTERQCgetINSP_SPEC_GET extends P303QMMASTERQCgetINSP_SPEC_Event {}

class P303QMMASTERQCgetINSP_SPEC_GET2
    extends P303QMMASTERQCgetINSP_SPEC_Event {}

class P303QMMASTERQCgetINSP_SPEC_GET3
    extends P303QMMASTERQCgetINSP_SPEC_Event {}

class P303QMMASTERQCgetINSP_SPEC_FLUSH
    extends P303QMMASTERQCgetINSP_SPEC_Event {}

class P303QMMASTERQCgetINSP_SPEC_Bloc extends Bloc<
    P303QMMASTERQCgetINSP_SPEC_Event, P303QMMASTERQCgetINSP_SPECclassSET> {
  P303QMMASTERQCgetINSP_SPEC_Bloc()
      : super(P303QMMASTERQCgetINSP_SPECclassSET()) {
    on<P303QMMASTERQCgetINSP_SPEC_GET>((event, emit) {
      return _P303QMMASTERQCgetINSP_SPEC_GET(
          P303QMMASTERQCgetINSP_SPECclassSET(), emit);
    });

    on<P303QMMASTERQCgetINSP_SPEC_GET2>((event, emit) {
      return _P303QMMASTERQCgetINSP_SPEC_GET2(
          P303QMMASTERQCgetINSP_SPECclassSET(), emit);
    });
    on<P303QMMASTERQCgetINSP_SPEC_GET3>((event, emit) {
      return _P303QMMASTERQCgetINSP_SPEC_GET3(
          P303QMMASTERQCgetINSP_SPECclassSET(), emit);
    });
    on<P303QMMASTERQCgetINSP_SPEC_FLUSH>((event, emit) {
      return _P303QMMASTERQCgetINSP_SPEC_FLUSH(
          P303QMMASTERQCgetINSP_SPECclassSET(), emit);
    });
  }

  Future<void> _P303QMMASTERQCgetINSP_SPEC_GET(
      P303QMMASTERQCgetINSP_SPECclassSET toAdd,
      Emitter<P303QMMASTERQCgetINSP_SPECclassSET> emit) async {
    // FreeLoadingTan(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
    P303QMMASTERQCgetINSP_SPECclassSET output =
        P303QMMASTERQCgetINSP_SPECclassSET();
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
      output.INSP_SPEC = [];
      output.SELECTED_SET = [];
      output.UDCODE = [];
      if (databuff['INSP_SPEC'].length > 0) {
        for (var i = 0; i < databuff['INSP_SPEC'].length; i++) {
          output.INSP_SPEC.add(PINSP_SPECHSclass(
            INSP_LOT: databuff['INSP_SPEC'][i]['INSP_LOT'].toString(),
            NODE: databuff['INSP_SPEC'][i]['NODE'].toString(),
            INSP_CHAR: databuff['INSP_SPEC'][i]['INSP_CHAR'].toString(),
            INSP_STATUS: databuff['INSP_SPEC'][i]['INSP_STATUS'].toString(),
            CONTROL_IND: databuff['INSP_SPEC'][i]['CONTROL_IND'].toString(),
            CHAR_TYPE: databuff['INSP_SPEC'][i]['CHAR_TYPE'].toString(),
            REC_TYPE: databuff['INSP_SPEC'][i]['REC_TYPE'].toString(),
            MIC_PLANT: databuff['INSP_SPEC'][i]['MIC_PLANT'].toString(),
            MIC: databuff['INSP_SPEC'][i]['MIC'].toString(),
            MIC_VERSION: databuff['INSP_SPEC'][i]['MIC_VERSION'].toString(),
            MIC_SHORTTEXT: databuff['INSP_SPEC'][i]['MIC_SHORTTEXT'].toString(),
            METHOD_PLANT: databuff['INSP_SPEC'][i]['METHOD_PLANT'].toString(),
            METHOD: databuff['INSP_SPEC'][i]['METHOD'].toString(),
            METHOD_VERSION:
                databuff['INSP_SPEC'][i]['METHOD_VERSION'].toString(),
            SELECTEDSET_IND:
                databuff['INSP_SPEC'][i]['SELECTEDSET_IND'].toString(),
            CATALOGTYPE: databuff['INSP_SPEC'][i]['CATALOGTYPE'].toString(),
            SLECTEDSET: databuff['INSP_SPEC'][i]['SLECTEDSET'].toString(),
            SELECTEDSET_PLANT:
                databuff['INSP_SPEC'][i]['SELECTEDSET_PLANT'].toString(),
            DECIMAL: databuff['INSP_SPEC'][i]['DECIMAL'].toString(),
            UOM: databuff['INSP_SPEC'][i]['UOM'].toString(),
            UPPER: databuff['INSP_SPEC'][i]['UPPER'].toString(),
            UPPER_IND: databuff['INSP_SPEC'][i]['UPPER_IND'].toString(),
            LOWER: databuff['INSP_SPEC'][i]['LOWER'].toString(),
            LOWER_IND: databuff['INSP_SPEC'][i]['LOWER_IND'].toString(),
            STUPPER: databuff['INSP_SPEC'][i]['STUPPER'].toString(),
            STUPPER_IND: databuff['INSP_SPEC'][i]['STUPPER_IND'].toString(),
            STLOWER: databuff['INSP_SPEC'][i]['STLOWER'].toString(),
            STLOWER_IND: databuff['INSP_SPEC'][i]['STLOWER_IND'].toString(),
          ));
        }
      }

      if (databuff['SELECTED_SET'].length > 0) {
        for (var i = 0; i < databuff['SELECTED_SET'].length; i++) {
          output.SELECTED_SET.add(SELECTED_SETHSclass(
            CATALOGTYPE: databuff['SELECTED_SET'][i]['CATALOGTYPE'].toString(),
            SELECTEDSET_PLANT:
                databuff['SELECTED_SET'][i]['SELECTEDSET_PLANT'].toString(),
            SELECTEDSET: databuff['SELECTED_SET'][i]['SELECTEDSET'].toString(),
            SELECTEDSET_DESC:
                databuff['SELECTED_SET'][i]['SELECTEDSET_DESC'].toString(),
            CODEGROUP: databuff['SELECTED_SET'][i]['CODEGROUP'].toString(),
            CODE: databuff['SELECTED_SET'][i]['CODE'].toString(),
            CODE_TEXT: databuff['SELECTED_SET'][i]['CODE_TEXT'].toString(),
            VALUATION: databuff['SELECTED_SET'][i]['VALUATION'].toString(),
          ));
        }
      }

      if (databuff['UDCODE'].length > 0) {
        for (var i = 0; i < databuff['UDCODE'].length; i++) {
          output.UDCODE.add(UDCODEclass(
            CATALOGTYPE: databuff['UDCODE'][i]['CATALOGTYPE'].toString(),
            SELECTEDSET_PLANT:
                databuff['UDCODE'][i]['SELECTEDSET_PLANT'].toString(),
            SELECTEDSET: databuff['UDCODE'][i]['SELECTEDSET'].toString(),
            SELECTEDSET_DESC:
                databuff['UDCODE'][i]['SELECTEDSET_DESC'].toString(),
            CODEGROUP: databuff['UDCODE'][i]['CODEGROUP'].toString(),
            CODE: databuff['UDCODE'][i]['CODE'].toString(),
            CODE_TEXT: databuff['UDCODE'][i]['CODE_TEXT'].toString(),
            VALUATION: databuff['UDCODE'][i]['VALUATION'].toString(),
          ));
        }
      }

      // Navigator.pop(CONTEXTFORUSEPAGE19TO25.LOADINGcontext);
    } else {
      print("where is my server");
    }

    emit(output);
  }

  Future<void> _P303QMMASTERQCgetINSP_SPEC_GET2(
      P303QMMASTERQCgetINSP_SPECclassSET toAdd,
      Emitter<P303QMMASTERQCgetINSP_SPECclassSET> emit) async {
    P303QMMASTERQCgetINSP_SPECclassSET output =
        P303QMMASTERQCgetINSP_SPECclassSET();
    //-------------------------------------------------------------------------------------
    P303QMMASTERQCgetINSP_SPECclassSET datadummy =
        P303QMMASTERQCgetINSP_SPECclassSET();

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P303QMMASTERQCgetINSP_SPEC_GET3(
      P303QMMASTERQCgetINSP_SPECclassSET toAdd,
      Emitter<P303QMMASTERQCgetINSP_SPECclassSET> emit) async {
    P303QMMASTERQCgetINSP_SPECclassSET output =
        P303QMMASTERQCgetINSP_SPECclassSET();
    //-------------------------------------------------------------------------------------
    P303QMMASTERQCgetINSP_SPECclassSET datadummy =
        P303QMMASTERQCgetINSP_SPECclassSET();

    //-------------------------------------------------------------------------------------
    output = datadummy;
    emit(output);
  }

  Future<void> _P303QMMASTERQCgetINSP_SPEC_FLUSH(
      P303QMMASTERQCgetINSP_SPECclassSET toAdd,
      Emitter<P303QMMASTERQCgetINSP_SPECclassSET> emit) async {
    P303QMMASTERQCgetINSP_SPECclassSET output =
        P303QMMASTERQCgetINSP_SPECclassSET();
    emit(output);
  }
}

class P303QMMASTERQCgetINSP_SPECclassSET {
  P303QMMASTERQCgetINSP_SPECclassSET({
    this.INSP_SPEC = const [],
    this.SELECTED_SET = const [],
    this.UDCODE = const [],
  });
  List<PINSP_SPECHSclass> INSP_SPEC;
  List<SELECTED_SETHSclass> SELECTED_SET;

  List<UDCODEclass> UDCODE;

  //SELECTED_SETHSclass
}

class PINSP_SPECHSclass {
  PINSP_SPECHSclass({
    this.INSP_LOT = '',
    this.NODE = '',
    this.INSP_CHAR = '',
    this.INSP_STATUS = '',
    this.CONTROL_IND = '',
    this.CHAR_TYPE = '',
    this.REC_TYPE = '',
    this.MIC_PLANT = '',
    this.MIC = '',
    this.MIC_VERSION = '',
    this.MIC_SHORTTEXT = '',
    this.METHOD_PLANT = '',
    this.METHOD = '',
    this.METHOD_VERSION = '',
    this.SELECTEDSET_IND = '',
    this.CATALOGTYPE = '',
    this.SLECTEDSET = '',
    this.SELECTEDSET_PLANT = '',
    this.DECIMAL = '',
    this.UOM = '',
    this.UPPER = '',
    this.UPPER_IND = '',
    this.LOWER = '',
    this.LOWER_IND = '',
    this.STUPPER = '',
    this.STUPPER_IND = '',
    this.STLOWER = '',
    this.STLOWER_IND = '',

    //
    this.iDATA = '',
    this.DATAAP = '',
    this.DATAAP_TEXT = '',
    this.DATASUM = '',
    this.DATASUM_TEXT = '',
    this.CODEG = '',
    this.STATUS = '',
    this.VALUATION = '',
  });
  String INSP_LOT;
  String NODE;
  String INSP_CHAR;
  String INSP_STATUS;
  String CONTROL_IND;
  String CHAR_TYPE;
  String REC_TYPE;
  String MIC_PLANT;
  String MIC;
  String MIC_VERSION;
  String MIC_SHORTTEXT;
  String METHOD_PLANT;
  String METHOD;
  String METHOD_VERSION;
  String SELECTEDSET_IND;
  String CATALOGTYPE;
  String SLECTEDSET;
  String SELECTEDSET_PLANT;
  String DECIMAL;
  String UOM;
  String UPPER;
  String UPPER_IND;
  String LOWER;
  String LOWER_IND;
  String STUPPER;
  String STUPPER_IND;
  String STLOWER;
  String STLOWER_IND;

  String iDATA;
  String DATAAP;
  String DATAAP_TEXT;
  String DATASUM;
  String DATASUM_TEXT;
  String CODEG;
  String STATUS;
  String VALUATION;
}

class SELECTED_SETHSclass {
  SELECTED_SETHSclass({
    this.CATALOGTYPE = '',
    this.SELECTEDSET_PLANT = '',
    this.SELECTEDSET = '',
    this.SELECTEDSET_DESC = '',
    this.CODEGROUP = '',
    this.CODE = '',
    this.CODE_TEXT = '',
    this.VALUATION = '',
  });
  String CATALOGTYPE;
  String SELECTEDSET_PLANT;
  String SELECTEDSET;
  String SELECTEDSET_DESC;
  String CODEGROUP;
  String CODE;
  String CODE_TEXT;
  String VALUATION;
}

class UDCODEclass {
  UDCODEclass({
    this.CATALOGTYPE = '',
    this.SELECTEDSET_PLANT = '',
    this.SELECTEDSET = '',
    this.SELECTEDSET_DESC = '',
    this.CODEGROUP = '',
    this.CODE = '',
    this.CODE_TEXT = '',
    this.VALUATION = '',
  });
  String CATALOGTYPE;
  String SELECTEDSET_PLANT;
  String SELECTEDSET;
  String SELECTEDSET_DESC;
  String CODEGROUP;
  String CODE;
  String CODE_TEXT;
  String VALUATION;
}

String savenull(input) {
  String output = '-';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
