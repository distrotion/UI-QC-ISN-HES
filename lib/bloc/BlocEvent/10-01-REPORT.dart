import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/model.dart';

//-------------------------------------------------

abstract class REPORT_Event {}

class REPORT_GET extends REPORT_Event {}

class REPORT_Bloc extends Bloc<REPORT_Event, List<dataset>> {
  REPORT_Bloc() : super([]) {
    on<REPORT_GET>((event, emit) {
      return _REPORT_GET([], emit);
    });
  }
  Future<void> _REPORT_GET(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    final response = await Dio().post(
      "http://172.23.10.70:2160/" + 'gas12report',
      data: {},
    );
    List<dataset> output = [];
    if (response.statusCode == 200) {
      var databuff = response.data;
      for (int i = 0; i < databuff.length; i++) {
        output.add(
          dataset(
            id: i + 1,
            f01: databuff[i]['PO'] == null ? '' : databuff[i]['PO'].toString(),
            f02: databuff[i]['CP'] == null ? '' : databuff[i]['CP'].toString(),
            f03: databuff[i]['CUSTOMER'] == null
                ? ''
                : databuff[i]['CUSTOMER'].toString(),
            f04: databuff[i]['PART'] == null
                ? ''
                : databuff[i]['PART'].toString(),
            f05: databuff[i]['PARTNAME'] == null
                ? ''
                : databuff[i]['PARTNAME'].toString(),
          ),
        );
      }
    } else {}
    emit(output);
  }
}
