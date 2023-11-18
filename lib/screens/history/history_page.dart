import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ocean_hack/components/_index.dart';
import 'package:ocean_hack/components/ehp_history_card.dart';
import 'package:ocean_hack/constant/constant.dart';
import 'package:ocean_hack/screens/history/constant.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                EhpHistoryCard(
                  title: 'Pulau Redang',
                  ratings: 4.7,
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  imageUrl:
                      'https://ocean-hackathon.cheesysun.com/pictures/sailboat.jpg',
                  onTap: () {
                    feedbackDialog(context);
                  },
                ),
                EhpHistoryCard(
                  title: 'Pulau Redang',
                  ratings: 4.7,
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  imageUrl:
                      'https://ocean-hackathon.cheesysun.com/pictures/coconut.jpg',
                  onTap: () {
                    feedbackDialog(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

feedbackDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (context, setState) {
              bool _isEnergyEfficientChanged = false;
              bool isEnergyEfficient = false;
              bool _isRecycleMaterialChanged = false;
              bool isRecycleMaterial = false;
              bool _isEcoFriendlyChanged = false;
              bool isEcoFriendly = false;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  EhpText(
                    'Feedback',
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  FormBuilder(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EhpText(
                        'Ratings',
                        fontSize: 20,
                        padding: EhpPadding.h16,
                      ),
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EhpPadding.h8,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      FormBuilderField(
                        name: FeedbackConstant.haveRecycleBin,
                        builder: (field) {
                          return EhpToggleSwitchTitle(
                            title:
                                "Was the hotel/activity equipped with energy-efficient lighting and appliances?",
                            initialPosition: isEnergyEfficient,
                            values: const ["Yes", "No"],
                            onToggleCallback: (value) {
                              _isEnergyEfficientChanged = true;
                              isEnergyEfficient = !isEnergyEfficient;
                            },
                          );
                        },
                      ),
                      FormBuilderField(
                        name: FeedbackConstant.haveRuleAndRegulation,
                        builder: (field) {
                          return EhpToggleSwitchTitle(
                            title:
                                "Did the hotel/activity provide recycling bins for guests to dispose of recyclable materials? ",
                            initialPosition: isRecycleMaterial,
                            values: const ["Yes", "No"],
                            onToggleCallback: (value) {
                              _isRecycleMaterialChanged = true;
                              isRecycleMaterial = !isRecycleMaterial;
                            },
                          );
                        },
                      ),
                      FormBuilderField(
                        name: FeedbackConstant.haveRuleAndRegulation,
                        builder: (field) {
                          return EhpToggleSwitchTitle(
                            title:
                                "Were eco-friendly toiletries, such as biodegradable soaps and shampoos, provided?",
                            initialPosition: isEcoFriendly,
                            values: const ["Yes", "No"],
                            onToggleCallback: (value) {
                              _isEcoFriendlyChanged = true;
                              isEcoFriendly = !isEcoFriendly;
                            },
                          );
                        },
                      ),
                      EhpTextFieldTitle(
                        name: FeedbackConstant.feedback,
                        titleName: 'Tell us your feeback',
                        placeHolder: 'Overall Feedback',
                        onChanged: (_) {},
                      ),
                      EhpSizedBox.h24,
                      EhpDuoButton(
                        primaryText: 'Share',
                        secondaryText: 'Submit',
                        primaryCallback: () {},
                        secondaryCallback: () {},
                      )
                    ],
                  )),
                ],
              );
            },
          ),
        );
      });
}
