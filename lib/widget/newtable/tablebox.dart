import 'package:flutter/material.dart';

class rowbox_type0 extends StatelessWidget {
  rowbox_type0({
    Key? key,
    this.Head,
    this.Colorss,
  }) : super(key: key);
  String? Head;
  Color? Colorss;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: oneunitbox(
                textin: Head ?? '',
                Colorss: Colorss,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class oneunitbox extends StatelessWidget {
  oneunitbox({
    Key? key,
    this.textin,
    this.textsize,
    this.Colorss,
  }) : super(key: key);
  String? textin;
  double? textsize;
  Color? Colorss;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Center(
        child: Text(
          textin ?? '',
          style: TextStyle(
            fontSize: textsize ?? 12,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colorss ?? Colors.white,
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}

class rowbox_type1 extends StatelessWidget {
  rowbox_type1({
    Key? key,
    this.Head,
  }) : super(key: key);
  String? Head;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: oneunitbox01(),
            ),
          ],
        ),
      ],
    );
  }
}

class oneunitbox01 extends StatelessWidget {
  oneunitbox01({Key? key, this.textin, this.textsize}) : super(key: key);
  String? textin;
  double? textsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Center(
        child: SizedBox(
          child: Center(
            child: Icon(
              Icons.edit,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}

class rowbox_type2 extends StatelessWidget {
  rowbox_type2({
    Key? key,
    this.Head,
  }) : super(key: key);
  String? Head;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: oneunitbox02(),
            ),
          ],
        ),
      ],
    );
  }
}

class oneunitbox02 extends StatelessWidget {
  oneunitbox02({Key? key, this.textin, this.textsize}) : super(key: key);
  String? textin;
  double? textsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Center(
        child: SizedBox(
          child: Center(
            child: Icon(
              Icons.dashboard,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}

class rowbox_type0_NB extends StatelessWidget {
  rowbox_type0_NB({
    Key? key,
    this.Head,
    this.Colorss,
  }) : super(key: key);
  String? Head;
  Color? Colorss;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: oneunitbox_NB(
                textin: Head ?? '',
                Colorss: Colorss,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class oneunitbox_NB extends StatelessWidget {
  oneunitbox_NB({
    Key? key,
    this.textin,
    this.textsize,
    this.Colorss,
  }) : super(key: key);
  String? textin;
  double? textsize;
  Color? Colorss;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Center(
        child: Text(
          textin ?? '',
          style: TextStyle(
            fontSize: textsize ?? 12,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colorss ?? Colors.white,
        // border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}

class rowbox_type0_NB_BIG extends StatelessWidget {
  rowbox_type0_NB_BIG({
    Key? key,
    this.Head,
    this.Colorss,
  }) : super(key: key);
  String? Head;
  Color? Colorss;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: oneunitbox_NB(
                textin: Head ?? '',
                Colorss: Colorss,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class oneunitbox_NB_BIG extends StatelessWidget {
  oneunitbox_NB_BIG({
    Key? key,
    this.textin,
    this.textsize,
    this.Colorss,
  }) : super(key: key);
  String? textin;
  double? textsize;
  Color? Colorss;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Center(
        child: Text(
          textin ?? '',
          style: TextStyle(
            fontSize: textsize ?? 12,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colorss ?? Colors.white,
        // border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}
