import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//------------------------------------

import '../../bloc/cubit/Rebuild.dart';

void WORNINGpop(BuildContext contextin, String text) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
            height: 75,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(contextin);
                    },
                    child: const SizedBox(
                      height: 24,
                      width: 36,
                      child: Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Center(child: Icon(Icons.close)),
                      ),
                    ),
                  ),
                ),
                Text(text),
                const SizedBox(
                  height: 20,
                )
              ],
            )),
      );
    },
  );
}
