import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P8LCR-UVS-001/LCRUVS001var.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoLCRUVS001 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_LCRUVS001geteachITEM extends TRICKER_Event {}

class TRICKER_LCRUVS001geteachGRAPH extends TRICKER_Event {}

class TRICKER_LCRUVS001preview extends TRICKER_Event {}

class TRICKER_LCRUVS001confirmdata extends TRICKER_Event {}

class TRICKER_LCRUVS001CLEAR extends TRICKER_Event {}

class TRICKER_LCRUVS001RESETVALUE extends TRICKER_Event {}

class TRICKER_LCRUVS001SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_LCRUVS001FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_LCRUVS001_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_LCRUVS001_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoLCRUVS001>((event, emit) {
      return _TRICKER_GETINtoLCRUVS001('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_LCRUVS001geteachITEM>((event, emit) {
      return _TRICKER_LCRUVS001geteachITEM('', emit);
    });

    on<TRICKER_LCRUVS001geteachGRAPH>((event, emit) {
      return _TRICKER_LCRUVS001geteachGRAPH('', emit);
    });

    on<TRICKER_LCRUVS001preview>((event, emit) {
      return _TRICKER_LCRUVS001preview('', emit);
    });

    on<TRICKER_LCRUVS001confirmdata>((event, emit) {
      return _TRICKER_LCRUVS001confirmdata('', emit);
    });

    on<TRICKER_LCRUVS001CLEAR>((event, emit) {
      return _TRICKER_LCRUVS001CLEAR('', emit);
    });

    on<TRICKER_LCRUVS001RESETVALUE>((event, emit) {
      return _TRICKER_LCRUVS001RESETVALUE('', emit);
    });

    on<TRICKER_LCRUVS001SETZERO>((event, emit) {
      return _TRICKER_LCRUVS001SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_LCRUVS001FINISH>((event, emit) {
      return _TRICKER_LCRUVS001FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoLCRUVS001(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoLCRUVS001',
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

  Future<void> _TRICKER_LCRUVS001geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'LCRUVS001-geteachITEM',
      data: {
        "ITEMs": LCRUVS001var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_LCRUVS001geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'LCRUVS001-geteachGRAPH',
      data: {
        "GAPname": LCRUVS001var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_LCRUVS001preview(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'LCRUVS001-preview',
      data: [
        {"V1": "LCRUVS", "V2": LCRUVS001var.SINGLEINPUT}
      ],
    );
    if (response.statusCode == 200) {
      final response = await Dio().post(
        server + 'LCRUVS001-confirmdata',
        data: {},
      );
    }
    emit('');
  }

  Future<void> _TRICKER_LCRUVS001confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'LCRUVS001-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_LCRUVS001CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'LCRUVS001-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_LCRUVS001RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'LCRUVS001-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_LCRUVS001SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'LCRUVS001-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_LCRUVS001FINISH

  Future<void> _TRICKER_LCRUVS001FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'LCRUVS001-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
