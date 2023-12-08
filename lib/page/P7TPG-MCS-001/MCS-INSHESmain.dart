import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/07-01-TPGMCS001.dart';
import '../../bloc/BlocEvent/07-02-TrickTPG-MCS-001.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../../widget/QCWIDGET/W1SINGLESHOTIMG/SINGLESHOTIMGwidget.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/imgset.dart';
import '../../widget/onlyINqcui/popup.dart';
import '../P1FIRSTUI/FIRSTuiVAR.dart';
import '../page1.dart';
import 'MCS-INSHESvar.dart';

late BuildContext MICROSCOPEMCSINSHES_CONTEXT;

class MICROSCOPE_MCSINSHESmain extends StatelessWidget {
  MICROSCOPE_MCSINSHESmain({Key? key, this.data}) : super(key: key);
  MCSINSHESSCHEMA? data;
  @override
  Widget build(BuildContext context) {
    return _TRICKER_MCSINSHES_BlocBuffer(
      data: data,
    );
  }
}

class _TRICKER_MCSINSHES_BlocBuffer extends StatelessWidget {
  _TRICKER_MCSINSHES_BlocBuffer({
    Key? key,
    this.data,
  }) : super(key: key);
  MCSINSHESSCHEMA? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TRICKER_MCSINSHES_Bloc(),
        child: BlocBuilder<TRICKER_MCSINSHES_Bloc, String>(
          builder: (context, trick) {
            return ROCKWELL_MCSINSHESbody(data: data);
          },
        ));
  }
}

class ROCKWELL_MCSINSHESbody extends StatefulWidget {
  ROCKWELL_MCSINSHESbody({Key? key, this.data}) : super(key: key);
  MCSINSHESSCHEMA? data;

  @override
  State<ROCKWELL_MCSINSHESbody> createState() => _ROCKWELL_MCSINSHESbodyState();
}

