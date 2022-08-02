import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P3HI-HMV-001/HIHMV001var.dart';

//-------------------------------------------------
String server = GLOserver;
String serverAUTO = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHIHMV001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HIHMV001geteachITEM extends TRICKER_Event {}

class TRICKER_HIHMV001geteachGRAPH extends TRICKER_Event {}

class TRICKER_HIHMV001confirmdata extends TRICKER_Event {}

class TRICKER_HIHMV001confirmdata1 extends TRICKER_Event {}

class TRICKER_HIHMV001confirmdata2 extends TRICKER_Event {}

class TRICKER_HIHMV001CLEAR extends TRICKER_Event {}

class TRICKER_HIHMV001RESETVALUE extends TRICKER_Event {}

class TRICKER_HIHMV001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HIHMV001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HIHMV001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HIHMV001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHIHMV001>((event, emit) {
      return _TRICKER_GETINtoHIHMV001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HIHMV001geteachITEM>((event, emit) {
      return _TRICKER_HIHMV001geteachITEM('', emit);
    });

    on<TRICKER_HIHMV001geteachGRAPH>((event, emit) {
      return _TRICKER_HIHMV001geteachGRAPH('', emit);
    });

    on<TRICKER_HIHMV001confirmdata>((event, emit) {
      return _TRICKER_HIHMV001confirmdata('', emit);
    });

    on<TRICKER_HIHMV001confirmdata1>((event, emit) {
      return _TRICKER_HIHMV001confirmdata1('', emit);
    });

    on<TRICKER_HIHMV001confirmdata2>((event, emit) {
      return _TRICKER_HIHMV001confirmdata2('', emit);
    });

    on<TRICKER_HIHMV001CLEAR>((event, emit) {
      return _TRICKER_HIHMV001CLEAR('', emit);
    });

    on<TRICKER_HIHMV001RESETVALUE>((event, emit) {
      return _TRICKER_HIHMV001RESETVALUE('', emit);
    });

    on<TRICKER_HIHMV001SETZERO>((event, emit) {
      return _TRICKER_HIHMV001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HIHMV001FINISH>((event, emit) {
      return _TRICKER_HIHMV001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHIHMV001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHIHMV001',
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

  Future<void> _TRICKER_HIHMV001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV001-geteachITEM',
      data: {
        "ITEMs": HIHMV001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV001-geteachGRAPH',
      data: {
        "GAPname": HIHMV001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV001confirmdata1(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.20.30.46:1880/' + 'hardness202',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV001confirmdata2(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.20.30.46:1880/' + 'Compound202',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HIHMV001FINISH

  Future<void> _TRICKER_HIHMV001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
