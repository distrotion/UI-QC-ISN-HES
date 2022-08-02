import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/02-01-APPINSHES.dart';
import 'P2APP-INSHES/APPINSHESmain.dart';
import 'P2APP-INSHES/APPINSHESvar.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page2BlocTableBody();
  }
}

class Page2BlocTableBody extends StatelessWidget {
  const Page2BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => APPINSHES_Bloc(),
        child: BlocBuilder<APPINSHES_Bloc, APPINSHESSCHEMA>(
          builder: (context, data) {
            return Page2Body(
              data: data,
            );
          },
        ));
  }
}

class Page2Body extends StatelessWidget {
  Page2Body({Key? key, this.data}) : super(key: key);
  APPINSHESSCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: APPEARANCE_APPINSHESmain(
        data: data,
      ),
    );
  }
}
