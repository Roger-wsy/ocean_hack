import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpProfileTile extends StatelessWidget {
  EhpProfileTile({
    Key? key,
    this.title = '',
    this.content = '',
    this.onTap,
    this.padding = EhpPadding.h16,
    this.showDivider = true,
  }) : super(key: key);

  String title;
  String? content;
  VoidCallback? onTap;
  EdgeInsetsGeometry padding;
  bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EhpText(
                        title,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        maxLines: 1,
                      ),
                      EhpText(
                        content,
                        fontSize: 12,
                        color: ehpGray,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Icon(
                    Icons.chevron_right,
                    size: 30,
                    color: ehpGray,
                  ),
                ),
              ],
            ),
            showDivider
                ? Divider(
                    color: Colors.grey[200],
                  )
                : EhpSizedBox.h8,
          ],
        ),
      ),
    );
  }
}
