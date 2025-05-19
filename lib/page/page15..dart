import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/10-01-REPORT.dart';

import '../model/model.dart';
import 'P10REPORT/REPORTtable.dart';
import 'P15REPORTNEW/P15REPORTNEWtable.dart';

class Page15 extends StatelessWidget {
  const Page15({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page15BlocTableBody();
  }
}

class Page15BlocTableBody extends StatelessWidget {
  const Page15BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => REPORT_Bloc(),
        child: BlocBuilder<REPORT_Bloc, List<dataset>>(
          builder: (context, data) {
            return Page15Body(
              data: data,
            );
          },
        ));
  }
}

class Page15Body extends StatelessWidget {
  Page15Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P15REPORTNEWuiMAIN(
        data: data,
      ),
    );
  }
}
