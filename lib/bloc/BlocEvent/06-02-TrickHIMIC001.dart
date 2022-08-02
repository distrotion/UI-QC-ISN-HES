import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P6HI-MIC-001/HIMIC001var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHIMIC001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HIMIC001geteachITEM extends TRICKER_Event {}

class TRICKER_HIMIC001geteachGRAPH extends TRICKER_Event {}

class TRICKER_HIMIC001confirmdata extends TRICKER_Event {}

class TRICKER_HIMIC001CLEAR extends TRICKER_Event {}

class TRICKER_HIMIC001RESETVALUE extends TRICKER_Event {}

class TRICKER_HIMIC001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HIMIC001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HIMIC001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HIMIC001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHIMIC001>((event, emit) {
      return _TRICKER_GETINtoHIMIC001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HIMIC001geteachITEM>((event, emit) {
      return _TRICKER_HIMIC001geteachITEM('', emit);
    });

    on<TRICKER_HIMIC001geteachGRAPH>((event, emit) {
      return _TRICKER_HIMIC001geteachGRAPH('', emit);
    });

    on<TRICKER_HIMIC001confirmdata>((event, emit) {
      return _TRICKER_HIMIC001confirmdata('', emit);
    });

    on<TRICKER_HIMIC001CLEAR>((event, emit) {
      return _TRICKER_HIMIC001CLEAR('', emit);
    });

    on<TRICKER_HIMIC001RESETVALUE>((event, emit) {
      return _TRICKER_HIMIC001RESETVALUE('', emit);
    });

    on<TRICKER_HIMIC001SETZERO>((event, emit) {
      return _TRICKER_HIMIC001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HIMIC001FINISH>((event, emit) {
      return _TRICKER_HIMIC001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHIMIC001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHIMIC001',
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

  Future<void> _TRICKER_HIMIC001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMIC001-geteachITEM',
      data: {
        "ITEMs": HIMIC001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HIMIC001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMIC001-geteachGRAPH',
      data: {
        "GAPname": HIMIC001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HIMIC001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMIC001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIMIC001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMIC001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIMIC001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMIC001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIMIC001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMIC001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HIMIC001FINISH

  Future<void> _TRICKER_HIMIC001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMIC001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
