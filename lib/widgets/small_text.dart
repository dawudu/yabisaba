import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  // TextOverflow overFlow;
  SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      this.size = 12,
      this.height = 1.2,
      // this.overFlow = TextOverflow.ellipsis,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // overflow: overFlow,
      style: TextStyle(
        color: color,
        fontSize: size,
        height: height,
        fontFamily: 'Roboto',
      ),
    );
  }
}
