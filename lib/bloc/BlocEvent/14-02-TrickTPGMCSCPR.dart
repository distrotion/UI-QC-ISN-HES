import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P14TPG-MCS-CPR/TPGMCSCPRvar.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoTPGMCSCPR extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_TPGMCSCPRgeteachITEM extends TRICKER_Event {}

class TRICKER_TPGMCSCPRgeteachGRAPH extends TRICKER_Event {}

class TRICKER_TPGMCSCPRpreview extends TRICKER_Event {}

class TRICKER_TPGMCSCPRconfirmdata extends TRICKER_Event {}

class TRICKER_TPGMCSCPRCLEAR extends TRICKER_Event {}

class TRICKER_TPGMCSCPRRESETVALUE extends TRICKER_Event {}

class TRICKER_TPGMCSCPRSETZERO extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_TPGMCSCPRFINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_TPGMCSCPR_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_TPGMCSCPR_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoTPGMCSCPR>((event, emit) {
      return _TRICKER_GETINtoTPGMCSCPR('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_TPGMCSCPRgeteachITEM>((event, emit) {
      return _TRICKER_TPGMCSCPRgeteachITEM('', emit);
    });

    on<TRICKER_TPGMCSCPRgeteachGRAPH>((event, emit) {
      return _TRICKER_TPGMCSCPRgeteachGRAPH('', emit);
    });

    on<TRICKER_TPGMCSCPRpreview>((event, emit) {
      return _TRICKER_TPGMCSCPRpreview('', emit);
    });

    on<TRICKER_TPGMCSCPRconfirmdata>((event, emit) {
      return _TRICKER_TPGMCSCPRconfirmdata('', emit);
    });

    on<TRICKER_TPGMCSCPRCLEAR>((event, emit) {
      return _TRICKER_TPGMCSCPRCLEAR('', emit);
    });

    on<TRICKER_TPGMCSCPRRESETVALUE>((event, emit) {
      return _TRICKER_TPGMCSCPRRESETVALUE('', emit);
    });

    on<TRICKER_TPGMCSCPRSETZERO>((event, emit) {
      return _TRICKER_TPGMCSCPRSETZERO('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_TPGMCSCPRFINISH>((event, emit) {
      return _TRICKER_TPGMCSCPRFINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoTPGMCSCPR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoTPGMCSCPR',
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

  Future<void> _TRICKER_TPGMCSCPRgeteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'TPGMCSCPR-geteachITEM',
      data: {
        "ITEMs": TPGMCSCPRvar.ItemPickSELECT,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_TPGMCSCPRgeteachGRAPH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'TPGMCSCPR-geteachGRAPH',
      data: {
        "GAPname": TPGMCSCPRvar.GAPname,
      },
    );
    emit('');
  }

  Future<void> _TRICKER_TPGMCSCPRpreview(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'TPGMCSCPR-preview',
      data: [
        {"V1": "LCRUVS", "V2": TPGMCSCPRvar.SINGLEINPUT3}
      ],
    );
    if (response.statusCode == 200) {
      final response = await Dio().post(
        server + 'TPGMCSCPR-confirmdata',
        data: {},
      );
    }
    emit('');
  }

  Future<void> _TRICKER_TPGMCSCPRconfirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'TPGMCSCPR-confirmdata',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_TPGMCSCPRCLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'TPGMCSCPR-CLEAR',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_TPGMCSCPRRESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'TPGMCSCPR-RESETVALUE',
      data: {},
    );
    emit('');
  }

  Future<void> _TRICKER_TPGMCSCPRSETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'TPGMCSCPR-SETZERO',
      data: {},
    );
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_TPGMCSCPRFINISH

  Future<void> _TRICKER_TPGMCSCPRFINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'TPGMCSCPR-FINISH',
      data: {},
    );
    emit('');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
