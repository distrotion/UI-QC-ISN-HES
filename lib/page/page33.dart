import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/Cubit/32-ReportPDFACTcubit.dart';

import '../bloc/Cubit/33-ReportPDFNISHINBOcubit.dart';
import 'P33ReportPDFTEST/ReportPDFTEST.dart';

class Page33 extends StatelessWidget {
  const Page33({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page33BlocTableBody();
  }
}

class Page33BlocTableBody extends StatelessWidget {
  const Page33BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ReportPDFNISHINBOcubit_Cubit(),
        child: BlocBuilder<ReportPDFNISHINBOcubit_Cubit, NISHINBOReportOutput>(
          builder: (context, dataACT) {
            return Page33Body(
              dataACT: dataACT,
            );
          },
        ));
  }
}

class Page33Body extends StatelessWidget {
  Page33Body({Key? key, this.dataACT}) : super(key: key);

  NISHINBOReportOutput? dataACT;

  @override
  Widget build(BuildContext context) {
    return ReportPDFTEST(
      dataACT: dataACT,
    );
  }
}
