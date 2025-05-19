// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/P303-01-P303QMMASTERQCget.dart';
import 'P303QMMASTERQC/P303QMMASTERQCMAIN.dart';

//---------------------------------------------------------

class Page303 extends StatelessWidget {
  const Page303({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page303BlocTableBody();
  }
}

class Page303BlocTableBody extends StatelessWidget {
  const Page303BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P303QMMASTERQCget_Bloc(),
        child:
            BlocBuilder<P303QMMASTERQCget_Bloc, List<P303QMMASTERQCgetclass>>(
          builder: (context, data) {
            return Page303Body(
              data: data,
            );
          },
        ));
  }
}

class Page303Body extends StatelessWidget {
  Page303Body({
    super.key,
    this.data,
  });
  List<P303QMMASTERQCgetclass>? data;
  @override
  Widget build(BuildContext context) {
    return P303QMMASTERQCMAIN(
      data: data,
    );
  }
}
