import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpSingleButton extends StatelessWidget {
  const EhpSingleButton({
    super.key,
    this.padding = EhpPadding.containerCenter,
    this.textPadding = EhpPadding.zero,
    this.text = '',
    this.onPressed,
    this.elevation = false,
    this.color,
    this.fontColor,
    this.backgroundColor,
    this.minimumSize = const Size.fromHeight(48),
    this.isLoading = false,
  });

  final EdgeInsets padding;
  final String? text;
  final VoidCallback? onPressed;
  final bool elevation;
  final Color? color;
  final Color? fontColor;
  final Color? backgroundColor;
  final Size minimumSize;
  final EdgeInsets textPadding;
  final bool isLoading;

  getButtonColor(context) {
    return color ?? Theme.of(context).primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        boxShadow: [
          if (elevation)
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
        ],
      ),
      padding: padding,
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: getButtonColor(context),
          elevation: 2,
          shape: const StadiumBorder(),
          minimumSize: minimumSize,
          backgroundColor: getButtonColor(context),
        ),
        child: isLoading
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                ),
              )
            : EhpText(
                text!.toUpperCase(),
                fontWeight: FontWeight.bold,
                color: fontColor ?? ehpSecondaryColor,
                padding: textPadding,
              ),
      ),
    );
  }
}
