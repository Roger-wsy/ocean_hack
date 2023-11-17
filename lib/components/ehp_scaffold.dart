import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpScaffold extends StatefulWidget {
  EhpScaffold({
    Key? key,
    @required this.body,
    this.appBarTitle = '',
    this.appBarLeading,
    this.pinAppBar = false,
    this.leadingOnTap,
    this.showBackButton = false,
    this.pageTitle = '',
    this.bottomNavigationBarWidget,
    this.flexibleSpaceWidget,
    this.expandedHeight,
    this.appBarElevation,
    this.floatAppBar = false,
    this.snapAppBar = false,
    this.sliverPersistentHeader,
    this.onFilterIconPressed,
    this.showExpandedAppBar = false,
    this.forceElevated = false,
  }) : super(key: key);

  Widget? body;
  String? appBarTitle;
  Widget? appBarLeading;
  bool pinAppBar;
  VoidCallback? leadingOnTap;
  bool showBackButton;
  String? pageTitle;
  Widget? bottomNavigationBarWidget;
  Widget? flexibleSpaceWidget;
  double? expandedHeight;
  double? appBarElevation;
  bool snapAppBar;
  bool floatAppBar;
  Widget? sliverPersistentHeader;
  VoidCallback? onFilterIconPressed;
  bool showExpandedAppBar;
  bool forceElevated;

  @override
  State<EhpScaffold> createState() => _EhpScaffoldState();
}

class _EhpScaffoldState extends State<EhpScaffold> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        bottomNavigationBar: widget.bottomNavigationBarWidget,
        body: CustomScrollView(
          slivers: [
            EhpSliverAppBar(
              appBarElevation: widget.appBarElevation,
              appBarLeading: widget.appBarLeading,
              appBarTitle: widget.appBarTitle,
              flexibleSpaceWidget: widget.flexibleSpaceWidget,
              floatAppBar: widget.floatAppBar,
              forceElevated: widget.forceElevated,
              leadingOnTap: widget.leadingOnTap,
              pinAppBar: widget.pinAppBar,
              showBackButton: widget.showBackButton,
              snapAppBar: widget.snapAppBar,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  widget.pageTitle == ""
                      ? EhpSizedBox.shrink
                      : EhpPageTitle(title: widget.pageTitle),
                  widget.body!,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
