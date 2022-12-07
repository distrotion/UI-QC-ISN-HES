import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P12HI-MICM-001/HIMICM001var.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHIMICM001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HIMICM001geteachITEM extends TRICKER_Event {}

class TRICKER_HIMICM001geteachGRAPH extends TRICKER_Event {}

class TRICKER_HIMICM001confirmdata extends TRICKER_Event {}

class TRICKER_HIMICM001CLEAR extends TRICKER_Event {}

class TRICKER_HIMICM001RESETVALUE extends TRICKER_Event {}

class TRICKER_HIMICM001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HIMICM001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HIMICM001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HIMICM001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHIMICM001>((event, emit) {
      return _TRICKER_GETINtoHIMICM001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HIMICM001geteachITEM>((event, emit) {
      return _TRICKER_HIMICM001geteachITEM('', emit);
    });

    on<TRICKER_HIMICM001geteachGRAPH>((event, emit) {
      return _TRICKER_HIMICM001geteachGRAPH('', emit);
    });

    on<TRICKER_HIMICM001confirmdata>((event, emit) {
      return _TRICKER_HIMICM001confirmdata('', emit);
    });

    on<TRICKER_HIMICM001CLEAR>((event, emit) {
      return _TRICKER_HIMICM001CLEAR('', emit);
    });

    on<TRICKER_HIMICM001RESETVALUE>((event, emit) {
      return _TRICKER_HIMICM001RESETVALUE('', emit);
    });

    on<TRICKER_HIMICM001SETZERO>((event, emit) {
      return _TRICKER_HIMICM001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HIMICM001FINISH>((event, emit) {
      return _TRICKER_HIMICM001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHIMICM001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHIMICM001',
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

  Future<void> _TRICKER_HIMICM001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMICM001-geteachITEM',
      data: {
        "ITEMs": HIMICM001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HIMICM001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMICM001-geteachGRAPH',
      data: {
        "GAPname": HIMICM001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HIMICM001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMICM001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIMICM001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMICM001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIMICM001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMICM001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIMICM001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMICM001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HIMICM001FINISH

  Future<void> _TRICKER_HIMICM001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIMICM001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
