import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
  final double size;
  final double iconSize;
  AppIcon({
    Key? key,
    this.iconColor=const Color(0xFF756d54),
    this.backgroundColor=const Color(0xFFfcf4e4),
    this.size = 40,
    this.iconSize=16,
   required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
      color: iconColor,
      size:iconSize,
      ),
    );
  }
}
