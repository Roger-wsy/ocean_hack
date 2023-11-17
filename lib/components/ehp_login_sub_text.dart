import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpLoginSubText extends StatelessWidget {
  EhpLoginSubText({
    super.key,
    this.text,
    this.onPressed,
  });

  String? text;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EhpPadding.containerCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            EhpText(
              text,
            ),
            Icon(
              Icons.arrow_right_alt,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
