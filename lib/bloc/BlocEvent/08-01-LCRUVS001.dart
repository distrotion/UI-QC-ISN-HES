import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P8LCR-UVS-001/LCRUVS001var.dart';
import '../../widget/QCWIDGET/consolelayout.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class LCRUVS001_Event {}

class LCRUVS001_READ extends LCRUVS001_Event {}

class LCRUVS001_Bloc extends Bloc<LCRUVS001_Event, LCRUVS001SCHEMA> {
  LCRUVS001_Bloc()
      : super(LCRUVS001SCHEMA(
          ItemPick: [''],
          ItemPickcode: [ITEMSET()],
          preview: [],
          confirmdata: [],
          ITEMleftUNIT: [],
          ITEMleftVALUE: [],
          GAPnameList: [],
        )) {
    on<LCRUVS001_READ>((event, emit) {
      return _LCRUVS001_READ(
          LCRUVS001SCHEMA(
            ItemPick: [''],
            ItemPickcode: [ITEMSET()],
            preview: [],
            confirmdata: [],
            ITEMleftUNIT: [],
            ITEMleftVALUE: [],
            GAPnameList: [],
          ),
          emit);
    });
  }
  Future<void> _LCRUVS001_READ(
      LCRUVS001SCHEMA toAdd, Emitter<LCRUVS001SCHEMA> emit) async {
    //--------------- READ
    final response = await Dio().post(
      server + "LCRUVS001db",
      data: {},
    );
    LCRUVS001SCHEMA output = LCRUVS001SCHEMA(
      ItemPick: [''],
      ItemPickcode: [ITEMSET()],
      preview: [],
      confirmdata: [],
      ITEMleftUNIT: [],
      ITEMleftVALUE: [],
      GAPnameList: [],
    );
    if (response.statusCode == 200) {
      //
      var databuff = response.data;
      // print(databuff);
      List<String> ItemPickBUFFER = [''];

      if (databuff['ItemPick'] != null) {
        for (int i = 0; i < databuff['ItemPick'].length; i++) {
          ItemPickBUFFER.add(databuff['ItemPick'][i].toString());
        }
      }

      List<String> GAPnamePickBUFFER = [''];

      if (databuff['GAPnameList'] != null) {
        for (int i = 0; i < databuff['GAPnameList'].length; i++) {
          GAPnamePickBUFFER.add(databuff['GAPnameList'][i].toString());
        }
      }

      List<ITEMSET> ItemPickCodeBUFFER = [ITEMSET()];
      if (databuff['ItemPickcode'] != null) {
        for (int i = 0; i < databuff['ItemPickcode'].length; i++) {
          ItemPickCodeBUFFER.add(
            ITEMSET(
              key: databuff['ItemPickcode'][i]['key'].toString(),
              value: databuff['ItemPickcode'][i]['value'].toString(),
              METHOD: databuff['ItemPickcode'][i]['METHOD'].toString(),
            ),
          );
        }
      }

      List<INSDATA> previewBUFFER = [];
      if (databuff['preview'] != null) {
        for (int i = 0; i < databuff['preview'].length; i++) {
          previewBUFFER.add(INSDATA(
            V1: databuff['preview'][i]['V1'] == null
                ? ''
                : databuff['preview'][i]['V1'].toString(),
            V2: databuff['preview'][i]['V2'] == null
                ? ''
                : databuff['preview'][i]['V2'].toString(),
            V3: databuff['preview'][i]['V3'] == null
                ? ''
                : databuff['preview'][i]['V3'].toString(),
            V4: databuff['preview'][i]['V4'] == null
                ? ''
                : databuff['preview'][i]['V4'].toString(),
            V5: databuff['preview'][i]['V5'] == null
                ? ''
                : databuff['preview'][i]['V5'].toString(),
          ));
        }
      }
      List<INSDATA> confirmdataBUFFER = [];
      if (databuff['confirmdata'] != null) {
        for (int i = 0; i < databuff['confirmdata'].length; i++) {
          confirmdataBUFFER.add(INSDATA(
            V1: databuff['confirmdata'][i]['V1'] == null
                ? ''
                : databuff['confirmdata'][i]['V1'].toString(),
            V2: databuff['confirmdata'][i]['V2'] == null
                ? ''
                : databuff['confirmdata'][i]['V2'].toString(),
            V3: databuff['confirmdata'][i]['V3'] == null
                ? ''
                : databuff['confirmdata'][i]['V3'].toString(),
            V4: databuff['confirmdata'][i]['V4'] == null
                ? ''
                : databuff['confirmdata'][i]['V4'].toString(),
            V5: databuff['confirmdata'][i]['V5'] == null
                ? ''
                : databuff['confirmdata'][i]['V5'].toString(),
          ));
        }
      }
      List<INSDATA> ITEMleftUNITBUFFER = [];
      if (databuff['ITEMleftUNIT'] != null) {
        for (int i = 0; i < databuff['ITEMleftUNIT'].length; i++) {
          ITEMleftUNITBUFFER.add(INSDATA(
            V1: databuff['ITEMleftUNIT'][i]['V1'] == null
                ? ''
                : databuff['ITEMleftUNIT'][i]['V1'].toString(),
            V2: databuff['ITEMleftUNIT'][i]['V2'] == null
                ? ''
                : databuff['ITEMleftUNIT'][i]['V2'].toString(),
            V3: databuff['ITEMleftUNIT'][i]['V3'] == null
                ? ''
                : databuff['ITEMleftUNIT'][i]['V3'].toString(),
          ));
        }
      }
      List<INSDATA> ITEMleftVALUEBUFFER = [];
      if (databuff['ITEMleftVALUE'] != null) {
        for (int i = 0; i < databuff['ITEMleftVALUE'].length; i++) {
          ITEMleftVALUEBUFFER.add(INSDATA(
            V1: databuff['ITEMleftVALUE'][i]['V1'] == null
                ? ''
                : databuff['ITEMleftVALUE'][i]['V1'].toString(),
            V2: databuff['ITEMleftVALUE'][i]['V2'] == null
                ? ''
                : databuff['ITEMleftVALUE'][i]['V2'].toString(),
            V3: databuff['ITEMleftVALUE'][i]['V3'] == null
                ? ''
                : databuff['ITEMleftVALUE'][i]['V3'].toString(),
          ));
        }
      }

      output = LCRUVS001SCHEMA(
        UPDATE: 'OK',
        //---- Left
        PO: databuff['PO'] == null ? '' : databuff['PO'].toString(),
        CP: databuff['CP'] == null ? '' : databuff['CP'].toString(),
        QTY: databuff['QTY'] == null ? '' : databuff['QTY'].toString(),
        PROCESS:
            databuff['PROCESS'] == null ? '' : databuff['PROCESS'].toString(),
        CUSLOT: databuff['CUSLOT'] == null ? '' : databuff['CUSLOT'].toString(),
        TPKLOT: databuff['TPKLOT'] == null ? '' : databuff['TPKLOT'].toString(),
        FG: databuff['FG'] == null ? '' : databuff['FG'].toString(),
        CUSTOMER:
            databuff['CUSTOMER'] == null ? '' : databuff['CUSTOMER'].toString(),
        PART: databuff['PART'] == null ? '' : databuff['PART'].toString(),
        PARTNAME:
            databuff['PARTNAME'] == null ? '' : databuff['PARTNAME'].toString(),
        MATERIAL:
            databuff['MATERIAL'] == null ? '' : databuff['MATERIAL'].toString(),
        //---- TOP
        ItemPick: ItemPickBUFFER,
        ItemPickcode: ItemPickCodeBUFFER,
        POINTs: databuff['POINTs'] == null ? '' : databuff['POINTs'].toString(),
        PCS: databuff['PCS'] == null ? '' : databuff['PCS'].toString(),
        PCSleft:
            databuff['PCSleft'] == null ? '' : databuff['PCSleft'].toString(),
        UNIT: databuff['UNIT'] == null ? '' : databuff['UNIT'].toString(),
        INTERSEC:
            databuff['INTERSEC'] == null ? '' : databuff['INTERSEC'].toString(),
        RESULTFORMAT: databuff['RESULTFORMAT'] == null
            ? ''
            : databuff['RESULTFORMAT'].toString(),
        GRAPHTYPE: databuff['GRAPHTYPE'] == null
            ? ''
            : databuff['GRAPHTYPE'].toString(),
        GAP: databuff['GAP'] == null ? '' : databuff['GAP'].toString(),
        GAPname:
            databuff['GAPname'] == null ? '' : databuff['GAPname'].toString(),
        GAPnameList: GAPnamePickBUFFER,
        //---- BOTTOM
        preview: previewBUFFER,
        confirmdata: confirmdataBUFFER,
        //---- RIGHT
        ITEMleftUNIT: ITEMleftUNITBUFFER,
        ITEMleftVALUE: ITEMleftVALUEBUFFER,
      );
    } else {
      //
    }
    emit(output);
  }
}
