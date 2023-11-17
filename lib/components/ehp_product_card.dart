import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import 'package:ocean_hack/utils/string_utils.dart';
import '_index.dart';

class EhpProductCard extends StatelessWidget {
  EhpProductCard({
    Key? key,
    this.productName = '',
    this.sellerName = '',
    this.reviewCount = '',
    this.imagePath = '',
    this.labelText = '',
    this.discountPrice = 0,
    this.price = 0,
    this.height = 250,
    this.width = 150,
    this.imageHeight = 160,
    this.imageWidth = 130,
    this.fontSize,
    this.favPositionBottom = 60,
    this.favPositionRight = -6,
    this.productRating = 0,
    this.isFavourite = false,
    this.isDiscount = false,
    this.showFavorite = true,
    this.fontWeight,
    this.overflow,
    this.imageAlignment = Alignment.bottomCenter,
    this.color = Colors.black,
    this.onPressedProduct,
    this.onPressedCircularIcon,
    this.padding = const EdgeInsets.fromLTRB(16, 0, 0, 0),
  }) : super(key: key);

  String? productName;
  String? sellerName;
  String? reviewCount;
  String imagePath;
  String? labelText;
  double? discountPrice;
  double? price;
  double? height;
  double? width;
  double? imageHeight;
  double? imageWidth;
  double? fontSize;
  double? favPositionBottom;
  double? favPositionRight;
  double productRating;
  bool isFavourite;
  bool isDiscount;
  bool showFavorite;
  FontWeight? fontWeight;
  TextOverflow? overflow;
  Alignment imageAlignment;
  Color? color;
  VoidCallback? onPressedProduct;
  Function? onPressedCircularIcon;
  EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      child: Stack(
        children: [
          GestureDetector(
            onTap: onPressedProduct,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: imageHeight,
                  width: imageWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      imagePath,
                      alignment: imageAlignment,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EhpPadding.v4,
                  child: Row(
                    children: [
                      // RatingBarIndicator(
                      //   rating: productRating,
                      //   itemCount: 5,
                      //   itemSize: 12,
                      //   physics: const BouncingScrollPhysics(),
                      //   itemBuilder: (context, _) => const Icon(
                      //     Icons.star,
                      //     color: ehpYellow,
                      //   ),
                      // ),
                      EhpText(
                        reviewCount!,
                        fontSize: 10,
                        color: ehpGray,
                      ),
                    ],
                  ),
                ),
                EhpText(
                  sellerName!.toCapitalized(),
                  fontSize: 12,
                  color: ehpGray,
                ),
                EhpText(
                  productName!.toCapitalized(),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color,
                ),
                const SizedBox(
                  height: 2,
                ),
                isDiscount
                    ? Row(
                        children: [
                          EhpText(
                            'RM${price?.toStringAsFixed(2)}',
                            textDecoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.normal,
                            color: ehpGray,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Expanded(
                            child: EhpText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              'RM${discountPrice?.toStringAsFixed(2)}',
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      )
                    : EhpText(
                        'RM${price!.toStringAsFixed(2)}',
                        fontWeight: FontWeight.normal,
                        color: color,
                      ),
              ],
            ),
          ),
          showFavorite
              ? Positioned(
                  bottom: favPositionBottom,
                  right: favPositionRight,
                  child: EhpCircularButton(
                    active: isFavourite,
                    onPressed: (val) {
                      showFavorite ? onPressedCircularIcon!(val) : null;
                    },
                  ),
                )
              : EhpSizedBox.shrink,
          isDiscount
              ? Positioned(
                  left: 8,
                  top: 8,
                  child: EhpLabel(
                      padding: EdgeInsets.zero, labelText: labelText ?? ''),
                )
              : EhpSizedBox.shrink,
        ],
      ),
    );
  }
}
