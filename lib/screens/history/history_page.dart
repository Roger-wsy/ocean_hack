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
                      'https://ocean-hackathon.cheesysun.com/pictures/charmander.jpg',
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
                      'https://ocean-hackathon.cheesysun.com/pictures/charmander.jpg',
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

feedbackDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (context, setState) {
              bool _isHaveRecycleBinChanged = false;
              bool isHaveRecycleBin = false;
              bool _isHaveRuleAndRegulationChanged = false;
              bool isHaveRuleAndRegulation = false;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  EhpText(
                    'Feedback',
                    textAlign: TextAlign.center,
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
                        itemBuilder: (context, _) => Icon(
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
                            title: "Does the place have enough recycle bin?",
                            initialPosition: isHaveRecycleBin,
                            values: const ["Yes", "No"],
                            onToggleCallback: (value) {
                              _isHaveRecycleBinChanged = true;
                              isHaveRecycleBin = !isHaveRecycleBin;
                            },
                          );
                        },
                      ),
                      FormBuilderField(
                        name: FeedbackConstant.haveRuleAndRegulation,
                        builder: (field) {
                          return EhpToggleSwitchTitle(
                            title:
                                "Does the place have good rules and regulations",
                            initialPosition: isHaveRuleAndRegulation,
                            values: const ["Yes", "No"],
                            onToggleCallback: (value) {
                              _isHaveRuleAndRegulationChanged = true;
                              isHaveRuleAndRegulation =
                                  !isHaveRuleAndRegulation;
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
                    ],
                  )),
                ],
              );
            },
          ),
        );
      });
}
