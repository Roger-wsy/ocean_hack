import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpInfoList extends StatelessWidget {
  EhpInfoList({
    super.key,
    this.leftTextList = const [],
    this.rightTextList = const [],
    this.leftTextStyle = const TextStyle(
      fontSize: 12,
    ),
    this.rightTextStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    this.padding = EhpPadding.zero,
    this.showDottedLine = false,
    this.showDivider = false,
    this.backgroundColor,
  });

  List<String> leftTextList;
  List<String> rightTextList;
  EdgeInsets padding;
  TextStyle? leftTextStyle;
  TextStyle? rightTextStyle;
  bool showDottedLine;
  bool showDivider;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: padding,
      child: Column(
        children: _buildInfoList(leftTextList, rightTextList),
      ),
    );
  }

  List<Widget> _buildInfoList(leftTextList, rightTextList) {
    return List.generate(
      leftTextList.length,
      (index) => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: _buildLeftText(leftTextList[index]),
              ),
              Expanded(
                flex: 6,
                child: _buildRightText(rightTextList[index]),
              ),
            ],
          ),
          if (showDivider && index != leftTextList.length - 1)
            Divider(
              color: ehpGray.withOpacity(0.5),
              thickness: 1,
            ),
        ],
      ),
    );
  }

  Widget _buildLeftText(String text) {
    return Padding(
      padding: EhpPadding.a2,
      child: EhpText(
        text,
        textStyle: leftTextStyle,
      ),
    );
  }

  Widget _buildRightText(String text) {
    return Padding(
      padding: EhpPadding.a2,
      child: EhpText(
        maxLines: 3,
        text,
        textAlign: TextAlign.right,
        textStyle: rightTextStyle,
      ),
    );
  }
}
