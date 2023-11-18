import 'package:flutter/material.dart';
import 'package:ocean_hack/components/ehp_activity_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                EhpActivityCard(
                  tag: "a",
                  title: 'Pulau Redang',
                  ratings: 4.7,
                  description: 'Lorem Ipsum is happy ',
                  imageUrl:
                      'https://ocean-hackathon.cheesysun.com/pictures/beach.jpg',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
