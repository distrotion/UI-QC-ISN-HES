import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/Cubit/32-ReportPDFACTcubit.dart';
import '../model/model.dart';
import 'P32ReportPDFACT/ReportPDFACT.dart';

class Page32 extends StatelessWidget {
  const Page32({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page32BlocTableBody();
  }
}

class Page32BlocTableBody extends StatelessWidget {
  const Page32BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ReportPDFACTcubit_Cubit(),
        child: BlocBuilder<ReportPDFACTcubit_Cubit, ACTReportOutput>(
          builder: (context, dataACT) {
            return Page32Body(
              dataACT: dataACT,
            );
          },
        ));
  }
}

class Page32Body extends StatelessWidget {
  Page32Body({Key? key, this.dataACT}) : super(key: key);

  ACTReportOutput? dataACT;

  @override
  Widget build(BuildContext context) {
    return ReportPDFACT(
      dataACT: dataACT,
    );
  }
}
