import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/18-1-registerpo.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../widget/common/ComInputText.dart';
import 'VARNEWPASS.dart';

class NEWPASSmain extends StatelessWidget {
  NEWPASSmain({Key? key, this.data}) : super(key: key);
  int? data;

  @override
  Widget build(BuildContext context) {
    return NEWPASSbody(
      data: data,
    );
  }
}

class NEWPASSbody extends StatelessWidget {
  NEWPASSbody({Key? key, this.data}) : super(key: key);
  int? data;
  @override
  Widget build(BuildContext context) {
    return NEWPASSBox(
      data: data,
    );
  }
}

class NEWPASSBox extends StatefulWidget {
  NEWPASSBox({Key? key, this.data}) : super(key: key);
  int? data;

  @override
  State<NEWPASSBox> createState() => _NEWPASSBoxState();
}

class _NEWPASSBoxState extends State<NEWPASSBox> {
  @override
  Widget build(BuildContext context) {
    if (widget.data == 2) {
      // BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
      //     "Success", "Change password complete", enumNotificationlist.Success);
      NEWPASS.NEWPASS01 = '';
      NEWPASS.NEWPASS02 = '';
      NEWPASS.OLDPASS = '';
      NEWPASS.isNEWPASS = true;
      setState(() {});
    } else if (widget.data == 1) {
      // BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
      //     "err", "PASSWORD INCORRECT", enumNotificationlist.Error);
    }

    return Center(
      child: Container(
        height: 400,
        width: 350,
        child: SingleChildScrollView(
            child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 50, end: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 40,
                  width: 350,
                  child: ComInputText(
                    isPassword: true,
                    sPlaceholder: "OLD PASSWORD",
                    nLimitedChar: 18,
                    height: 40,
                    width: 350,
                    isContr: NEWPASS.isNEWPASS,
                    fnContr: (input) {
                      NEWPASS.isNEWPASS = input;
                    },
                    sValue: NEWPASS.OLDPASS,
                    returnfunc: (String s) {
                      NEWPASS.OLDPASS = s;
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 40,
                  width: 350,
                  child: ComInputText(
                    isPassword: true,
                    sPlaceholder: "NEW PASSWORD",
                    nLimitedChar: 18,
                    height: 40,
                    width: 350,
                    isContr: NEWPASS.isNEWPASS,
                    fnContr: (input) {
                      NEWPASS.isNEWPASS = input;
                    },
                    sValue: NEWPASS.NEWPASS01,
                    returnfunc: (String s) {
                      NEWPASS.NEWPASS01 = s;
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 40,
                  width: 350,
                  child: ComInputText(
                    isPassword: true,
                    sPlaceholder: "NEW PASSWORD AGAIN",
                    nLimitedChar: 18,
                    height: 40,
                    width: 350,
                    isContr: NEWPASS.isNEWPASS,
                    fnContr: (input) {
                      NEWPASS.isNEWPASS = input;
                    },
                    sValue: NEWPASS.NEWPASS02,
                    returnfunc: (String s) {
                      NEWPASS.NEWPASS02 = s;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _RegisterButton(
                  data: widget.data,
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  _RegisterButton({Key? key, this.data}) : super(key: key);
  int? data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (NEWPASS.NEWPASS01 != '' && NEWPASS.NEWPASS02 != '') {
            if (NEWPASS.NEWPASS01 == NEWPASS.NEWPASS02) {
              context.read<RegisterPOID_Bloc>().add(CHANGEPASS_Pressed());
            } else {
              BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
                  "WARNING",
                  "PASSWORD NOT MATCH",
                  enumNotificationlist.Warning);
            }
          }
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "CHANGE PASSWORD",
              style: TextStyle(
                fontFamily: 'Mitr',
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
              ),
            ),
          ),
        ));
  }
}
