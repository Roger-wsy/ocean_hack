import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

enum LabelType { bordered, filled }

class EhpLabel extends StatelessWidget {
  EhpLabel({
    Key? key,
    this.labelText = "",
    this.labelColor,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 10,
    this.padding = EhpPadding.h16,
    this.labelType = LabelType.filled,
    this.child,
    this.borderWidth = 1,
  }) : super(key: key);

  String labelText;
  Color? labelColor;
  FontWeight? fontWeight;
  double? fontSize;
  EdgeInsets padding;
  LabelType labelType;
  Widget? child;
  double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          padding: EhpPadding.containerCenter2,
          decoration: labelType == LabelType.filled
              ? BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: labelColor ?? Theme.of(context).primaryColor,
                    width: borderWidth,
                  ),
                  color: ehpSecondaryColor,
                ),
          child: Center(
            child: child ??
                EhpText(
                  labelText,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                  color: labelType == LabelType.filled
                      ? ehpSecondaryColor
                      : labelColor ?? Theme.of(context).primaryColor,
                ),
          ),
        ),
      ),
    );
  }
}
