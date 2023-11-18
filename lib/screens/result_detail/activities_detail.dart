import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ocean_hack/components/_index.dart';
import 'package:ocean_hack/constant/constant.dart';
import 'package:ocean_hack/routes/route_name.dart';

class ActivityDetailArgs {
  ActivityDetailArgs({
    required this.imageUrl,
    required this.tag,
    required this.titleName,
    required this.description,
    this.ratings,
  });

  String? imageUrl;
  String? tag;
  String? titleName;
  String? description;
  double? ratings;
}

class ActivitiesDetailPage extends StatefulWidget {
  const ActivitiesDetailPage({super.key, this.args});

  final ActivityDetailArgs? args;

  @override
  State<ActivitiesDetailPage> createState() => _ActivitiesDetailPageState();
}

class _ActivitiesDetailPageState extends State<ActivitiesDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EhpSliverAppBar(
            appBarTitle: 'Details',
          ),
          SliverToBoxAdapter(
            child: Hero(
              tag: widget.args!.tag.toString(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.args?.imageUrl ??
                      'https://ocean-hackathon.cheesysun.com/pictures/charmander.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EhpPadding.containerCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EhpText(
                            widget.args?.titleName,
                            padding: EhpPadding.v4,
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          EhpText(
                            'RM300.00 / person',
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      EhpCircularButton(
                        onPressed: (_) {},
                      ),
                    ],
                  ),
                  EhpSizedBox.h20,
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://ocean-hackathon.cheesysun.com/pictures/charmander.jpg'),
                        radius: 30,
                      ),
                      EhpSizedBox.w16,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    EhpText(
                                      'John Doe',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    RatingBarIndicator(
                                      rating: 4.75,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                  ],
                                ),
                                EhpText(
                                  '17 Nov 2023',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  EhpText(
                    widget.args?.description,
                    maxLines: 40,
                    padding: EhpPadding.v8,
                    textAlign: TextAlign.justify,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                  const Divider(
                    indent: 3,
                    endIndent: 3,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EhpPadding.containerCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EhpText(
                    'Feedback',
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  feedbackCard(),
                  feedbackCard(),
                  feedbackCard(),
                  EhpSizedBox.h16,
                  EhpSingleButton(
                    text: 'Booking',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.bookingConfirmation,
                      );
                    },
                  ),
                  EhpSizedBox.h28,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class feedbackCard extends StatelessWidget {
  feedbackCard({
    super.key,
    this.comment,
    this.ratings,
    this.userName,
    this.imageUrl,
  });

  String? comment;
  double? ratings;
  String? userName;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl ??
                'https://ocean-hackathon.cheesysun.com/pictures/charmander.jpg'),
            radius: 30,
          ),
          EhpSizedBox.w16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        EhpText(
                          userName ?? 'John Doe',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        RatingBarIndicator(
                          rating: ratings ?? 4.75,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                    EhpText(
                      '17 Nov 2023',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
                EhpText(
                  comment ??
                      'I think the place is great and will com back again',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
