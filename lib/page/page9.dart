import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/09-CLEARroom.dart';
import 'P9CLEARINS/CLEARTABLE.dart';

class Page9 extends StatelessWidget {
  const Page9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page9BlocTableBody();
  }
}

class Page9BlocTableBody extends StatelessWidget {
  const Page9BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CLEARroom_Bloc(),
        child: BlocBuilder<CLEARroom_Bloc, CLEARroomENV>(
          builder: (context, data) {
            return Page9Body(
              data: data,
            );
          },
        ));
  }
}

class Page9Body extends StatelessWidget {
  Page9Body({
    Key? key,
    this.data,
  }) : super(key: key);
  CLEARroomENV? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClearRoomMAIN(
        data: data,
      ),
    );
  }
}
