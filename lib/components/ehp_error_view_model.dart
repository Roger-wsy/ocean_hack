import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '_index.dart';

class EhpErrorViewModel extends StatelessWidget {
  const EhpErrorViewModel({
    Key? key,
    this.errorMessage,
    this.onRetryPressed,
    this.buttonText,
    this.imageWidget,
    this.viewportFraction = 0.8,
  }) : super(key: key);

  final String? errorMessage;
  final VoidCallback? onRetryPressed;
  final String? buttonText;
  final Widget? imageWidget;
  final double viewportFraction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * viewportFraction,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageWidget ??
                SvgPicture.asset(
                  'assets/error.svg',
                  width: 100,
                  height: 200,
                ),
            const SizedBox(height: 32),
            Text(errorMessage ?? 'An error occured'),
            const SizedBox(height: 8),
            EhpSingleButton(
                onPressed: onRetryPressed,
                text: buttonText ?? 'Retry',
                minimumSize: Size.zero,
                textPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
          ],
        ),
      ),
    );
  }
}
