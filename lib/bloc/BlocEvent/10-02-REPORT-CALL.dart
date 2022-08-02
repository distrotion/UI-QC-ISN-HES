import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../page/P10REPORT/REPORTvar.dart';

//-------------------------------------------------

abstract class REPORT_CALL_Event {}

class REPORT_CALL extends REPORT_CALL_Event {}

class REPORT_CALL_FLUSH extends REPORT_CALL_Event {}

class REPORT_CALL_RESET extends REPORT_CALL_Event {}

class REPORT_CALL_Bloc extends Bloc<REPORT_CALL_Event, String> {
  REPORT_CALL_Bloc() : super('') {
    on<REPORT_CALL>((event, emit) {
      return _REPORT_CALL('', emit);
    });
    on<REPORT_CALL_FLUSH>((event, emit) {
      return _REPORT_CALL_FLUSH('', emit);
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

  Future<void> _REPORT_CALL_FLUSH(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
