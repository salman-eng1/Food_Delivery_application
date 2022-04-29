import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  SmallText({
    Key? key,
    this.color=const Color(0xFFccc7c5),
    required this.text,
    this.height=1.2,
    this.size=12,
    this.overflow=TextOverflow.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: size,
        height: height,
        overflow: overflow

      ),
    );
  }
}
