import 'package:flutter/material.dart';
import '../model/model.dart';
import 'P32ReportPDFACT/ReportPDFACT.dart';

class Page32 extends StatelessWidget {
  const Page32({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page32Body();
  }
}

class Page32Body extends StatelessWidget {
  Page32Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return ReportPDFACT();
  }
}
