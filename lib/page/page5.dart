import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/05-01-HIRGH001.dart';
import 'P5HI-RGH-001/HIRGH001main.dart';
import 'P5HI-RGH-001/HIRGH001var.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page5BlocTableBody();
  }
}

class Page5BlocTableBody extends StatelessWidget {
  const Page5BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HIRGH001_Bloc(),
        child: BlocBuilder<HIRGH001_Bloc, HIRGH001SCHEMA>(
          builder: (context, data) {
            return Page5Body(
              data: data,
            );
          },
        ));
  }
}

class Page5Body extends StatelessWidget {
  Page5Body({Key? key, this.data}) : super(key: key);
  HIRGH001SCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MICROVICKER_HIRGH001main(
        data: data,
      ),
    );
  }
}
