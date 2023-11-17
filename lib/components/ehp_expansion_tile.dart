import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpExpansionTile extends StatelessWidget {
  EhpExpansionTile({
    super.key,
    required this.child,
    this.check = false,
    this.expansionTitle = '',
    this.expansionSubTitle = '',
    this.initiallyExpanded = false,
    this.titlePadding = EhpPadding.h16,
    this.maintainState = false,
    this.subTitleTextStyle,
    this.borderRadius = 8.0,
    this.childrenPadding = EhpPadding.zero,
  });

  bool? check;
  String? expansionTitle;
  String? expansionSubTitle;
  Widget child;
  bool initiallyExpanded;
  EdgeInsetsGeometry titlePadding;
  bool maintainState;
  double borderRadius;
  EdgeInsetsGeometry childrenPadding;
  TextStyle? subTitleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        listTileTheme: ListTileTheme.of(context).copyWith(
          dense: true,
          visualDensity: VisualDensity.compact,
        ),
      ),
      child: ExpansionTile(
        tilePadding: titlePadding,
        initiallyExpanded: initiallyExpanded,
        maintainState: maintainState,
        childrenPadding: childrenPadding,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        title: EhpText(expansionTitle,
            textStyle: EhpTextStyle.h3.copyWith(color: Colors.black)),
        subtitle: expansionSubTitle != null || expansionSubTitle != ""
            ? EhpText(
                expansionSubTitle,
                textStyle: subTitleTextStyle ??
                    EhpTextStyle.h4
                        .copyWith(color: Theme.of(context).primaryColor),
              )
            : null,
        children: [child],
      ),
    );
  }
}
