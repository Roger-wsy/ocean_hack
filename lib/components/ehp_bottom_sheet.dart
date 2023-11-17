import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpBottomSheet extends StatefulWidget {
  EhpBottomSheet({
    Key? key,
    required this.child,
    this.elevation = false,
    this.buttonText = '',
  }) : super(key: key);

  Widget child;
  bool elevation;
  String buttonText;

  @override
  State<EhpBottomSheet> createState() => _EhpBottomSheetState();
}

class _EhpBottomSheetState extends State<EhpBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return EhpSingleButton(
      text: widget.buttonText,
      elevation: widget.elevation,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          useSafeArea: true,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          builder: (context) => widget.child,
        );
      },
      padding: EhpPadding.containerCenter,
    );
  }
}
