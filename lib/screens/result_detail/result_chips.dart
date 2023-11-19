import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ocean_hack/components/ehp_activity_card.dart';
import 'package:ocean_hack/routes/route_name.dart';
import 'package:ocean_hack/screens/result_detail/activities_detail.dart';

import '../../components/_index.dart';
import '../../constant/constant.dart';

class ResultChipsArgs {
  ResultChipsArgs({
    this.placeName = '',
  });

  String? placeName;
}

class ResultChips extends StatefulWidget {
  const ResultChips({super.key, this.args});

  final ResultChipsArgs? args;

  @override
  State<ResultChips> createState() => _ResultChipsState();
}

Map<String, dynamic> options = {
  "1": "Activities",
  "2": "Accomodation",
  "3": "Transportation"
};

Map<String, dynamic> activities = {
  "Snorkeling": {
    "ratings": 5,
    "description":
        "Dive into a world of wonder with snorkeling—an exhilarating aquatic adventure that transforms you into an explorer of the underwater realm. With just a mask, fins, and a snorkel, you'll glide effortlessly on the water's surface, peering into a vibrant and teeming universe below. Immerse yourself in the kaleidoscope of colors as schools of fish dance around coral gardens, and curious sea creatures dart in and out of hidden looks. \n\nAvoid touching or standing on coral reefs, as it can cause harm to the delicate marine ecosystem.",
    "imageUrl":
        "https://images.unsplash.com/photo-1524070600608-41d598325be8?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTV8fHNub3JrZWxpbmd8ZW58MHx8MHx8fDA%3D"
  },
  "Diving": {
    "ratings": 5,
    "description":
        "Embark on a daring plunge into the heart of the ocean's mysteries with scuba diving, a spellbinding journey that unveils an alien world beneath the waves. Strapped into your trusty tank and armed with fins, you'll descend into the liquid abyss, surrounded by the hushed serenity of the underwater realm. Feel weightless as you navigate through intricate coral gardens, encountering a mesmerizing array of marine life—from graceful sea turtles to elusive seahorses.  \n\n Don't forget to ascend gradually and perform safety stops to prevent decompression sickness during scuba diving.",
    "imageUrl":
        "https://images.unsplash.com/photo-1608209957132-587daea098f3?q=80&w=4000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
};

Map<String, dynamic> hotels = {
  "THE DATAI LANGKAWI": {
    "ratings": 5,
    "description":
        "Situated in the main buildings, the beautiful Canopy Collection rooms and suites are a delightful way to experience The Datai Langkawi and its stunning views and award-winning architecture. A good choice for guests who like to be near the spectacular Main Pool, The Dining Room and The Lobby Lounge.",
    "imageUrl":
        "https://images.unsplash.com/photo-1455587734955-081b22074882?q=80&w=1920&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  "ALOFT LANGKAWI PANTAI TENGAH": {
    "ratings": 5,
    "description":
        "Aloft Langkawi Pantai Tengah features free bikes, outdoor swimming pool, a fitness centre and restaurant in Pantai Cenang. This 4-star hotel offers a kids' club, room service and free WiFi. The hotel has a hot tub and a 24-hour front desk. Aloft Langkawi Pantai Tengah offers a sun terrace. You can play billiards at the hotel Pantai Tengah Beach is 300 metres from Aloft Langkawi Pantai Tengah, while Cenang Beach is 2.2 km away. The nearest airport is Langkawi International Airport, 7 km from the accommodation.",
    "imageUrl":
        "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8aG90ZWx8ZW58MHx8MHx8fDA%3D"
  },
  "ADYA HOTEL PANTAI CHENANG": {
    "ratings": 5,
    "description":
        "The car parking and the Wi-Fi are always free, so you can stay in touch and come and go as you please. Don't leave before paying a visit to the famous Cenang Beach. Rated with 4 stars, this high-quality property",
    "imageUrl":
        "https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGhvdGVsfGVufDB8fDB8fHww"
  },
  "WINGS by CROSKE RESORT LANGKAWI": {
    "ratings": 4,
    "description":
        "Wings by Croske Resort is a 16-minutes walk from the Airport Beach, Has outdoor swimming pool, free private parking, a garden and a shared lounge. This 4-star hotel offers a bar. The property provides a 24-hour front desk, airport transportation, room service and free WiFi throughout the property.",
    "imageUrl":
        "https://images.unsplash.com/photo-1563911302283-d2bc129e7570?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGhvdGVsfGVufDB8fDB8fHww"
  },
};

Map<String, dynamic> transports = {
  "Langkawi Ferry Services Sdn. Bhd.": {
    "ratings": 5,
    "description":
        "Langkawi Ferry Services Sdn. Bhd. or LFS was established on 20th Nov 1996. In 1997, the company has purchased 6 new high-speed passengers ferries as a start off to its business operation. Today, LFS has 12 ferries in total operating daily between Langkawi, Kuala Kedah, Kuala Perlis, Penang, Puala Payar Marine Park and Satun (Thailand). Its also service between Penang and Medan (Indonesia).",
    "imageUrl":
        "https://images.unsplash.com/photo-1593351415075-3bac9f45c877?q=80&w=4142&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  "B&V Marine": {
    "ratings": 4,
    "description":
        "B&V Marine Langkawi was established with a mission to provide the best and the most affordable service to all the yachtsmen in Langkawi coming from around the world. More than 10 years of functionality undeniably proves our confidence and reliability. As of today, organization is growing and expanding.",
    "imageUrl": "https://ocean-hackathon.cheesysun.com/pictures/boat 2.jpg"
  },
};

Map<String, dynamic> displayList = activities;

int selectedIndex = 0;

class _ResultChipsState extends State<ResultChips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        EhpSliverAppBar(
          appBarTitle: widget.args?.placeName ?? 'Pulau Pinang',
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(options.length, (index) {
                    return Padding(
                      padding: index == 0
                          ? const EdgeInsets.fromLTRB(16, 0, 4, 0)
                          : EhpPadding.h4,
                      child: ChoiceChip(
                        selectedColor: ehpLightPrimaryColor,
                        label: EhpText(
                          options[
                              (index + 1).toString()], // Adjusted to match keys
                          color: selectedIndex == index
                              ? Colors.white
                              : ehpLightPrimaryColor,
                        ),
                        backgroundColor: Colors.white,
                        elevation: 2,
                        selected: selectedIndex == index,
                        onSelected: (_) {
                          setState(() {
                            selectedIndex = index; // Update the selected index
                            displayList = selectedIndex == 0
                                ? activities
                                : selectedIndex == 1
                                    ? hotels
                                    : transports;
                          });
                        },
                      ),
                    );
                  }),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_alt_rounded),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: List.generate(
              displayList.length,
              (index) {
                var entry = displayList.entries.elementAt(index);
                var title = entry.key; // Title from the map's key
                var description = entry
                    .value['description']; // Description from the map's value
                var ratings = double.parse(entry.value['ratings'].toString());
                var imageUrl = entry.value['imageUrl'];

                return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: EhpActivityCard(
                        title: title,
                        imageUrl: imageUrl,
                        description: description,
                        ratings: ratings,
                        tag: 'pulau_redang$index $title',
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.activityDetail,
                              arguments: ActivityDetailArgs(
                                imageUrl: imageUrl,
                                tag: 'pulau_redang$index $title',
                                titleName: title,
                                description: description,
                              ));
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: EhpSizedBox.h16,
        )
      ]),
    );
  }
}
