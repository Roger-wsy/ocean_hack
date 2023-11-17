import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpBottomSocialMedia extends StatelessWidget {
  EhpBottomSocialMedia({super.key, this.text = ''});

  String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        EhpText(
          padding: EhpPadding.containerCenter,
          text,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              shadowColor: Colors.black.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: SvgPicture.asset(
                  'assets/google.svg',
                  height: 32,
                  width: 32,
                ),
              ),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              shadowColor: Colors.black.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: SvgPicture.asset(
                  'assets/facebook.svg',
                  height: 32,
                  width: 32,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 36,
        )
      ],
    );
  }
}
