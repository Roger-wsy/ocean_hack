import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

import 'ehp_text.dart';

class EhpCheckboxExpansion extends StatefulWidget {
  EhpCheckboxExpansion({
    super.key,
    this.check = false,
    this.checkboxTitle,
  });

  bool? check;
  String? checkboxTitle;

  @override
  State<EhpCheckboxExpansion> createState() => _EhpCheckboxExpansionState();
}

class _EhpCheckboxExpansionState extends State<EhpCheckboxExpansion> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      //checkbox positioned at left
      value: widget.check,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? value) {
        setState(
          () {
            widget.check = value;
          },
        );
      },
      checkColor: ehpSecondaryColor, // Set the tick color
      activeColor: Theme.of(context)
          .primaryColor, // Set the checkbox's active color to transparent
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          5,
        ), // Adjust the border radius as needed
      ),
      title: EhpText(
        widget.checkboxTitle,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: widget.check! ? Theme.of(context).primaryColor : ehpBlack,
      ),
    );
  }
}
