import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//------------------------------------

import '../../bloc/cubit/Rebuild.dart';

void onLoadingType01(BuildContext contextin, void newValue, void newValue2) {
  showDialog(
    context: contextin,
    barrierDismissible: false,
    builder: (BuildContext context) {
      newValue;
      return Dialog(
        child: SizedBox(
            height: 75,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(width: 30),
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Loading"),
              ],
            )),
      );
    },
  );

  Timer(Duration(seconds: 1), () {
    BlocProvider.of<BlocPageRebuild>(contextin).rebuildPage();
    Navigator.pop(contextin);
    newValue2;
  });
}

void onLoadingType01_long5(
    BuildContext contextin, void newValue, void newValue2) {
  showDialog(
    context: contextin,
    barrierDismissible: false,
    builder: (BuildContext context) {
      newValue;
      return Dialog(
        child: SizedBox(
            height: 75,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(width: 30),
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Loading"),
              ],
            )),
      );
    },
  );

  Timer(Duration(seconds: 5), () {
    BlocProvider.of<BlocPageRebuild>(contextin).rebuildPage();
    Navigator.pop(contextin);
    newValue2;
  });
}

void onLoadingFAKE(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
            height: 75,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(width: 30),
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Loading"),
              ],
            )),
      );
    },
  );

  Timer(const Duration(seconds: 2), () {
    Navigator.pop(contextin);
  });
}

void onLoadingFAKEintTIME(BuildContext contextin, int time) {
  showDialog(
    context: contextin,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
            height: 75,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(width: 30),
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Loading"),
              ],
            )),
      );
    },
  );

  Timer(Duration(seconds: time), () {
    Navigator.pop(contextin);
  });
}

void onLoadingFAKE6(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
            height: 75,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(width: 30),
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Loading"),
              ],
            )),
      );
    },
  );

  Timer(const Duration(seconds: 11), () {
    Navigator.pop(contextin);
  });
}

void FreeLoading(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
            height: 75,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(width: 30),
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Loading"),
              ],
            )),
      );
    },
  );
}

void PDFloader(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
            height: 75,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(width: 30),
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("PDF CREATING"),
              ],
            )),
      );
    },
  );
}

void FreeLoadingN(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
            height: 75,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(width: 30),
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Loading.."),
              ],
            )),
      );
    },
  );
}
