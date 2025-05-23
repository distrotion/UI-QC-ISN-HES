import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../page/P303QMMASTERQC/P303QMMASTERQCVAR.dart';
import '../../page/P31ReportPDFcommon/ReportPDFCommonvar.dart';

class menu_normal extends StatelessWidget {
  menu_normal(
      {Key? key, this.name, this.icon, required this.page, required this.Lv})
      : super(key: key);
  String? name;
  Widget page;
  String? icon;
  int Lv;

  @override
  Widget build(BuildContext context) {
    String _name = name ?? "";
    ReportPDFCommonvar.PO = '';
    ReportPDFCommonvar.PO = '';
    P303QMMASTERQCVAR.SETDAY = '';

    return InkWell(
      onTap: () {
        // BlocProvider.of<SwPageCubit>(context).togglePage(page);
        CuPage = page;
        CuPageLV = Lv;
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage());
      },
      child: Container(
        //color: Colors.blue,
        height: 50,
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.shade400,
                    // image: DecorationImage(
                    //   image: AssetImage(""),
                    //   fit: BoxFit.fitWidth,
                    // ),
                    //borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  )),
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "   " + _name,
                  style: const TextStyle(
                    fontFamily: 'Mitr',
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
