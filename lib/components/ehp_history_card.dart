import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constant/constant.dart';
import '_index.dart';

class EhpHistoryCard extends StatefulWidget {
  EhpHistoryCard({
    super.key,
    this.imageUrl,
    this.title,
    this.ratings,
    this.description,
    this.onTap,
  });

  String? title;
  String? imageUrl;
  double? ratings;
  String? description;
  VoidCallback? onTap;

  @override
  State<EhpHistoryCard> createState() => _EhpHistoryCardState();
}

class _EhpHistoryCardState extends State<EhpHistoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            margin: EhpPadding.a16,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: customShadow,
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Image.network(
                      widget.imageUrl ??
                          'https://ocean-hackathon.cheesysun.com/pictures/charmander.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EhpPadding.a16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EhpText(
                            widget.title,
                            textStyle: EhpTextStyle.h2,
                          ),
                          RatingBarIndicator(
                            rating: widget.ratings ?? 3.0,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            unratedColor: Colors.amber.withAlpha(50),
                            direction: Axis.horizontal,
                          ),
                          EhpText(
                            'Vistied on:',
                            textStyle: EhpTextStyle.h3,
                          ),
                          EhpText(
                            '11 October 2023',
                            textStyle: EhpTextStyle.b3,
                          ),
                          EhpSizedBox.h8,
                          Container(
                            padding: EhpPadding.a4,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                border: Border.all(color: Colors.red)),
                            child: EhpText(
                              'Click for Feedback',
                              fontSize: 12,
                              textAlign: TextAlign.center,
                              padding: EhpPadding.h4,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