class _ROCKWELL_MCSINSHESbodyState extends State<ROCKWELL_MCSINSHESbody> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    context.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    backpage_fn(); // Do some stuff.
    return true;
  }

  backpage_fn() {
    MCSINSHESvar.base64pic01 = imgw;
    MCSINSHESvar.base64pic02 = imgw;
    MCSINSHESvar.base64pic03 = imgw;
    MCSINSHESvar.base64pic04 = imgw;
    MCSINSHESvar.base64pic01data = '';
    MCSINSHESvar.base64pic02data = '';
    MCSINSHESvar.base64pic03data = '';
    MCSINSHESvar.base64pic04data = '';
    // MCSINSHESvar.DHtimer.cancel();
    FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
    MCSINSHESvar.ItemPickSELECT = '';
    context.read<TRICKER_MCSINSHES_Bloc>().add(TRICKER_MCSINSHESSETZERO());
    CuPage = Page1();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  }

  @override
  Widget build(BuildContext context) {
    PageMemory = 6;

    MICROSCOPEMCSINSHES_CONTEXT = context;

    if (widget.data?.UPDATE == 'OK') {
      setState(() {
        MCSINSHESvar.PO = widget.data?.PO ?? '';
        MCSINSHESvar.CP = widget.data?.CP ?? '';
        MCSINSHESvar.QTY = widget.data?.QTY ?? '';
        MCSINSHESvar.PROCESS = widget.data?.PROCESS ?? '';
        MCSINSHESvar.CUSLOT = widget.data?.CUSLOT ?? '';
        MCSINSHESvar.TPKLOT = widget.data?.TPKLOT ?? '';
        MCSINSHESvar.FG = widget.data?.FG ?? '';
        MCSINSHESvar.CUSTOMER = widget.data?.CUSTOMER ?? '';
        MCSINSHESvar.PART = widget.data?.PART ?? '';
        MCSINSHESvar.PARTNAME = widget.data?.PARTNAME ?? '';
        MCSINSHESvar.MATERIAL = widget.data?.MATERIAL ?? '';
        //
        MCSINSHESvar.ItemPick = widget.data?.ItemPick ?? [''];
        MCSINSHESvar.PCS = widget.data?.PCS ?? '';
        // MCSINSHESvar.PCS = '10';
        MCSINSHESvar.PCSleft = widget.data?.PCSleft ?? '';
        // MCSINSHESvar.PCSleft = '10';
        MCSINSHESvar.POINTs = widget.data?.POINTs ?? '';
        // MCSINSHESvar.POINTs = '10';
        MCSINSHESvar.UNIT = widget.data?.UNIT ?? '';
        // MCSINSHESvar.UNIT = 'pcs/lots';
        MCSINSHESvar.INTERSEC = widget.data?.INTERSEC ?? '';
        //
        MCSINSHESvar.RESULTFORMAT = widget.data?.RESULTFORMAT ?? '';
        MCSINSHESvar.GRAPHTYPE = widget.data?.GRAPHTYPE ?? '';
        MCSINSHESvar.GAP = widget.data?.GAP ?? '';
        //
        MCSINSHESvar.preview = widget.data?.preview ?? [];
        MCSINSHESvar.confirmdata = widget.data?.confirmdata ?? [];
        MCSINSHESvar.ITEMleftUNIT = widget.data?.ITEMleftUNIT ?? [];
        MCSINSHESvar.ITEMleftVALUE = widget.data?.ITEMleftVALUE ?? [];

        if (MCSINSHESvar.PCSleft == '0') {
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "ITEM STATUS", "COMPLETE DATA", enumNotificationlist.Success);
        }

        widget.data?.UPDATE = '-';
      });

      // Timer timer = Timer(const Duration(seconds: 1), () {
      //   context.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
      // });
      // MCSINSHESvar.DHtimer = timer;
    }

    return SINGLESHOTIMGmain(
      //------ Left
      LABEL: "TPG-MCS-001",
      PO: MCSINSHESvar.PO,
      CP: MCSINSHESvar.CP,
      QTY: MCSINSHESvar.QTY,
      PROCESS: MCSINSHESvar.PROCESS,
      CUSLOT: MCSINSHESvar.CUSLOT,
      TPKLOT: MCSINSHESvar.TPKLOT,
      FG: MCSINSHESvar.FG,
      CUSTOMER: MCSINSHESvar.CUSTOMER,
      PART: MCSINSHESvar.PART,
      PARTNAME: MCSINSHESvar.PARTNAME,
      MATERIAL: MCSINSHESvar.MATERIAL,
      //------- Top
      ItemPickres: (v) {
        print(v);

        MCSINSHESvar.ItemPickSELECT = v;
        //

        context
            .read<TRICKER_MCSINSHES_Bloc>()
            .add(TRICKER_MCSINSHESgeteachITEM());
        MCSINSHESvar.base64pic01 = imgw;
        MCSINSHESvar.base64pic02 = imgw;
        MCSINSHESvar.base64pic03 = imgw;
        MCSINSHESvar.base64pic04 = imgw;
        MCSINSHESvar.iscontrol = true;
        MCSINSHESvar.base64pic01data = '';
        MCSINSHESvar.base64pic02data = '';
        MCSINSHESvar.base64pic03data = '';
        MCSINSHESvar.base64pic04data = '';
        context.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
      },
      ItemPick: MCSINSHESvar.ItemPick,
      PCS: MCSINSHESvar.PCS,
      PCSleft: MCSINSHESvar.PCSleft,
      POINTs: MCSINSHESvar.POINTs,
      UNIT: MCSINSHESvar.UNIT,
      INTERSEC: MCSINSHESvar.INTERSEC,
      RESULTFORMAT: MCSINSHESvar.RESULTFORMAT,
      Ghtype: MCSINSHESvar.GRAPHTYPE,

      //------- Bottom
      ACCEPT: (v) {
        // print(checkpic());
        if (checkpic()) {
          if (pointpic()) {
            if (MCSINSHESvar.PCS != '' &&
                MCSINSHESvar.POINTs != '' &&
                MCSINSHESvar.ItemPickSELECT != '') {
              onLoadingFAKEintTIME(context, 3);
              if (int.parse(MCSINSHESvar.PCSleft) > 0) {
                context
                    .read<TRICKER_MCSINSHES_Bloc>()
                    .add(TRICKER_MCSINSHESFINISH());
                Timer(const Duration(seconds: 3), () {
                  context.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
                });
              }
            } else {
              WORNINGpop(context, "Please select item");
            }
          } else {
            WORNINGpop(context, "Please insert data");
          }
        } else {
          WORNINGpop(context, "Please upload picture for Compound Layer");
        }
      },
      //-------------
      INSdd: (v, s) {
        MCSINSHESvar.selectINS = v;
      },
      INSddData: MCSINSHESvar.selectINS,
      PRread: (v) {
        if (MCSINSHESvar.ItemPickSELECT.contains("Compound")) {
          MCSINSHESvar.iscontrol = true;
          context.read<TRICKER_MCSINSHES_Bloc>().add(TRICKER_MCSINSHESgetCP());
        } else if (MCSINSHESvar.ItemPickSELECT.contains("Porous")) {
          WORNINGpop(context, "ITEM Porous");
        } else {
          MCSINSHESvar.iscontrol = true;
          context.read<TRICKER_MCSINSHES_Bloc>().add(TRICKER_MCSINSHESgetCP());
        }
      },
      CPreadbool: MCSINSHESvar.ItemPickSELECT.contains("Compound") ||
          !(MCSINSHESvar.ItemPickSELECT.contains("Compound") &&
              MCSINSHESvar.ItemPickSELECT.contains("Porous")),
      CPread: (v) {
        if (MCSINSHESvar.ItemPickSELECT.contains("Porous")) {
          MCSINSHESvar.iscontrol = true;
          context.read<TRICKER_MCSINSHES_Bloc>().add(TRICKER_MCSINSHESgetPR());
        } else if (MCSINSHESvar.ItemPickSELECT.contains("Compound")) {
          //Porous
          WORNINGpop(context, "ITEM Compound");
        } else {
          MCSINSHESvar.iscontrol = true;
          context.read<TRICKER_MCSINSHES_Bloc>().add(TRICKER_MCSINSHESgetPR());
        }
      },
      PRreadbool: MCSINSHESvar.ItemPickSELECT.contains("Porous") ||
          !(MCSINSHESvar.ItemPickSELECT.contains("Compound") &&
              MCSINSHESvar.ItemPickSELECT.contains("Porous")),
      //-------------
      FINISH: (v) {},
      preview: MCSINSHESvar.preview,
      confirmdata: MCSINSHESvar.confirmdata.reversed.toList(),
      //------- Right
      CLEAR: (v) {},
      BACKPAGE: (v) {
        MCSINSHESvar.base64pic01 = imgw;
        MCSINSHESvar.base64pic02 = imgw;
        MCSINSHESvar.base64pic03 = imgw;
        MCSINSHESvar.base64pic04 = imgw;
        MCSINSHESvar.base64pic01data = '';
        MCSINSHESvar.base64pic02data = '';
        MCSINSHESvar.base64pic03data = '';
        MCSINSHESvar.base64pic04data = '';
        // MCSINSHESvar.DHtimer.cancel();
        FIRSTUI.SEARCH = FIRSTUI.POACTIVE;
        MCSINSHESvar.ItemPickSELECT = '';
        context.read<TRICKER_MCSINSHES_Bloc>().add(TRICKER_MCSINSHESSETZERO());
        CuPage = Page1();
        MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
      },
      RESETVALUE: (v) {},
      ITEMleftUNIT: MCSINSHESvar.ITEMleftUNIT,
      ITEMleftVALUE: MCSINSHESvar.ITEMleftVALUE,
      wchild: Column(
        children: [
          FileUploadButton01(),
          FileUploadButton02(),
          FileUploadButton03(),
          FileUploadButton04(),
        ],
      ),
    );
  }
}

