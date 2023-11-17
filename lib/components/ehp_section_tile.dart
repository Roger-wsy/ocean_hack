import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpSectionTile extends StatelessWidget {
  const EhpSectionTile({
    super.key,
    this.leftTextList = const [],
    this.rightTextList = const [],
    this.sectionTitle,
  });

  final List<String>? leftTextList;
  final List<String>? rightTextList;
  final String? sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EhpText(
            sectionTitle ?? '',
            padding: EhpPadding.containerCenter4,
            textStyle: EhpTextStyle.h2,
          ),
          EhpInfoList(
            backgroundColor: Colors.white,
            showDivider: true,
            padding: EhpPadding.containerCenter,
            leftTextStyle: EhpTextStyle.labelText,
            rightTextStyle: EhpTextStyle.labelTextBold,
            leftTextList: leftTextList ?? [],
            rightTextList: rightTextList ?? [],
          ),
          Container(
            height: 16,
            width: double.infinity,
            color: ehpBackground,
          ),
        ],
      ),
    );
  }
}
