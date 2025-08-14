import 'dart:convert';
import 'dart:html';
import 'dart:ui' as dart_ui;

import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';

import 'dart:async';
import 'package:pdf/widgets.dart' as pw;
import 'package:qc_ui_isn_hes/widget/common/Loading.dart';

String server = 'http://172.23.10.40:16700/';
// String server = 'http://127.0.0.1:16700/';

class FileSaveHelper {
  static Future<void> saveAndLaunchFile(
      List<int> bytes, String fileName) async {
    AnchorElement(
        href:
            'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', fileName)
      ..click();
  }
}

Future<String> capture(
    GlobalKey<State<StatefulWidget>> globalKey, String PO) async {
  try {
    // FreeLoading(contextin);
    RenderRepaintBoundary? boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;

    final image = await boundary!.toImage(pixelRatio: 2);

    final ByteData? bytes =
        await image.toByteData(format: dart_ui.ImageByteFormat.png);
    Uint8List dataImage =
        bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    final imagePDF = pw.MemoryImage(
      dataImage,
    );

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(4),
        build: (pw.Context context) => pw.Center(
          child: pw.Column(children: [pw.Image(imagePDF)]),
        ),
      ),
    );

    // print(await pdf.save());
    final bytesPDF = await pdf.save();
    await FileSaveHelper.saveAndLaunchFile(bytesPDF, '${PO}.pdf');

    // Navigator.pop(contextin);
    return 'ok';
  } catch (e) {
    rethrow;
  }
}

Future<String> captureToback(
    GlobalKey<State<StatefulWidget>> globalKey, String PO) async {
  try {
    // FreeLoading(contextin);
    RenderRepaintBoundary? boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;

    final image = await boundary!.toImage(pixelRatio: 2);

    final ByteData? bytes =
        await image.toByteData(format: dart_ui.ImageByteFormat.png);
    Uint8List dataImage =
        bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    final imageEncoded = base64.encode(dataImage);

    // print(imageEncoded);
    final response = await Dio().post(
      server + 'goPDF',
      data: {
        "PIC": imageEncoded,
        "PO": PO,
      },
    );
    String output = '';

    if (response.statusCode == 200) {
      var databuff = response.data;

      // output = 'OK';
      if (databuff['PIC'] != null) {
        // final imageEncoded = base64.encode(databuff['PIC']);
        var base64 = databuff['PIC'].toString();
        var bytes = base64Decode(base64);
        await FileSaveHelper.saveAndLaunchFile(bytes, '${PO}.pdf');
      }
    } else {
      //
    }
    return 'ok';
  } catch (e) {
    rethrow;
  }
}

// num? percentageToValue(String? value, num size) {
//   if (value != null) {
//     return value.contains('%')
//         ? (size / 100) * num.tryParse(value.replaceAll(RegExp('%'), ''))!
//         : num.tryParse(value);
//   }
//   return null;
// }

Future<String> capture2(GlobalKey<State<StatefulWidget>> globalKey1,
    GlobalKey<State<StatefulWidget>> globalKey2, String PO) async {
  try {
    // FreeLoading(contextin);
    RenderRepaintBoundary? boundary1 =
        globalKey1.currentContext?.findRenderObject() as RenderRepaintBoundary?;

    final image1 = await boundary1!.toImage(pixelRatio: 1.5);

    final ByteData? bytes1 =
        await image1.toByteData(format: dart_ui.ImageByteFormat.png);
    Uint8List dataImage1 =
        bytes1!.buffer.asUint8List(bytes1.offsetInBytes, bytes1.lengthInBytes);

    final imagePDF1 = pw.MemoryImage(
      dataImage1,
    );
    //-----------
    RenderRepaintBoundary? boundary2 =
        globalKey2.currentContext?.findRenderObject() as RenderRepaintBoundary?;

    final image2 = await boundary2!.toImage(pixelRatio: 1.5);

    final ByteData? bytes2 =
        await image2.toByteData(format: dart_ui.ImageByteFormat.png);
    Uint8List dataImage2 =
        bytes2!.buffer.asUint8List(bytes2.offsetInBytes, bytes2.lengthInBytes);

    final imagePDF2 = pw.MemoryImage(
      dataImage2,
    );
    //-----------

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(4),
        build: (pw.Context context) => pw.Center(
          child: pw.Column(children: [pw.Image(imagePDF1)]),
        ),
      ),
    );
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(4),
        build: (pw.Context context) => pw.Center(
          child: pw.Column(children: [pw.Image(imagePDF2)]),
        ),
      ),
    );

    final response = await Dio().post(
      server + 'genfloder',
      data: {
        "PIC": "imageEncoded",
        "PO": PO,
      },
    );

    // print(await pdf.save());
    final bytesPDF = await pdf.save();
    await FileSaveHelper.saveAndLaunchFile(bytesPDF, '${PO}.pdf');

    // Navigator.pop(contextin);
    return 'ok';
  } catch (e) {
    rethrow;
  }
}
