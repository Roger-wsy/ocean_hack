import 'package:flutter/material.dart';

class EhpText extends StatelessWidget {
  EhpText(
    this.text, {
    Key? key,
    this.fontSize,
    this.letterSpacing,
    this.height,
    this.maxLines = 2,
    this.softWrap,
    this.fontWeight,
    this.overflow = TextOverflow.ellipsis,
    this.textDecoration,
    this.color = Colors.black,
    this.padding = EdgeInsets.zero,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.onPressed,
  }) : super(key: key);

  String? text;
  double? fontSize;
  double? letterSpacing;
  double? height;
  int? maxLines;
  bool? softWrap;
  FontWeight? fontWeight;
  TextOverflow? overflow;
  TextDecoration? textDecoration;
  Color? color;
  EdgeInsets padding;
  TextStyle? textStyle;
  TextAlign? textAlign;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          text ?? '',
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
          overflow: overflow,
          style: textStyle ??
              TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                overflow: overflow,
                decoration: textDecoration,
                letterSpacing: letterSpacing,
                height: height,
              ),
        ),
      ),
    );
  }
}
