import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constant/constant.dart';
import '_index.dart';

class EhpActivityCard extends StatefulWidget {
  EhpActivityCard({
    super.key,
    this.imageUrl,
    this.title,
    this.ratings,
    this.description,
    required this.tag,
    this.onTap,
  });

  String? title;
  String? imageUrl;
  double? ratings;
  String? description;
  String tag;
  VoidCallback? onTap;

  @override
  State<EhpActivityCard> createState() => _EhpActivityCardState();
}

class _EhpActivityCardState extends State<EhpActivityCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
              margin: EhpPadding.a16,
              height: MediaQuery.of(context).size.height * 0.16,
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
                    child: Hero(
                      tag: widget.tag,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        child: Image.network(
                          widget.imageUrl ??
                              'https://ocean-hackathon.cheesysun.com/pictures/charmander.jpg',
                          fit: BoxFit.cover,
                        ),
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
                            EhpSizedBox.h4,
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
                              widget.description,
                              maxLines: 3,
                              overflow: TextOverflow.visible,
                              textStyle: EhpTextStyle.b5,
                            )
                          ],
                        ),
                      ))
                ],
              )),
        ],
      ),
    );
  }
}
