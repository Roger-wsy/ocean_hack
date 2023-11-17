import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpSliverAppBar extends StatelessWidget {
  EhpSliverAppBar({
    Key? key,
    this.appBarTitle,
    this.appBarElevation,
    this.pinAppBar = true,
    this.floatAppBar = false,
    this.snapAppBar = false,
    this.showBackButton = true,
    this.leadingOnTap,
    this.appBarLeading,
    this.flexibleSpaceWidget,
    this.forceElevated = false,
    this.actionWidgets,
    this.appBarTitleWidget,
    this.appBarTitleStyle,
    this.expandedHeight,
    this.bottom,
  }) : super(key: key);

  String? appBarTitle;
  double? appBarElevation;
  bool pinAppBar;
  bool floatAppBar;
  bool snapAppBar;
  bool showBackButton;
  VoidCallback? leadingOnTap;
  Widget? appBarLeading;
  Widget? flexibleSpaceWidget;
  bool forceElevated;
  List<Widget>? actionWidgets;
  Widget? appBarTitleWidget;
  TextStyle? appBarTitleStyle;
  double? expandedHeight;
  PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      actions: actionWidgets,
      bottom: bottom,
      titleTextStyle: appBarTitleStyle ??
          EhpTextStyle.h2.copyWith(
            color: Colors.black,
          ),
      title: appBarTitleWidget ??
          EhpText(
            appBarTitle ?? "",
            maxLines: 1,
          ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: appBarElevation,
      forceElevated: forceElevated,
      centerTitle: true,
      pinned: pinAppBar,
      floating: floatAppBar,
      snap: snapAppBar,
      leading: showBackButton
          ? GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: leadingOnTap ??
                  () {
                    Navigator.pop(context);
                  },
              child: appBarLeading ??
                  const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: Colors.black,
                  ),
            )
          : EhpSizedBox.shrink,
      flexibleSpace: flexibleSpaceWidget,
    );
  }
}
