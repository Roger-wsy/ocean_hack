import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ocean_hack/components/_index.dart';
import 'package:ocean_hack/components/ehp_sliver_app_bar.dart';
import 'package:ocean_hack/constant/constant.dart';

import '../education/education_selection.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> educationList = {
      'Claim \$150 Gift Price!':
          'https://ocean-hackathon.cheesysun.com/pictures/v3.jpg',
      'Participate to win 120 euro!':
          'https://ocean-hackathon.cheesysun.com/pictures/v2.jpg',
      'Claim voucher to receive the gift of a getaway!':
          'https://ocean-hackathon.cheesysun.com/pictures/v1.jpg',
    };
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EhpSliverAppBar(
            showBackButton: false,
            appBarTitle: 'Wallet',
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              Lottie.asset(
                'assets/trophy.json', // Your Lottie URL
                width: 200, // Width of the Lottie animation
                height: 200, // Height of the Lottie animation
                repeat: true, // Whether to loop the animation
                animate: true, // Whether to play the animation
              ),
              EhpText(
                '1034 points',
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),
              EhpSizedBox.h28,
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 80,
                decoration: BoxDecoration(
                  color: ehpLightPrimaryColor5,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  boxShadow: customShadow,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: EhpText(
                          'Share and Invite your friends to win more!',
                          padding: EhpPadding.a16,
                          textAlign: TextAlign.center,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          maxLines: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.telegram,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ]),
              )
            ]),
          ),
          SliverToBoxAdapter(
            child: Column(children: [
              EhpSizedBox.h28,
              EhpText(
                'Vouchers',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ]),
          ),
          SliverPadding(
            padding: EhpPadding.a16,
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var entry = educationList.entries.elementAt(index);
                  var title = entry.key; // Title from the map's key
                  var imageUrl = entry.value;
                  return GestureDetector(
                    onTap: () {
                      // Navigator.popAndPushNamed(
                      //   context,
                      //   RouteName.acpQuestionnaireWelcomePage,
                      //   arguments: ACPQuestionnaireWelcomePageArgs(
                      //     acpQuestionnaire: acpQuestionnaireList[index],
                      //   ),
                      // );
                    },
                    child: EducationCard(
                      title: title,
                      imageUrl: imageUrl,
                    ),
                  );
                },
                childCount: educationList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
