import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P5HI-RGH-001/HIRGH001var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHIRGH001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HIRGH001geteachITEM extends TRICKER_Event {}

class TRICKER_HIRGH001geteachGRAPH extends TRICKER_Event {}

class TRICKER_HIRGH001confirmdata extends TRICKER_Event {}

class TRICKER_HIRGH001CLEAR extends TRICKER_Event {}

class TRICKER_HIRGH001RESETVALUE extends TRICKER_Event {}

class TRICKER_HIRGH001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HIRGH001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HIRGH001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HIRGH001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHIRGH001>((event, emit) {
      return _TRICKER_GETINtoHIRGH001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HIRGH001geteachITEM>((event, emit) {
      return _TRICKER_HIRGH001geteachITEM('', emit);
    });

    on<TRICKER_HIRGH001geteachGRAPH>((event, emit) {
      return _TRICKER_HIRGH001geteachGRAPH('', emit);
    });

    on<TRICKER_HIRGH001confirmdata>((event, emit) {
      return _TRICKER_HIRGH001confirmdata('', emit);
    });

    on<TRICKER_HIRGH001CLEAR>((event, emit) {
      return _TRICKER_HIRGH001CLEAR('', emit);
    });

    on<TRICKER_HIRGH001RESETVALUE>((event, emit) {
      return _TRICKER_HIRGH001RESETVALUE('', emit);
    });

    on<TRICKER_HIRGH001SETZERO>((event, emit) {
      return _TRICKER_HIRGH001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HIRGH001FINISH>((event, emit) {
      return _TRICKER_HIRGH001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHIRGH001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHIRGH001',
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

  Future<void> _TRICKER_HIRGH001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIRGH001-geteachITEM',
      data: {
        "ITEMs": HIRGH001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HIRGH001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIRGH001-geteachGRAPH',
      data: {
        "GAPname": HIRGH001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HIRGH001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIRGH001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIRGH001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIRGH001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIRGH001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIRGH001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIRGH001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIRGH001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HIRGH001FINISH

  Future<void> _TRICKER_HIRGH001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIRGH001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
