import 'package:flutter/material.dart';
import '../constant/constant.dart';
import '_index.dart';

class EhpToggleSwitchTitle extends StatefulWidget {
  final String title;
  final List<String> values;
  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;
  bool initialPosition;

  EhpToggleSwitchTitle({
    super.key,
    required this.title,
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor = const Color.fromARGB(255, 238, 238, 238),
    this.buttonColor = Colors.green,
    this.textColor = Colors.white,
    this.initialPosition = true,
  });

  @override
  State<EhpToggleSwitchTitle> createState() => _EhpToggleSwitchTitleState();
}

class _EhpToggleSwitchTitleState extends State<EhpToggleSwitchTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EhpPadding.containerCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EhpText(
            widget.title,
            maxLines: 4,
            fontSize: 18,
            padding: EhpPadding.v8,
          ),
          EhpToggleSwitch(
            values: widget.values,
            initialPosition: widget.initialPosition,
            onToggleCallback: widget.onToggleCallback,
            buttonColor: widget.buttonColor,
            textColor: widget.textColor,
            backgroundColor: widget.backgroundColor,
          ),
        ],
      ),
    );
  }
}
