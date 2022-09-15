import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P4HI-HMV-002/HIHMV002var.dart';

//-------------------------------------------------
String server = GLOserver;
String serverAUTO = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoHIHMV002 extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_HIHMV002geteachITEM extends TRICKER_Event {}

class TRICKER_HIHMV002geteachGRAPH extends TRICKER_Event {}

class TRICKER_HIHMV002confirmdata extends TRICKER_Event {}

class TRICKER_HIHMV002confirmdata1 extends TRICKER_Event {}

class TRICKER_HIHMV002confirmdata2 extends TRICKER_Event {}

class TRICKER_HIHMV002confirmdata3 extends TRICKER_Event {}

class TRICKER_HIHMV002CLEAR extends TRICKER_Event {}

class TRICKER_HIHMV002RESETVALUE extends TRICKER_Event {}

class TRICKER_HIHMV002SETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_HIHMV002FINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_HIHMV002_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_HIHMV002_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoHIHMV002>((event, emit) {
      return _TRICKER_GETINtoHIHMV002('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_HIHMV002geteachITEM>((event, emit) {
      return _TRICKER_HIHMV002geteachITEM('', emit);
    });

    on<TRICKER_HIHMV002geteachGRAPH>((event, emit) {
      return _TRICKER_HIHMV002geteachGRAPH('', emit);
    });

    on<TRICKER_HIHMV002confirmdata>((event, emit) {
      return _TRICKER_HIHMV002confirmdata('', emit);
    });

    on<TRICKER_HIHMV002confirmdata1>((event, emit) {
      return _TRICKER_HIHMV002confirmdata1('', emit);
    });

    on<TRICKER_HIHMV002confirmdata2>((event, emit) {
      return _TRICKER_HIHMV002confirmdata2('', emit);
    });
    //
    on<TRICKER_HIHMV002confirmdata3>((event, emit) {
      return _TRICKER_HIHMV002confirmdata3('', emit);
    });

    on<TRICKER_HIHMV002CLEAR>((event, emit) {
      return _TRICKER_HIHMV002CLEAR('', emit);
    });

    on<TRICKER_HIHMV002RESETVALUE>((event, emit) {
      return _TRICKER_HIHMV002RESETVALUE('', emit);
    });

    on<TRICKER_HIHMV002SETZERO>((event, emit) {
      return _TRICKER_HIHMV002SETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_HIHMV002FINISH>((event, emit) {
      return _TRICKER_HIHMV002FINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoHIHMV002(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoHIHMV002',
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

  Future<void> _TRICKER_HIHMV002geteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV002-geteachITEM',
      data: {
        "ITEMs": HIHMV002var.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV002geteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV002-geteachGRAPH',
      data: {
        "GAPname": HIHMV002var.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV002confirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV002-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV002confirmdata1(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.20.30.46:1880/' + 'hardness203',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV002confirmdata2(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.20.30.46:1880/' + 'Compound203',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV002confirmdata3(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      'http://172.20.30.46:1880/' + 'PR203',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV002CLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV002-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV002RESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV002-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_HIHMV002SETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV002-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_HIHMV002FINISH

  Future<void> _TRICKER_HIHMV002FINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'HIHMV002-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
