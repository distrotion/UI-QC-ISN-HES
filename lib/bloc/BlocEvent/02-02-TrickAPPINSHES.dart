import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P2APP-INSHES/APPINSHESvar.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoAPPINSHES extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_APPINSHESgeteachITEM extends TRICKER_Event {}

class TRICKER_APPINSHESconfirmdata extends TRICKER_Event {}

class TRICKER_APPINSHESCLEAR extends TRICKER_Event {}

class TRICKER_APPINSHESRESETVALUE extends TRICKER_Event {}

class TRICKER_APPINSHESSETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_APPINSHESFINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_APPINSHES_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_APPINSHES_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoAPPINSHES>((event, emit) {
      return _TRICKER_GETINtoAPPINSHES('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_APPINSHESgeteachITEM>((event, emit) {
      return _TRICKER_APPINSHESgeteachITEM('', emit);
    });

    on<TRICKER_APPINSHESconfirmdata>((event, emit) {
      return _TRICKER_APPINSHESconfirmdata('', emit);
    });

    on<TRICKER_APPINSHESCLEAR>((event, emit) {
      return _TRICKER_APPINSHESCLEAR('', emit);
    });

    on<TRICKER_APPINSHESRESETVALUE>((event, emit) {
      return _TRICKER_APPINSHESRESETVALUE('', emit);
    });

    on<TRICKER_APPINSHESSETZERO>((event, emit) {
      return _TRICKER_APPINSHESSETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_APPINSHESFINISH>((event, emit) {
      return _TRICKER_APPINSHESFINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoAPPINSHES(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoAPPINSHES',
      data: {
        "PO": FIRSTUI.POACTIVE,
        "CP": FIRSTUI.CPACTIVE,
      },
    );
    String output = '';
    if (response.statusCode == 200) {
      var databuff = response.data;
      if (databuff.toString() == 'OK') {
        output = 'OK';
      } else {
        output = 'NOK';
      }
    } else {
      //
    }
    emit(output);
  }

  Future<void> _TRICKER_APPINSHESgeteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPINSHES-geteachITEM',
      data: {
        "ITEMs": APPINSHESvar.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_APPINSHESconfirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPINSHES-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPINSHESCLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPINSHES-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPINSHESRESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPINSHES-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_APPINSHESSETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPINSHES-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_APPINSHESFINISH

  Future<void> _TRICKER_APPINSHESFINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'APPINSHES-FINISH-APR',
      data: {
        "APRitem": APPINSHESvar.ItemPickSELECT,
        "APRre": APPINSHESvar.APPEARANCE,
      },
    );
    emit('OK');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
