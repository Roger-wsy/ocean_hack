import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpModuleCard extends StatelessWidget {
  const EhpModuleCard({
    super.key,
    this.imageSize = 70,
    this.image,
    this.title,
    this.subtitle,
    this.onTap,
    this.showDivider,
  });

  final double? imageSize;
  final String? image;
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool? showDivider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: imageSize,
                width: imageSize,
                child: image != null
                    ? Image.asset(
                        image!,
                        fit: BoxFit.cover,
                      )
                    : EhpSizedBox.shrink,
              ),
              EhpSizedBox.w16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EhpText(
                      title,
                      maxLines: 2,
                      textStyle: EhpTextStyle.h2,
                    ),
                    EhpSizedBox.h8,
                    EhpText(
                      subtitle,
                      maxLines: 3,
                      textStyle: EhpTextStyle.labelText,
                    ),
                  ],
                ),
              )
            ],
          ),
          const Padding(
            padding: EhpPadding.v16,
            child: Divider(
              height: 1,
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
