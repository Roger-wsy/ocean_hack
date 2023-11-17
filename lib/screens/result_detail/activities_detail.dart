import 'package:flutter/material.dart';
import 'package:ocean_hack/components/_index.dart';
import 'package:ocean_hack/constant/constant.dart';

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
              tag: 'pulau_redang',
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
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
                  EhpText(
                    widget.args?.titleName,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  EhpText(
                    widget.args?.description,
                    maxLines: 20,
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
                  Row(children: [
                    
                  ],)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
