// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import '../data/datapattern.dart';
// import '../model/model.dart';
// import '../widget/common/Safty.dart';
// import '../widget/common/graphpeak.dart';

// class Page14 extends StatelessWidget {
//   const Page14({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Page14Body();
//   }
// }

// class Page14Body extends StatelessWidget {
//   Page14Body({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<FlSpot> dataout = [];
//     List<Map<String, dynamic>> data = testdata;

//     for (var i = 0; i < data.length; i++) {
//       String datax = data[i]["X"] != null ? data[i]["X"].toString() : "";
//       String dataZ = data[i]["Z"] != null ? data[i]["Z"].toString() : "";

//       if (datax != "um") {
//         double dataZs = double.parse(ConverstStr(dataZ));
//         if (double.parse(ConverstStr(dataZ)) > 1) {
//           dataZs = 1;
//         } else if (double.parse(ConverstStr(dataZ)) < -1) {
//           dataZs = -1;
//         } else {
//           dataZs = double.parse(ConverstStr(dataZ));
//         }
//         dataout.add(FlSpot(double.parse(ConverstStr(datax)), dataZs));
//       }
//     }
//     return Center(
//       child: Container(
//         child: RoughnessGraph(
//           data: dataout,
//           widgetdata: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: InkWell(
//               onTap: () {},
//               child: Container(
//                 width: 150,
//                 height: 40,
//                 color: Colors.blue,
//                 child: Center(
//                   child: Text("Accept"),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/14-01-TPGMCSCPR.dart';
import 'P14TPG-MCS-CPR/TPGMCSCPRmain.dart';
import 'P14TPG-MCS-CPR/TPGMCSCPRvar.dart';

class Page14 extends StatelessWidget {
  const Page14({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page14BlocTableBody();
  }
}

class Page14BlocTableBody extends StatelessWidget {
  const Page14BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TPGMCSCPR_Bloc(),
        child: BlocBuilder<TPGMCSCPR_Bloc, TPGMCSCPRSCHEMA>(
          builder: (context, data) {
            return Page14Body(
              data: data,
            );
          },
        ));
  }
}

class Page14Body extends StatelessWidget {
  Page14Body({Key? key, this.data}) : super(key: key);
  TPGMCSCPRSCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MICROVICKER_TPGMCSCPRmain(
        data: data,
      ),
    );
  }
}