class FileUploadButton01 extends StatefulWidget {
  const FileUploadButton01({Key? key}) : super(key: key);

  @override
  State<FileUploadButton01> createState() => _FileUploadButton01State();
}

class _FileUploadButton01State extends State<FileUploadButton01> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isEnabled: false,
            isContr: MCSINSHESvar.iscontrol,
            fnContr: (input) {
              setState(() {
                MCSINSHESvar.iscontrol = input;
              });
            },
            sValue: MCSINSHESvar.base64pic01data,
            returnfunc: (String s) {
              MCSINSHESvar.base64pic01data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: MCSINSHESvar.base64pic01,
          ),
          IMGbutton(
            base64pic: MCSINSHESvar.base64pic01,
            setimg: (img) {
              MCSINSHESvar.base64pic01 = img;
              context.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton02 extends StatefulWidget {
  const FileUploadButton02({Key? key}) : super(key: key);

  @override
  State<FileUploadButton02> createState() => _FileUploadButton02State();
}

class _FileUploadButton02State extends State<FileUploadButton02> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isEnabled: false,
            isContr: MCSINSHESvar.iscontrol,
            fnContr: (input) {
              setState(() {
                MCSINSHESvar.iscontrol = input;
              });
            },
            sValue: MCSINSHESvar.base64pic02data,
            returnfunc: (String s) {
              MCSINSHESvar.base64pic02data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: MCSINSHESvar.base64pic02,
          ),
          IMGbutton(
            base64pic: MCSINSHESvar.base64pic02,
            setimg: (img) {
              MCSINSHESvar.base64pic02 = img;
              context.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton03 extends StatefulWidget {
  const FileUploadButton03({Key? key}) : super(key: key);

  @override
  State<FileUploadButton03> createState() => _FileUploadButton03State();
}

class _FileUploadButton03State extends State<FileUploadButton03> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isEnabled: false,
            isContr: MCSINSHESvar.iscontrol,
            fnContr: (input) {
              setState(() {
                MCSINSHESvar.iscontrol = input;
              });
            },
            sValue: MCSINSHESvar.base64pic03data,
            returnfunc: (String s) {
              MCSINSHESvar.base64pic03data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: MCSINSHESvar.base64pic03,
          ),
          IMGbutton(
            base64pic: MCSINSHESvar.base64pic03,
            setimg: (img) {
              MCSINSHESvar.base64pic03 = img;
              context.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
            },
          ),
        ],
      ),
    );
  }
}

