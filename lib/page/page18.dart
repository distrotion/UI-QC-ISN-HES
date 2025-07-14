import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/18-1-registerpo.dart';
import 'P18NEWPASSWORD/NEWPASSWORDBODY.dart';

class Page18 extends StatelessWidget {
  const Page18({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page18BlocBody();
  }
}

class Page18BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page18BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => RegisterPOID_Bloc(),
        child: BlocBuilder<RegisterPOID_Bloc, int>(
          builder: (context, data) {
            return Page18Body(
              data: data,
            );
          },
        ));
  }
}

class Page18Body extends StatelessWidget {
  Page18Body({Key? key, this.data}) : super(key: key);
  int? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NEWPASSmain(
        data: data,
      ),
    );
  }
}
