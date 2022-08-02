import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/06-01-HIMIC001.dart';
import 'P6HI-MIC-001/HIMIC001main.dart';
import 'P6HI-MIC-001/HIMIC001var.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page6BlocTableBody();
  }
}

class Page6BlocTableBody extends StatelessWidget {
  const Page6BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HIMIC001_Bloc(),
        child: BlocBuilder<HIMIC001_Bloc, HIMIC001SCHEMA>(
          builder: (context, data) {
            return Page6Body(
              data: data,
            );
          },
        ));
  }
}

class Page6Body extends StatelessWidget {
  Page6Body({Key? key, this.data}) : super(key: key);
  HIMIC001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MICROVICKER_HIMIC001main(
        data: data,
      ),
    );
  }
}
