import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../data/global.dart';

import '../../page/P18NEWPASSWORD/VARNEWPASS.dart';

import '../cubit/NotificationEvent.dart';

//-------------------------------------------------
// String server = 'http://127.0.0.1:15000/';
// String server = GLOserver;
String server = 'http://172.23.10.40:16714/';

abstract class RegisterPOID_Event {}

class CHANGEPASS_Pressed extends RegisterPOID_Event {}

class RegisterPOID_Bloc extends Bloc<RegisterPOID_Event, int> {
  RegisterPOID_Bloc() : super(0) {
    on<CHANGEPASS_Pressed>((event, emit) {
      return _CHANGEPASSWORD_Function(0, emit);
    });
  }

  Future<void> _CHANGEPASSWORD_Function(int toAdd, Emitter<int> emit) async {
    final response = await Dio().post(
      server + "newpass",
      data: {
        "ID": USERDATA.ID,
        "PASS": NEWPASS.OLDPASS,
        "NEWPASS": NEWPASS.NEWPASS01,
      },
    );
    int output = 0;

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      if (databuff['return'].toString() == 'PASSWORD INCORRECT') {
        output = 1;
        BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
            "err", "PASSWORD INCORRECT", enumNotificationlist.Error);
      } else {
        BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
            "Success",
            "Change password complete",
            enumNotificationlist.Success);
        output = 2;
      }
    } else {
      output = 3;
    }
    emit(output);
  }
}
