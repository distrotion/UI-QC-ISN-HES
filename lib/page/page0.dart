import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/ChangePageEvent.dart';
import '../data/datapattern.dart';
import '../data/global.dart';
import '../mainBody.dart';
import '../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../widget/QCWIDGET/W1SINGLESHOTIMG/SINGLESHOTIMGwidget.dart';
import '../widget/QCWIDGET/W2MULTISHOT/MULTISHOTwidget.dart';
import '../widget/QCWIDGET/consolelayout.dart';
import '../widget/common/Checkbox.dart';
import '../widget/common/Radiobutton.dart';
import '../widget/common/imgset.dart';
import 'Page32.dart';
import 'TEST.dart';
import 'page1.dart';
import 'page11.dart';
import 'page2.dart';
import 'page31.dart';
import 'page33.dart';

bool isChecked = false;

class Page0 extends StatelessWidget {
  const Page0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page1();
  }
}

class Page0Body extends StatelessWidget {
  const Page0Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //   onTap: () {
    //     CuPage = Page2();
    //     CuPageLV = 1;
    //     MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
    //   },
    //   child: Center(
    //     child: Container(
    //       height: 100,
    //       width: 200,
    //       color: Colors.orange,
    //       child:
    //           const Center(child: Text("initial Page \nor do something wrong")),
    //     ),

    //   ),
    // );
    // return Center(child: Page1());
    return SINGLESHOTIMGmain(
      //------ Left
      LABEL: "TEST",
      PO: '',
      CP: '',
      QTY: '',
      PROCESS: '',
      CUSLOT: '',
      TPKLOT: '',
      FG: '',
      CUSTOMER: '',
      PART: '',
      PARTNAME: '',
      MATERIAL: '',
      //------- Top
      ItemPickres: (v) {},
      ItemPick: [''],
      PCS: '',
      PCSleft: '',
      POINTs: '',
      UNIT: '',
      INTERSEC: '',
      RESULTFORMAT: '',
      Ghtype: '',
      //------- Bottom
      ACCEPT: (v) {},
      FINISH: (v) {},
      preview: [],
      confirmdata: [],
      wchild: Column(
        children: [
          // FileUploadButton01(),
          // FileUploadButton01(),
          // FileUploadButton01(),
          // FileUploadButton01(),
        ],
      ),
      //------- Right
      CLEAR: (v) {},
      BACKPAGE: (v) {},
      RESETVALUE: (v) {},
      ITEMleftUNIT: [],
      ITEMleftVALUE: [],
    );
  }
}

// String base64pic01 = imgw;
// String base64pic02 = imgw;
// String base64pic03 = imgw;
// String base64pic04 = imgw;

// class FileUploadButton01 extends StatefulWidget {
//   const FileUploadButton01({Key? key}) : super(key: key);

//   @override
//   State<FileUploadButton01> createState() => _FileUploadButton01State();
// }

// class _FileUploadButton01State extends State<FileUploadButton01> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       width: 1000,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           PicShow(
//             width: 200,
//             height: 100,
//             base64: base64pic01,
//           ),
//           IMGbutton(
//             base64pic: base64pic01,
//             setimg: (img) {
//               setState(() {
//                 base64pic01 = img;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FileUploadButton02 extends StatefulWidget {
//   const FileUploadButton02({Key? key}) : super(key: key);

//   @override
//   State<FileUploadButton02> createState() => _FileUploadButton02State();
// }

// class _FileUploadButton02State extends State<FileUploadButton02> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       width: 1000,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           PicShow(
//             width: 200,
//             height: 100,
//             base64: base64pic02,
//           ),
//           IMGbutton(
//             base64pic: base64pic02,
//             setimg: (img) {
//               setState(() {
//                 base64pic02 = img;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FileUploadButton03 extends StatefulWidget {
//   const FileUploadButton03({Key? key}) : super(key: key);

//   @override
//   State<FileUploadButton03> createState() => _FileUploadButton03State();
// }

// class _FileUploadButton03State extends State<FileUploadButton03> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       width: 1000,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           PicShow(
//             width: 200,
//             height: 100,
//             base64: base64pic03,
//           ),
//           IMGbutton(
//             base64pic: base64pic03,
//             setimg: (img) {
//               setState(() {
//                 base64pic03 = img;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FileUploadButton04 extends StatefulWidget {
//   const FileUploadButton04({Key? key}) : super(key: key);

//   @override
//   State<FileUploadButton04> createState() => _FileUploadButton04State();
// }

// class _FileUploadButton04State extends State<FileUploadButton04> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       width: 1000,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           PicShow(
//             width: 200,
//             height: 100,
//             base64: base64pic04,
//           ),
//           IMGbutton(
//             base64pic: base64pic04,
//             setimg: (img) {
//               setState(() {
//                 base64pic04 = img;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
