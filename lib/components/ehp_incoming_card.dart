import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../constant/constant.dart';
import 'ehp_text.dart';

class EhpIncomingCard extends StatefulWidget {
  EhpIncomingCard({
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
  State<EhpIncomingCard> createState() => _EhpIncomingCardState();
}

class _EhpIncomingCardState extends State<EhpIncomingCard> {
  bool isChecklistVisible = false;

  @override
  Widget build(BuildContext context) {
    List<String> checkList = [
      'Bring sunscreen.',
      'Bring reusuable container and utensils.',
      'Bring portable waste bag.'
    ];
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecklistVisible =
              !isChecklistVisible; // Toggle the visibility state
        });
        if (widget.onTap != null) {
          widget.onTap!(); // Call the original onTap function if it's not null
        }
      },
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
                          bottomLeft: Radius.circular(15)),
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
                        EhpSizedBox.h4,
                        Container(
                          padding: EhpPadding.a4,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: ehpPrimaryColor),
                              color: ehpPrimaryColor,
                              boxShadow: customShadow),
                          child: EhpText(
                            'Checklist',
                            fontSize: 12,
                            textAlign: TextAlign.center,
                            padding: EhpPadding.a4,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isChecklistVisible)
            Container(
              padding: EhpPadding.h16,
              child: FormBuilderCheckboxGroup<String>(
                name: 'checkList',
                validator: FormBuilderValidators.required(),
                options: checkList
                    .map<FormBuilderFieldOption<String>>(
                      (String data) => FormBuilderFieldOption<String>(
                        value: data,
                        child: EhpText(
                          data,
                          textStyle: const TextStyle(
                              fontSize: 14), // Smaller font size
                        ),
                      ),
                    )
                    .toList(growable: false),
                orientation: OptionsOrientation.vertical,
                // Customizing the checkbox appearance
                controlAffinity:
                    ControlAffinity.leading, // Positioning checkbox on the left
                decoration: const InputDecoration(
                  border: InputBorder.none, // Remove border if not needed
                ),
                // Adjusting checkbox size (if possible based on your theme/custom widgets)
              ),
            ),
        ],
      ),
    );
  }
}
