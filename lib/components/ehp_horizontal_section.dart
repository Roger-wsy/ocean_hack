import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpHorizontalSection extends StatelessWidget {
  EhpHorizontalSection({
    Key? key,
    this.sectionTitle = '',
    this.sectionSubtitle = '',
    this.viewAllOnTap,
    this.showViewAll = true,
    this.child,
    this.padding = EhpPadding.t16,
  }) : super(key: key);

  String? sectionTitle;
  String? sectionSubtitle;
  VoidCallback? viewAllOnTap;
  EdgeInsets padding;
  Widget? child;
  bool showViewAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Padding(
            padding: EhpPadding.h16,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EhpText(
                      sectionTitle,
                      textStyle: EhpTextStyle.h2,
                    ),
                    if (sectionSubtitle != "")
                      EhpText(
                        sectionSubtitle,
                        textStyle: EhpTextStyle.b5.copyWith(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                if (showViewAll)
                  GestureDetector(
                    onTap: viewAllOnTap,
                    child: Row(
                      children: [
                        EhpText(
                          'View More',
                          textStyle: EhpTextStyle.b5.copyWith(
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                          size: 12,
                          color: Theme.of(context).disabledColor,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          EhpSizedBox.h16,
          child ?? EhpSizedBox.shrink,
        ],
      ),
    );
  }
}
