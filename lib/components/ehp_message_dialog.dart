import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpMessageDialog extends StatelessWidget {
  EhpMessageDialog({
    Key? key,
    this.title = '',
    this.content = '',
    this.refresh = false,
    this.onTap,
    this.maxLines = 5,
  }) : super(key: key);

  String title;
  String? content;
  bool refresh;
  VoidCallback? onTap;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: EhpText(
        title,
        textStyle: EhpTextStyle.h3,
      ),
      content: EhpText(
        content,
        textStyle: EhpTextStyle.b4,
        maxLines: 5,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onTap ?? () => Navigator.of(context).pop(),
          child: const Text("Ok"),
        ),
      ],
    );
  }
}
