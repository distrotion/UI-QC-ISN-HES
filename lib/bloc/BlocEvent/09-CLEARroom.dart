import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------
String server = GLOserver;

abstract class CLEARroom_Event {}

class CLEARroom_READ extends CLEARroom_Event {}

class CLEARroom_CLEAR extends CLEARroom_Event {}

class CLEARroom_Bloc extends Bloc<CLEARroom_Event, CLEARroomENV> {
  CLEARroom_Bloc() : super(CLEARroomENV()) {
    on<CLEARroom_READ>((event, emit) {
      return _CLEARroom_READ(CLEARroomENV(), emit);
    });
    on<CLEARroom_CLEAR>((event, emit) {
      return _CLEARroom_CLEAR(CLEARroomENV(), emit);
    });
  }
  Future<void> _CLEARroom_READ(
      CLEARroomENV toAdd, Emitter<CLEARroomENV> emit) async {
    final resPO1 = await Dio().post(
      server + "APPINSHESdb",
      data: {},
    );
    final resPO2 = await Dio().post(
      server + "HIHMV001db",
      data: {},
    );
    final resPO3 = await Dio().post(
      server + "HIHMV002db",
      data: {},
    );
    final resPO4 = await Dio().post(
      server + "HIRGH001db",
      data: {},
    );
    final resPO5 = await Dio().post(
      server + "HIMIC001db",
      data: {},
    );
    final resPO6 = await Dio().post(
      server + "MCSINSHESdb",
      data: {},
    );
    final resPO7 = await Dio().post(
      server + "LCRUVS001db",
      data: {},
    );
    final resPO8 = await Dio().post(
      server + "HIMICM001db",
      data: {},
    );
    final resPO9 = await Dio().post(
      server + "TPGMCSCPRdb",
      data: {},
    );

    CLEARroomENV output = CLEARroomENV();

    if (resPO1.statusCode == 200 &&
        resPO2.statusCode == 200 &&
        resPO3.statusCode == 200 &&
        resPO4.statusCode == 200 &&
        resPO5.statusCode == 200 &&
        resPO6.statusCode == 200 &&
        resPO7.statusCode == 200 &&
        resPO8.statusCode == 200 &&
        resPO9.statusCode == 200) {
      output.PO1 = resPO1.data['PO'] ?? '';
      output.PO2 = resPO2.data['PO'] ?? '';
      output.PO3 = resPO3.data['PO'] ?? '';
      output.PO4 = resPO4.data['PO'] ?? '';
      output.PO5 = resPO5.data['PO'] ?? '';
      output.PO6 = resPO6.data['PO'] ?? '';
      output.PO7 = resPO7.data['PO'] ?? '';
      output.PO8 = resPO8.data['PO'] ?? '';
      output.PO9 = resPO9.data['PO'] ?? '';
    }

    emit(output);
  }

  Future<void> _CLEARroom_CLEAR(
      CLEARroomENV toAdd, Emitter<CLEARroomENV> emit) async {
    print(CLEARroomdata.room);
    if (CLEARroomdata.room == 'PO1') {
      final response = await Dio().post(
        server + 'APPINSHES-SETZERO',
        data: {},
      );
    } else if (CLEARroomdata.room == 'PO2') {
      final response = await Dio().post(
        server + 'HIHMV001-SETZERO',
        data: {},
      );
    } else if (CLEARroomdata.room == 'PO3') {
      final response = await Dio().post(
        server + 'HIHMV002-SETZERO',
        data: {},
      );
    } else if (CLEARroomdata.room == 'PO4') {
      final response = await Dio().post(
        server + 'HIRGH001-SETZERO',
        data: {},
      );
    } else if (CLEARroomdata.room == 'PO5') {
      final response = await Dio().post(
        server + 'HIMIC001-SETZERO',
        data: {},
      );
    } else if (CLEARroomdata.room == 'PO6') {
      final response = await Dio().post(
        server + 'MCSINSHES-SETZERO',
        data: {},
      );
    } else if (CLEARroomdata.room == 'PO7') {
      final response = await Dio().post(
        server + 'LCRUVS001-SETZERO',
        data: {},
      );
    } else if (CLEARroomdata.room == 'PO8') {
      final response = await Dio().post(
        server + 'HIMICM001-SETZERO',
        data: {},
      );
    } else if (CLEARroomdata.room == 'PO9') {
      final response = await Dio().post(
        server + 'TPGMCSCPR-SETZERO',
        data: {},
      );
    }
    //HIMICM001-preview

    //-============

    final resPO1 = await Dio().post(
      server + "APPINSHESdb",
      data: {},
    );
    final resPO2 = await Dio().post(
      server + "HIHMV001db",
      data: {},
    );
    final resPO3 = await Dio().post(
      server + "HIHMV002db",
      data: {},
    );
    final resPO4 = await Dio().post(
      server + "HIRGH001db",
      data: {},
    );
    final resPO5 = await Dio().post(
      server + "HIMIC001db",
      data: {},
    );
    final resPO6 = await Dio().post(
      server + "MCSINSHESdb",
      data: {},
    );
    final resPO7 = await Dio().post(
      server + "LCRUVS001db",
      data: {},
    );
    final resPO8 = await Dio().post(
      server + "HIMICM001db",
      data: {},
    );
    final resPO9 = await Dio().post(
      server + "TPGMCSCPRdb",
      data: {},
    );

    //HIMICM001

    CLEARroomENV output = CLEARroomENV();

    if (resPO1.statusCode == 200 &&
        resPO2.statusCode == 200 &&
        resPO3.statusCode == 200 &&
        resPO4.statusCode == 200 &&
        resPO5.statusCode == 200 &&
        resPO6.statusCode == 200 &&
        resPO7.statusCode == 200 &&
        resPO8.statusCode == 200 &&
        resPO9.statusCode == 200) {
      output.PO1 = resPO1.data['PO'] ?? '';
      output.PO2 = resPO2.data['PO'] ?? '';
      output.PO3 = resPO3.data['PO'] ?? '';
      output.PO4 = resPO4.data['PO'] ?? '';
      output.PO5 = resPO5.data['PO'] ?? '';
      output.PO6 = resPO6.data['PO'] ?? '';
      output.PO7 = resPO7.data['PO'] ?? '';
      output.PO8 = resPO8.data['PO'] ?? '';
      output.PO9 = resPO9.data['PO'] ?? '';
    }

    emit(output);
  }
}

class CLEARroomdata {
  static String room = '';
}

class CLEARroomENV {
  CLEARroomENV({
    this.PO1 = '',
    this.PO2 = '',
    this.PO3 = '',
    this.PO4 = '',
    this.PO5 = '',
    this.PO6 = '',
    this.PO7 = '',
    this.PO8 = '',
    this.PO9 = '',
  });

  String PO1;
  String PO2;
  String PO3;
  String PO4;
  String PO5;
  String PO6;
  String PO7;
  String PO8;
  String PO9;
}
