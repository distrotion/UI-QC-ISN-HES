import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/10-01-REPORT.dart';

import '../model/model.dart';
import 'P10REPORT/REPORTtable.dart';

class Page10 extends StatelessWidget {
  const Page10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page10BlocTableBody();
  }
}

class Page10BlocTableBody extends StatelessWidget {
  const Page10BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => REPORT_Bloc(),
        child: BlocBuilder<REPORT_Bloc, List<dataset>>(
          builder: (context, data) {
            return Page10Body(
              data: data,
            );
          },
        ));
  }
}

class Page10Body extends StatelessWidget {
  Page10Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: REPORTuiMAIN(
        data: data,
      ),
    );
  }
}
