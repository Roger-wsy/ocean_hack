import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpReviewTitle extends StatelessWidget {
  EhpReviewTitle({
    Key? key,
    this.review,
    this.rating,
    this.viewAllOnTap,
  }) : super(key: key);

  int? review;
  double? rating;
  VoidCallback? viewAllOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EhpText(
          'Review ($review)',
          fontWeight: FontWeight.bold,
          padding: EhpPadding.a16,
          fontSize: 18,
        ),
        const Spacer(),
        const Icon(
          Icons.star,
          color: ehpYellow,
          size: 16,
        ),
        EhpText(
          rating?.toStringAsFixed(1),
          padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        GestureDetector(
          onTap: viewAllOnTap,
          child: Row(
            children: [
              EhpText(
                'View All',
                padding: EhpPadding.h16,
                fontSize: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
