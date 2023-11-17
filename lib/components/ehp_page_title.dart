import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';

class EhpPageTitle extends StatelessWidget {
  EhpPageTitle({
    Key? key,
    @required this.title,
    this.color = Colors.black,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 32,
    this.overflow = TextOverflow.clip,
  }) : super(key: key);

  String? title;
  Color? color;
  FontWeight? fontWeight;
  double? fontSize;
  TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EhpPadding.h16,
      child: Text(
        title ?? '',
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          overflow: overflow,
        ),
      ),
    );
  }
}
