import 'package:flutter/material.dart';
import 'package:ocean_hack/components/ehp_incoming_card.dart';

import '../../components/ehp_history_card.dart';

class IncomingPage extends StatefulWidget {
  const IncomingPage({super.key});

  @override
  State<IncomingPage> createState() => _IncomingPageState();
}

class _IncomingPageState extends State<IncomingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              EhpIncomingCard(
                tag: 'hello',
                title: 'Pulau Redang',
                ratings: 4.7,
                description:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                imageUrl:
                    'https://ocean-hackathon.cheesysun.com/pictures/turtle_playing_corals.jpg',
                onTap: () {},
              ),
              EhpIncomingCard(
                tag: 'jahsja',
                title: 'Pulau Redang',
                ratings: 4.7,
                description:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                imageUrl:
                    'https://ocean-hackathon.cheesysun.com/pictures/gazebo_island.jpg',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
