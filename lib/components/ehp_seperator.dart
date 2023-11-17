import 'package:flutter/material.dart';

enum EhpSeperatorType {
  section,
  line,
}

class EhpSeperator extends StatelessWidget {
  const EhpSeperator({
    super.key,
    this.type = EhpSeperatorType.section,
    this.height,
    this.padding = EdgeInsets.zero,
    this.lineColor = Colors.black87,
  });

  final EhpSeperatorType type;
  final double? height;
  final EdgeInsets padding;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    Widget seperator(EhpSeperatorType type, double height) {
      if (type == EhpSeperatorType.section) {
        return Container(
          height: height,
          width: double.infinity,
          color: Colors.grey[100],
        );
      }

      if (type == EhpSeperatorType.line) {
        return Container(
          height: height,
          width: double.infinity,
          color: lineColor,
        );
      }

      return Container(
        height: height,
        width: double.infinity,
        color: Colors.white,
      );
    }

    return Padding(
      padding: padding,
      child: seperator(type, getHeight()),
    );
  }

  getHeight() {
    double h = 4;
    if (type == EhpSeperatorType.section) {
      h = 16.0;
    }

    if (type == EhpSeperatorType.line) {
      h = 1.0;
    }
    return height ?? h;
  }
}
