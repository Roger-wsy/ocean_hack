import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';

class EhpSkeleton extends StatelessWidget {
  const EhpSkeleton({
    Key? key,
    this.height,
    this.width,
    this.padding = EhpPadding.zero,
  }) : super(key: key);

  final double? height, width;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    double defaultPadding = 16;

    return Padding(
      padding: padding,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            borderRadius: BorderRadius.all(Radius.circular(defaultPadding))),
      ),
    );
  }
}

class EhpCircleSkeleton extends StatelessWidget {
  const EhpCircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}
