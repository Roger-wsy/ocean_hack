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
                EhpText(
                  '👋 Hello! John',
                  textStyle: EhpTextStyle.h2.copyWith(
                    color: Colors.white,
                  ),
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
