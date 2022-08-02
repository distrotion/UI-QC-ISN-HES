import 'package:flutter/material.dart';

import '../../../styles/TextStyle.dart';

class INSBOX extends StatelessWidget {
  INSBOX({Key? key, this.INS, this.inuse}) : super(key: key);
  String? INS;
  bool? inuse;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: inuse ?? false ? Colors.red : Colors.blue,
      child: Center(
        child: Text(
          INS ?? '',
          style:
              const TxtStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
