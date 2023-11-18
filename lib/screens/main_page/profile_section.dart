import 'package:flutter/material.dart';

import '../../components/ehp_text.dart';
import '../../constant/constant.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    this.imageUrl =
        'https://ocean-hackathon.cheesysun.com/pictures/charmander.jpg',
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: EhpPadding.containerCenter9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    EhpText(
                      '👋 Hello! John',
                      textStyle: EhpTextStyle.h2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    EhpSizedBox.w16,
                    Container(
                      padding: EhpPadding.a4,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: Colors.white),
                          color: Colors.white),
                      child: EhpText(
                        'Beginner',
                        fontSize: 12,
                        textAlign: TextAlign.center,
                        padding: EhpPadding.h4,
                        fontWeight: FontWeight.bold,
                        color: ehpPrimaryColor,
                      ),
                    ),
                  ],
                ),
                EhpSizedBox.h4,
                EhpText(
                  'What would you like to do today?',
                  textStyle: EhpTextStyle.b3.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 24,
            ),
          ],
        ),
      ),
    );
  }
}
