import 'package:flutter/material.dart';
import '_index.dart';

class EhpLoadingDialog extends StatelessWidget {
  const EhpLoadingDialog({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            EhpText(
              text ?? "Loading...",
            )
          ],
        ),
      ),
    );
  }
}
