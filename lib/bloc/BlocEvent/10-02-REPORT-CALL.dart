import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/NotificationEvent.dart';

import '../../data/global.dart';
import '../../page/P10REPORT/REPORTvar.dart';

//-------------------------------------------------

String server = GLOserver;

abstract class REPORT_CALL_Event {}

class REPORT_CALL extends REPORT_CALL_Event {}

class REPORT_CALL_FLUSH extends REPORT_CALL_Event {}

class REPORT_COPPY extends REPORT_CALL_Event {}

class REPORT_CALL_RESET extends REPORT_CALL_Event {}

class REPORT_CALL_Bloc extends Bloc<REPORT_CALL_Event, String> {
  REPORT_CALL_Bloc() : super('') {
    on<REPORT_CALL>((event, emit) {
      return _REPORT_CALL('', emit);
    });
    on<REPORT_CALL_FLUSH>((event, emit) {
      return _REPORT_CALL_FLUSH('', emit);
    });

    on<REPORT_COPPY>((event, emit) {
      return _REPORT_COPPY('', emit);
    });
    on<REPORT_CALL_RESET>((event, emit) {
      return _REPORT_CALL_RESET('', emit);
    });
  }
  Future<void> _REPORT_CALL(String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      "http://172.23.10.70:2160/" + 'gas12reportGEN',
      data: {
        "PO": REPORTvar.PO,
      },
    );
    String output = '';
    if (response.statusCode == 200) {
      output = 'get';
    }
    emit(output);
  }

//
  Future<void> _REPORT_CALL_RESET(String toAdd, Emitter<String> emit) async {
    final response = await Dio().post(
      "http://172.20.30.46:2220/" + 'RESET_REPORT',
      data: {},
    );
    emit('');
  }

  //3310266634

  Future<void> _REPORT_COPPY(String toAdd, Emitter<String> emit) async {
    String output = 'R_NOK';
    final response = await Dio().post(
      server + 'CopyReport',
      data: {
        "original": REPORTvar.original,
        "new": REPORTvar.newreport,
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      print(databuff);
      if (databuff.toString() == "OK") {
        output = 'R_OK';
        BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
            "Success", "Coppy report OK", enumNotificationlist.Success);
      } else {
        BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
            "orderError",
            "please check input and output PO",
            enumNotificationlist.Error);
      }
    }
    emit(output);
  }

  Future<void> _REPORT_CALL_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
