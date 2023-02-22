import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/Cubit/31-ReportPDFCommoncubit.dart';
import 'P31ReportPDFcommon/ReportPDFCommonMain.dart';

class Page31 extends StatelessWidget {
  const Page31({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page31BlocTableBody();
  }
}

class Page31BlocTableBody extends StatelessWidget {
  const Page31BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportPDFCommon_Cubit(),
      child: BlocBuilder<ReportPDFCommon_Cubit, CommonReportOutput>(
        builder: (context, dataCommon) {
          return Page31Body(
            dataCommon: dataCommon,
          );
        },
      ),
    );
  }
}

class Page31Body extends StatelessWidget {
  Page31Body({Key? key, this.dataCommon}) : super(key: key);

  CommonReportOutput? dataCommon;

  @override
  Widget build(BuildContext context) {
    return ReportPDFCommon(
      dataCommon: dataCommon,
    );
  }
}
