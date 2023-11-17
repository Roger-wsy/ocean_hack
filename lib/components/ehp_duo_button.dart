import 'package:flutter/material.dart';
import '../constant/constant.dart';
import '_index.dart';

class EhpDuoButton extends StatelessWidget {
  EhpDuoButton({
    super.key,
    this.primaryText,
    this.secondaryText,
    this.primaryCallback,
    this.secondaryCallback,
    this.primaryFlex = 6,
    this.secondaryFlex = 4,
    this.padding = EhpPadding.containerCenter,
    this.primaryDisabled = false,
    this.secondaryElevation = 2,
    this.primaryElevation = 2,
  });

  String? primaryText;
  String? secondaryText;
  VoidCallback? primaryCallback;
  VoidCallback? secondaryCallback;
  int primaryFlex;
  int secondaryFlex;
  EdgeInsets padding;
  bool primaryDisabled;
  double secondaryElevation;
  double primaryElevation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            flex: secondaryFlex,
            child: ElevatedButton(
              onPressed: secondaryCallback,
              style: ElevatedButton.styleFrom(
                shadowColor: Theme.of(context).primaryColor,
                elevation: secondaryElevation,
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                minimumSize: const Size.fromHeight(48),
                backgroundColor: ehpBackground,
              ),
              child: EhpText(
                secondaryText!.toUpperCase(),
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: primaryFlex,
            child: ElevatedButton(
              onPressed: primaryDisabled ? null : primaryCallback,
              style: ElevatedButton.styleFrom(
                shadowColor: Theme.of(context).primaryColor,
                elevation: primaryElevation,
                shape: const StadiumBorder(),
                minimumSize: const Size.fromHeight(48),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: EhpText(
                primaryText!.toUpperCase(),
                color: ehpSecondaryColor,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
