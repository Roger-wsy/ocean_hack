import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpReviewTile extends StatelessWidget {
  EhpReviewTile({
    Key? key,
    this.sellerImage = '',
    this.userName,
    this.reviewTime = '',
    this.review = '',
    this.userRating = 0,
  }) : super(key: key);

  String sellerImage;
  String? userName;
  String? reviewTime;
  String? review;
  double userRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EhpPadding.h16,
      child: Row(
        children: [
          Container(
            height: 120,
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage(sellerImage),
              radius: 26,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.78,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EhpText(
                        userName,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      EhpText(
                        reviewTime,
                        color: ehpGray,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 4),
                child: Wrap(
                  children: [
                    // RatingBarIndicator(
                    //   rating: userRating,
                    //   itemCount: 5,
                    //   itemSize: 16,
                    //   physics: const BouncingScrollPhysics(),
                    //   itemBuilder: (context, _) => const Icon(
                    //     Icons.star,
                    //     color: EhpYellow,
                    //   ),
                    // ),
                    EhpText(
                      userRating.toString(),
                      padding: EhpPadding.h8,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: 70,
                    maxWidth: MediaQuery.of(context).size.width - 85),
                child: EhpText(
                  review,
                  maxLines: 3,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
