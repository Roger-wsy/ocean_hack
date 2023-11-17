import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';

class EhpBackButton extends StatelessWidget {
  EhpBackButton({
    super.key,
    this.backButtonColor,
    this.borderColor,
  });

  Color? backButtonColor;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EhpPadding.a16,
      child: Container(
        margin: EhpPadding.a8,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.grey.shade300, width: 1),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: backButtonColor ?? Colors.grey.shade800,
          ),
        ),
      ),
    );
  }
}
