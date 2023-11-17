import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpColoredCard extends StatelessWidget {
  const EhpColoredCard({
    super.key,
    this.onTap,
    this.cardColor = Colors.white,
    this.cardText,
    this.cardWidth = 70,
    this.cardHeight = 70,
    this.child,
    this.enableShadow = true,
    this.borderRadius = 20,
    this.padding = EhpPadding.containerCenter5,
  });

  final VoidCallback? onTap;
  final Color? cardColor;
  final String? cardText;
  final double? cardWidth;
  final double? cardHeight;
  final Widget? child;
  final bool enableShadow;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  if (enableShadow)
                    BoxShadow(
                      color: Colors.grey[900]!.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(0, 0),
                    ),
                ],
              ),
              height: cardHeight,
              width: cardWidth,
              child: child,
            ),
            if (cardText != null)
              Column(
                children: [
                  const SizedBox(height: 4),
                  SizedBox(
                    width: cardWidth,
                    child: EhpText(
                      cardText,
                      textStyle: EhpTextStyle.b6,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
