import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/Cubit/34-ReportPDFACT02cubit.dart';
import '../model/model.dart';
import 'P32ReportPDFACT/ReportPDFACT.dart';
import 'P34ReportPDFACT02/ReportPDFACT02.dart';

class Page34 extends StatelessWidget {
  const Page34({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page34BlocTableBody();
  }
}

class Page34BlocTableBody extends StatelessWidget {
  const Page34BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ReportPDFACT02cubit_Cubit(),
        child: BlocBuilder<ReportPDFACT02cubit_Cubit, ACTReport02Output>(
          builder: (context, dataACT) {
            return Page34Body(
              dataACT: dataACT,
            );
          },
        ));
  }
}

class Page34Body extends StatelessWidget {
  Page34Body({Key? key, this.dataACT}) : super(key: key);

  ACTReport02Output? dataACT;

  @override
  Widget build(BuildContext context) {
    return ReportPDFACT02(
      dataACT: dataACT,
    );
  }
}
