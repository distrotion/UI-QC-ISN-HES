import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';
import '../../page/P7TPG-MCS-001/MCS-INSHESmain.dart';
import '../../page/P7TPG-MCS-001/MCS-INSHESvar.dart';
import '07-01-TPGMCS001.dart';

//-------------------------------------------------
String server = GLOserver;
String serverR = 'http://172.20.30.46:1880/';

abstract class TRICKER_Event {}

//--------------------------------

class TRICKER_GETINtoMCSINSHES extends TRICKER_Event {}

//-------------------------------- non returnfunction

class TRICKER_MCSINSHESgeteachITEM extends TRICKER_Event {}

class TRICKER_MCSINSHESgeteachGRAPH extends TRICKER_Event {}

class TRICKER_MCSINSHESconfirmdata extends TRICKER_Event {}

class TRICKER_MCSINSHESCLEAR extends TRICKER_Event {}

class TRICKER_MCSINSHESRESETVALUE extends TRICKER_Event {}

class TRICKER_MCSINSHESSETZERO extends TRICKER_Event {}

//

class TRICKER_MCSINSHESgetPR extends TRICKER_Event {}

class TRICKER_MCSINSHESgetCP extends TRICKER_Event {}

//-------------------------------- FINISH

class TRICKER_MCSINSHESFINISH extends TRICKER_Event {}

//-------------------------------- no request

class TRICKER_FLUSH extends TRICKER_Event {}

class TRICKER_MCSINSHES_Bloc extends Bloc<TRICKER_Event, String> {
  TRICKER_MCSINSHES_Bloc() : super('') {
    //--------------------------------
    on<TRICKER_GETINtoMCSINSHES>((event, emit) {
      return _TRICKER_GETINtoMCSINSHES('', emit);
    });

    //-------------------------------- non returnfunction

    on<TRICKER_MCSINSHESgeteachITEM>((event, emit) {
      return _TRICKER_MCSINSHESgeteachITEM('', emit);
    });

    on<TRICKER_MCSINSHESconfirmdata>((event, emit) {
      return _TRICKER_MCSINSHESconfirmdata('', emit);
    });

    on<TRICKER_MCSINSHESCLEAR>((event, emit) {
      return _TRICKER_MCSINSHESCLEAR('', emit);
    });

    on<TRICKER_MCSINSHESRESETVALUE>((event, emit) {
      return _TRICKER_MCSINSHESRESETVALUE('', emit);
    });

    on<TRICKER_MCSINSHESSETZERO>((event, emit) {
      return _TRICKER_MCSINSHESSETZERO('', emit);
    });
    //
    on<TRICKER_MCSINSHESgetPR>((event, emit) {
      return _TRICKER_MCSINSHESgetPR('', emit);
    });

    on<TRICKER_MCSINSHESgetCP>((event, emit) {
      return _TRICKER_MCSINSHESgetCP('', emit);
    });

    //-------------------------------- FINISH

    on<TRICKER_MCSINSHESFINISH>((event, emit) {
      return _TRICKER_MCSINSHESFINISH('', emit);
    });

    //-------------------------------- no request

    on<TRICKER_FLUSH>((event, emit) {
      return _TRICKER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKER_GETINtoMCSINSHES(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoMCSINSHES',
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
    MICROSCOPEMCSINSHES_CONTEXT.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
    emit(output);
  }

  Future<void> _TRICKER_MCSINSHESgeteachITEM(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'MCSINSHES-geteachITEM',
      data: {
        "ITEMs": MCSINSHESvar.ItemPickSELECT,
      },
    );
    MICROSCOPEMCSINSHES_CONTEXT.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
    emit('');
  }

  Future<void> _TRICKER_MCSINSHESconfirmdata(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'MCSINSHES-confirmdata',
      data: {},
    );
    MICROSCOPEMCSINSHES_CONTEXT.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
    emit('');
  }

  Future<void> _TRICKER_MCSINSHESCLEAR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'MCSINSHES-CLEAR',
      data: {},
    );
    MICROSCOPEMCSINSHES_CONTEXT.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
    emit('');
  }

  Future<void> _TRICKER_MCSINSHESRESETVALUE(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'MCSINSHES-RESETVALUE',
      data: {},
    );
    MICROSCOPEMCSINSHES_CONTEXT.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
    emit('');
  }

  Future<void> _TRICKER_MCSINSHESSETZERO(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'MCSINSHES-SETZERO',
      data: {},
    );
    emit('');
  }

  //
  Future<void> _TRICKER_MCSINSHESgetPR(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      serverR + 'getPR',
      data: {
        "MC": MCSINSHESvar.selectINS,
      },
    );
    String output = '';
    if (response.statusCode == 200) {
      var databuff = response.data;
      MCSINSHESvar.base64pic01data =
          databuff['DATA1'] != null ? databuff['DATA1'].toString() : "";
      MCSINSHESvar.base64pic02data =
          databuff['DATA2'] != null ? databuff['DATA2'].toString() : "";
      MCSINSHESvar.base64pic03data =
          databuff['DATA3'] != null ? databuff['DATA3'].toString() : "";
      MCSINSHESvar.base64pic04data =
          databuff['DATA4'] != null ? databuff['DATA4'].toString() : "";
    } else {
      //
    }
    MICROSCOPEMCSINSHES_CONTEXT.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
    emit(output);
  }

  Future<void> _TRICKER_MCSINSHESgetCP(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      serverR + 'getCP',
      data: {
        "MC": MCSINSHESvar.selectINS,
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      MCSINSHESvar.base64pic01data =
          databuff['DATA1'] != null ? databuff['DATA1'].toString() : "";
      MCSINSHESvar.base64pic02data =
          databuff['DATA2'] != null ? databuff['DATA2'].toString() : "";
      MCSINSHESvar.base64pic03data =
          databuff['DATA3'] != null ? databuff['DATA3'].toString() : "";
      MCSINSHESvar.base64pic04data =
          databuff['DATA4'] != null ? databuff['DATA4'].toString() : "";
    } else {
      //
    }
    MICROSCOPEMCSINSHES_CONTEXT.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
    emit('');
  }

  //-------------------------------- FINISH
  //TRICKER_MCSINSHESFINISH

  Future<void> _TRICKER_MCSINSHESFINISH(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'MCSINSHES-FINISH-IMG',
      data: {
        "IMG01": MCSINSHESvar.base64pic01,
        "IMG02": MCSINSHESvar.base64pic02,
        "IMG03": MCSINSHESvar.base64pic03,
        "IMG04": MCSINSHESvar.base64pic04,
        "IMG01data": MCSINSHESvar.base64pic01data,
        "IMG02data": MCSINSHESvar.base64pic02data,
        "IMG03data": MCSINSHESvar.base64pic03data,
        "IMG04data": MCSINSHESvar.base64pic04data,
      },
    );
    if (response.statusCode == 200) {
      MICROSCOPEMCSINSHES_CONTEXT.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
    }

    emit('OK');
  }

  //-------------------------------- no request

  Future<void> _TRICKER_FLUSH(String toAdd, Emitter<String> emit) async {
    MICROSCOPEMCSINSHES_CONTEXT.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
    emit('');
  }
}