class FileUploadButton04 extends StatefulWidget {
  const FileUploadButton04({Key? key}) : super(key: key);

  @override
  State<FileUploadButton04> createState() => _FileUploadButton04State();
}

class _FileUploadButton04State extends State<FileUploadButton04> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 1000,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ComInputText(
            sLabel: "value",
            height: 40,
            isEnabled: false,
            isContr: MCSINSHESvar.iscontrol,
            fnContr: (input) {
              setState(() {
                MCSINSHESvar.iscontrol = input;
              });
            },
            sValue: MCSINSHESvar.base64pic04data,
            returnfunc: (String s) {
              MCSINSHESvar.base64pic04data = s;
            },
          ),
          PicShow(
            width: 200,
            height: 100,
            base64: MCSINSHESvar.base64pic04,
          ),
          IMGbutton(
            base64pic: MCSINSHESvar.base64pic04,
            setimg: (img) {
              MCSINSHESvar.base64pic04 = img;
              context.read<MCSINSHES_Bloc>().add(MCSINSHES_READ());
            },
          ),
        ],
      ),
    );
  }
}

bool pointpic() {
  bool out = false;
  if (MCSINSHESvar.POINTs == '1') {
    if (MCSINSHESvar.base64pic01data != '' &&
        (MCSINSHESvar.base64pic02data == '' ||
            MCSINSHESvar.base64pic02data == '0') &&
        (MCSINSHESvar.base64pic03data == '' ||
            MCSINSHESvar.base64pic03data == '0') &&
        (MCSINSHESvar.base64pic04data == '' ||
            MCSINSHESvar.base64pic04data == '0')) {
      out = true;
    }
  } else if (MCSINSHESvar.POINTs == '2') {
    if (MCSINSHESvar.base64pic01data != '' &&
        MCSINSHESvar.base64pic02data != '' &&
        (MCSINSHESvar.base64pic03data == '' ||
            MCSINSHESvar.base64pic03data == '0') &&
        (MCSINSHESvar.base64pic04data == '' ||
            MCSINSHESvar.base64pic04data == '0')) {
      out = true;
    }
  } else if (MCSINSHESvar.POINTs == '3') {
    if (MCSINSHESvar.base64pic01data != '' &&
        MCSINSHESvar.base64pic02data != '' &&
        MCSINSHESvar.base64pic03data != '' &&
        (MCSINSHESvar.base64pic04data == '' ||
            MCSINSHESvar.base64pic04data == '0')) {
      out = true;
    }
  } else if (MCSINSHESvar.POINTs == '4') {
    if (MCSINSHESvar.base64pic01data != '' &&
        MCSINSHESvar.base64pic02data != '' &&
        MCSINSHESvar.base64pic03data != '' &&
        MCSINSHESvar.base64pic04data != '') {
      out = true;
    }
  }

  return out;
}

bool checkpic() {
  bool out = false;
  if (MCSINSHESvar.ItemPickSELECT == 'Compound Layer') {
    if (MCSINSHESvar.base64pic01 != imgw) {
      out = true;
    }
  } else {
    out = true;
  }
  return out;
}
