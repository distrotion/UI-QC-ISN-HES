import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P1FIRSTUI/FIRSTuiVAR.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoAPPINSHES extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHIHMV001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHIHMV002 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHIRGH001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoLCRUVS001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHIMICM001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoTPGMCSCPR extends TRICKERMASTER_Event {}

//

class TRICKERMASTER_GETINtoMCSINSHES extends TRICKERMASTER_Event {}

class TRICKERMASTER_GETINtoHIMIC001 extends TRICKERMASTER_Event {}

class TRICKERMASTER_FLUSH extends TRICKERMASTER_Event {}

class TRICKERMASTER_Bloc extends Bloc<TRICKERMASTER_Event, String> {
  TRICKERMASTER_Bloc() : super('') {
    on<TRICKERMASTER_GETINtoAPPINSHES>((event, emit) {
      return _TRICKERMASTER_GETINtoAPPINSHES('', emit);
    });

    on<TRICKERMASTER_GETINtoHIHMV001>((event, emit) {
      return _TRICKERMASTER_GETINtoHIHMV001('', emit);
    });

    on<TRICKERMASTER_GETINtoHIHMV002>((event, emit) {
      return _TRICKERMASTER_GETINtoHIHMV002('', emit);
    });

    on<TRICKERMASTER_GETINtoHIRGH001>((event, emit) {
      return _TRICKERMASTER_GETINtoHIRGH001('', emit);
    });

    on<TRICKERMASTER_GETINtoHIMIC001>((event, emit) {
      return _TRICKERMASTER_GETINtoHIMIC001('', emit);
    });

    on<TRICKERMASTER_GETINtoMCSINSHES>((event, emit) {
      return _TRICKERMASTER_GETINtoMCSINSHES('', emit);
    });

    on<TRICKERMASTER_GETINtoLCRUVS001>((event, emit) {
      return _TRICKERMASTER_GETINtoLCRUVS001('', emit);
    });

    on<TRICKERMASTER_GETINtoHIMICM001>((event, emit) {
      return _TRICKERMASTER_GETINtoHIMICM001('', emit);
    });

    on<TRICKERMASTER_GETINtoTPGMCSCPR>((event, emit) {
      return _TRICKERMASTER_GETINtoTPGMCSCPR('', emit);
    });

    on<TRICKERMASTER_FLUSH>((event, emit) {
      return _TRICKERMASTER_FLUSH('', emit);
    });
  }

  Future<void> _TRICKERMASTER_GETINtoAPPINSHES(
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

  Future<void> _TRICKERMASTER_GETINtoHIHMV001(
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

  Future<void> _TRICKERMASTER_GETINtoHIHMV002(
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

  Future<void> _TRICKERMASTER_GETINtoHIRGH001(
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

  Future<void> _TRICKERMASTER_GETINtoMCSINSHES(
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
    emit(output);
  }

  Future<void> _TRICKERMASTER_GETINtoHIMIC001(
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

  Future<void> _TRICKERMASTER_GETINtoLCRUVS001(
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

  //
  Future<void> _TRICKERMASTER_GETINtoHIMICM001(
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

  Future<void> _TRICKERMASTER_GETINtoTPGMCSCPR(
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

  Future<void> _TRICKERMASTER_GETINtoAPPGASGW(
      String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      server + 'GETINtoAPPGASGW',
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

  Future<void> _TRICKERMASTER_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
