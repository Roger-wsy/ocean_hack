import 'package:flutter/material.dart';

import '_index.dart';

class EhpAlertDialog extends StatefulWidget {
  EhpAlertDialog({
    super.key,
    required this.primaryText,
    required this.secondaryText,
    required this.title,
    this.primaryCallback,
    this.secondaryCallback,
    this.child,
  });

  String title;
  VoidCallback? primaryCallback;
  VoidCallback? secondaryCallback;
  String primaryText;
  String secondaryText;
  Widget? child;

  @override
  State<EhpAlertDialog> createState() => _EhpAlertDialogState();
}

class _EhpAlertDialogState extends State<EhpAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AlertDialog(
        title: EhpText(widget.title),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        actions: [
          EhpDuoButton(
            primaryText: widget.primaryText,
            primaryCallback: widget.primaryCallback,
            secondaryText: widget.secondaryText,
            secondaryCallback: widget.secondaryCallback,
            secondaryElevation: 1,
          )
        ],
        content: widget.child,
      ),
    );
  }
}
