import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpHorizontalProductCard extends StatelessWidget {
  EhpHorizontalProductCard({
    super.key,
    this.image = 'assets/EhpDrone_road.jpg',
    this.seller = '',
    this.serviceName = '',
    this.price,
    this.rating = 3,
    this.categories,
    this.cardHeight = 100,
    this.hideCloseButton = false,
    this.padding = EhpPadding.containerCenter,
    this.isCard = true,
    this.onCancelTap,
    this.onCardTap,
  });

  String? image;
  String? seller;
  String? serviceName;
  double? price;
  double? rating;
  List<dynamic>? categories;
  double? cardHeight;
  bool hideCloseButton;
  EdgeInsets padding;
  bool isCard;
  VoidCallback? onCancelTap;
  VoidCallback? onCardTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Padding(
        padding: isCard ? padding : EhpPadding.h16,
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                isCard ? BorderRadius.circular(10) : const BorderRadius.only(),
            color: ehpSecondaryColor,
            boxShadow: [
              if (isCard)
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
            ],
          ),
          height: cardHeight,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: isCard
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )
                        : const BorderRadius.only(),
                    image: DecorationImage(
                      image: NetworkImage(image ?? ''),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.black,
                  ),
                  height: cardHeight,
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EhpPadding.containerCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                EhpText(
                                  seller,
                                  fontSize: 12,
                                  color: ehpGray,
                                ),
                                EhpText(
                                  serviceName,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(
                                    categories?.length ?? 0,
                                    (index) => EhpLabel(
                                      labelType: LabelType.bordered,
                                      padding: const EdgeInsets.only(
                                        right: 4,
                                        top: 4,
                                      ),
                                      labelText: categories?[index] ?? '',
                                    ),
                                  ),
                                )
                              ],
                            ),
                            EhpText(
                              "RM${price?.toStringAsFixed(2)}",
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          hideCloseButton
                              ? EhpSizedBox.shrink
                              : GestureDetector(
                                  onTap: onCancelTap,
                                  child: const Icon(
                                    Icons.close,
                                    size: 18,
                                    color: ehpGray,
                                  ),
                                ),
                          // RatingBarIndicator(
                          //   rating: rating ?? 0,
                          //   itemCount: 5,
                          //   itemSize: 12,
                          //   physics: const BouncingScrollPhysics(),
                          //   itemBuilder: (context, _) => const Icon(
                          //     Icons.star,
                          //     color: EhpYellow,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
