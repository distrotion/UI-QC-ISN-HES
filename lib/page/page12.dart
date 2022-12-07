import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/12-01-HIMICM001.dart';
import '../model/model.dart';
import 'P12HI-MICM-001/HIMICM001main.dart';
import 'P12HI-MICM-001/HIMICM001var.dart';

class Page12 extends StatelessWidget {
  const Page12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page12BlocTableBody();
  }
}

class Page12BlocTableBody extends StatelessWidget {
  const Page12BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HIMICM001_Bloc(),
        child: BlocBuilder<HIMICM001_Bloc, HIMICM001SCHEMA>(
          builder: (context, data) {
            return Page12Body(
              data: data,
            );
          },
        ));
  }
}

class Page12Body extends StatelessWidget {
  Page12Body({Key? key, this.data}) : super(key: key);
  HIMICM001SCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return MICROVICKER_HIMICM001main(
      data: data,
    );
  }
}
