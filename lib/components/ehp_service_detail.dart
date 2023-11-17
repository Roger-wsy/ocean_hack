import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpServiceDetail extends StatelessWidget {
  EhpServiceDetail({
    Key? key,
    this.productName = '',
    this.sellerName = '',
    this.sellerImage = '',
    this.productDescription = '',
    this.price = 0,
    this.rating = 0,
    this.review = 0,
    this.favPositionBottom = 60,
    this.favPositionRight = -6,
    this.showFavorite = true,
    this.isOfficialStore = true,
    this.onPressedCircularIcon,
    this.isFavourite = false,
  }) : super(key: key);

  String? productName;
  String? sellerName;
  String sellerImage;
  String? productDescription;
  double? price;
  double? rating;
  double? favPositionBottom;
  double? favPositionRight;
  int? review;
  bool isOfficialStore;
  bool showFavorite;
  Function? onPressedCircularIcon;
  bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EhpText(
                  productName,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  padding: EhpPadding.h16,
                ),
                EhpText(
                  'RM${price?.toStringAsFixed(2)} / day',
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  padding: EhpPadding.containerCenter,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: ehpYellow,
                        size: 16,
                      ),
                      EhpText(
                        rating?.toStringAsFixed(1),
                        padding: const EdgeInsets.fromLTRB(4, 0, 12, 0),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      EhpText(
                        '${review?.toString()} Reviews',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                )
              ],
            ),
            showFavorite
                ? EhpCircularButton(
                    active: isFavourite,
                    onPressed: (val) {
                      showFavorite ? onPressedCircularIcon!(val) : null;
                    },
                  )
                : EhpSizedBox.shrink,
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     padding: EhpPadding.a24,
            //     child: isFavorite
            //         ? const Icon(
            //             Icons.favorite,
            //             color: Theme.of(context).primaryColor,
            //             size: 34,
            //           )
            //         : const Icon(
            //             Icons.favorite_outline,
            //             color: EhpGray,
            //             size: 34,
            //           ),
            //   ),
            // ),
          ],
        ),
        Divider(
          thickness: 1,
          indent: 18,
          endIndent: 18,
          color: Colors.grey.shade400,
        ),
        Padding(
          padding: EhpPadding.a16,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(sellerImage),
                radius: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EhpText(
                    sellerName,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    padding: EhpPadding.h16,
                  ),
                  isOfficialStore
                      ? EhpText(
                          'Official Store ✅',
                          fontSize: 14,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                        )
                      : Container(),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          indent: 18,
          endIndent: 18,
          color: Colors.grey.shade400,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EhpText(
                'Description Product',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                padding: EhpPadding.a16,
              ),
              EhpText(
                productDescription,
                fontWeight: FontWeight.normal,
                fontSize: 14,
                height: 1.5,
                padding: EhpPadding.h16,
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          indent: 18,
          endIndent: 18,
          color: Colors.grey.shade400,
        ),
      ],
    );
  }
}
