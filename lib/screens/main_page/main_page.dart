import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:ocean_hack/components/_index.dart';
import 'package:ocean_hack/constant/constant.dart';
import 'package:ocean_hack/routes/route_name.dart';
import 'package:ocean_hack/screens/main_page/profile_section.dart';
import 'package:ocean_hack/screens/result_detail/result_chips.dart';
import 'package:ocean_hack/utils/string_utils.dart';

import 'constant.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

Map<String, dynamic> ruleList = {
  'Look, Dont Touch!': {
    'imageUrl':
        'https://ocean-hackathon.cheesysun.com/pictures/underwater_fish.jpg',
  },
  'Self-Grazing, NO Hand-Feeding!': {
    'imageUrl':
        'https://ocean-hackathon.cheesysun.com/pictures/turtle_playing_corals.jpg',
  },
  'Like SunScreen, but BETTER!': {
    'imageUrl': 'https://ocean-hackathon.cheesysun.com/pictures/dock_waves.jpg',
  },
  'Shocking Ocean Poluution Statistics': {
    'imageUrl': 'https://ocean-hackathon.cheesysun.com/pictures/dolphins.jpg',
  }
};

final List<Widget> imageSliders = ruleList.entries
    .map((entry) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(entry.value['imageUrl'],
                    fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      entry.key, // Use the rule name as the label
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ))
    .toList();

class _MainPageState extends State<MainPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  SuggestionsBoxController? suggestionBoxController;

  @override
  void initState() {
    super.initState();
    suggestionBoxController = SuggestionsBoxController();
  }

  @override
  void dispose() {
    suggestionBoxController?.close();
    super.dispose();
  }

  String destination = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
              Column(
                children: [
                  const ProfileSection(),
                  EhpSizedBox.h16,
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: customShadow2,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Column(children: [
                      EhpSizedBox.h8,
                      FormBuilder(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EhpText(
                              'Destination',
                              fontSize: 22,
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            ),
                            EhpAutoComplete(
                              leading: const Icon(Icons.search),
                              suggestionsBoxController: suggestionBoxController,
                              minCharsForSuggestions: 1,
                              onSuggestionSelected: (p0) {
                                setState(() {
                                  destination = p0;
                                });
                              },
                              onSubmitted: (p0) {
                                setState(() {
                                  destination = p0;
                                });
                              },
                              hintText: 'Enter your destination',
                              autoFocus: true,
                              options: const [
                                'Pulau Pinang',
                                'Pulau Langkawi',
                                'Pulau Redang'
                              ],
                            ),
                            EhpDateTimePickerTitle(
                              name: FindingPlaceConstant.startDate,
                              placeHolder: 'Select visiting date',
                              titleName: 'Visit Date',
                              firstDate: DateTime.now(),
                              format: DateFormat('dd MMM yyyy'),
                              initialEntryMode: DatePickerEntryMode.calendar,
                              inputType: InputType.date,
                              suffixIcon: const Icon(Icons.calendar_month),
                              onChanged: (_) {},
                            ),
                          ],
                        ),
                      ),
                      EhpSizedBox.h8,
                      EhpSingleButton(
                          text: 'Search',
                          color: ehpLightPrimaryColor2,
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.resultChips,
                              arguments: ResultChipsArgs(
                                placeName: destination.toTitleCase(),
                              ),
                            );
                            destination = "";
                            _formKey.currentState?.reset();
                          })
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Column(
                      children: [
                        EhpHorizontalSection(
                          sectionTitle: 'Guidelines',
                          sectionSubtitle: "Learn before we visit",
                          child: SizedBox(
                            height: 150,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                aspectRatio: 3,
                                enlargeCenterPage: true,
                              ),
                              items: imageSliders,
                            ),
                          ),
                          viewAllOnTap: () {},
                        ),
                      ],
                    ),
                  ),
                  PromotionCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  PromotionCard({
    super.key,
  });

  Map<String, dynamic> promotionPlaces = {
    'Pulau Langkawi': {
      'addInfo': 'Most beautiful island',
      'imageUrl':
          'https://ocean-hackathon.cheesysun.com/pictures/archipelago.jpg',
      'percentage': '20%',
    },
    'Pulau Tioman': {
      'addInfo': 'Most beautiful island',
      'imageUrl':
          'https://ocean-hackathon.cheesysun.com/pictures/barnacles.jpg',
      'percentage': '30%',
    },
    'Pulau Redang': {
      'addInfo': 'Most beautiful island',
      'imageUrl':
          'https://ocean-hackathon.cheesysun.com/pictures/beach close up with trees.jpg',
      'percentage': '20%',
    },
    'Pulau Penang': {
      'addInfo': 'Most beautiful island in Malaysia',
      'imageUrl':
          'https://ocean-hackathon.cheesysun.com/pictures/beach_hammock.jpg',
      'percentage': '30%',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EhpHorizontalSection(
          sectionTitle: 'Promotions',
          padding: EhpPadding.h16,
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              var entry = promotionPlaces.entries.elementAt(index);
              var placeName = entry.key; // Title from the map's key
              var description =
                  entry.value['addInfo']; // Description from the map's value
              var imageUrl = entry.value['imageUrl'];
              var percentage = entry.value['percentage'];

              return Stack(children: [
                EhpColoredCard(
                  cardHeight: 130,
                  cardWidth: 260,
                  borderRadius: 5,
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.35,
                        padding: EhpPadding.a16, // Adjust padding as needed
                        decoration: BoxDecoration(
                          color: Colors.black
                              .withOpacity(0.5), // Semi-transparent black
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the start
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center text vertically
                          children: [
                            EhpSizedBox.h4,
                            EhpText(
                              placeName, // Replace with your actual place name
                              maxLines: 1,
                              textStyle:
                                  EhpTextStyle.h3.copyWith(color: Colors.white),
                            ),
                            EhpSizedBox.h4,
                            EhpText(
                              description, // Any additional information
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                              textStyle: EhpTextStyle.b4.copyWith(
                                color: Colors.white.withOpacity(0.75),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        width: 45,
                        height: 45,
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.black38,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        padding: EhpPadding.a8,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Center(
                          child: EhpText(
                            '$percentage off',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ]);
            },
          ),
        ),
      ],
    );
  }
}
