import 'package:flutter/material.dart';

import '../common/imgset.dart';

class PICSLOT extends StatelessWidget {
  PICSLOT({
    Key? key,
    this.PIC01,
    this.PIC02,
    this.HIs,
  }) : super(key: key);
  String? PIC01;
  String? PIC02;
  double? HIs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 8, left: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: HIs ?? 440,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
              ),
              child: Row(
                children: [
                  if (PIC01 != '') ...[
                    PicShowAct(width: 400, height: 300, base64: PIC01 ?? ''),
                  ],
                  if (PIC02 != NOPIC) ...[
                    PicShowAct(width: 400, height: 300, base64: PIC02 ?? ''),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PICSLO2SIDE extends StatelessWidget {
  PICSLO2SIDE({
    Key? key,
    this.PIC01,
    this.PIC02,
    this.widget01,
    this.HIs,
  }) : super(key: key);
  String? PIC01;
  String? PIC02;
  Widget? widget01;
  double? HIs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12, right: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SizedBox(
                height: HIs ?? 440,
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.black, width: 3),
                // ),
                child: widget01 ?? SizedBox(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                height: HIs ?? 440,
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.black, width: 3),
                // ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: (HIs ?? 440) * 0.15,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                          child: const Center(
                            child: Text(
                              "Microstructure",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Container(
                              height: (HIs ?? 440) * 0.85,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3),
                              ),
                              child: PicShowAct(
                                  width: 400, height: 300, base64: PIC01 ?? ''),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Container(
                              height: (HIs ?? 440) * 0.85,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3),
                              ),
                              child: PicShowAct(
                                  width: 400, height: 300, base64: PIC02 ?? ''),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
