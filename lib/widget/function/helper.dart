import 'dart:convert';
import 'dart:html';
import 'dart:ui' as dart_ui;

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';

import 'dart:async';
import 'package:pdf/widgets.dart' as pw;
import 'package:qc_ui_isn_hes/widget/common/Loading.dart';

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

Future<String> capture(GlobalKey<State<StatefulWidget>> globalKey) async {
  try {
    // FreeLoading(contextin);
    RenderRepaintBoundary? boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;

    final image = await boundary!.toImage(pixelRatio: 1);

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
        // pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(4),
        build: (pw.Context context) => pw.Center(
          child: pw.Column(children: [pw.Image(imagePDF), pw.Image(imagePDF)]),
        ),
      ),
    );

    final List<int> bytesPDF = await pdf.save();
    await FileSaveHelper.saveAndLaunchFile(bytesPDF, 'NT Time.pdf');
    // Navigator.pop(contextin);
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
