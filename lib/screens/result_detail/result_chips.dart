import 'package:flutter/material.dart';
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
            child: EhpActivityCard(
          title: 'Pulau Redang',
          description:
              'Pulau Redang Pulau Redang v Pulau Redang Pulau Redangv Pulau Redang vv',
          tag: 'pulau_redang',
          onTap: () {
            Navigator.pushNamed(context, RouteName.activityDetail,
                arguments: ActivityDetailArgs(
                    imageUrl:
                        'https://ocean-hackathon.cheesysun.com/pictures/charmander.jpg',
                    tag: 'pulau_redang',
                    titleName: 'Pulau Redang',
                    description:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'));
          },
        ))
      ]),
    );
  }
}
