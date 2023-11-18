import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:ocean_hack/components/_index.dart';
import 'package:ocean_hack/constant/constant.dart';
import 'package:ocean_hack/routes/route_name.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../bottom_nav/bottom_navigation.dart';

class FlipCardTutorialPage extends StatelessWidget {
  FlipCardTutorialPage({super.key});

  final PageController _controller = PageController();
  final GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  final GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  final GlobalKey<FlipCardState> cardKey3 = GlobalKey<FlipCardState>();
  final GlobalKey<FlipCardState> cardKey4 = GlobalKey<FlipCardState>();
  final GlobalKey<FlipCardState> cardKey5 = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: <Widget>[
                TutorialFlipCard(
                  key: cardKey1,
                  front: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/1.png'),
                    ],
                  ),
                  back: Image.asset('assets/2.png'),
                ), // First tutorial page
                TutorialFlipCard(
                  key: cardKey2,
                  front: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/3.png'),
                    ],
                  ),
                  back: Image.asset('assets/4.png'),
                ),
                TutorialFlipCard(
                  key: cardKey3,
                  front: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/5.png'),
                    ],
                  ),
                  back: Image.asset('assets/6.png'),
                ),
                TutorialFlipCard(
                  key: cardKey4,
                  front: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/7.png'),
                    ],
                  ),
                  back: Image.asset('assets/8.png'),
                ),
                TutorialFlipCard(
                  key: cardKey5,
                  front: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/9.png'),
                    ],
                  ),
                  back: Image.asset('assets/10.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/11.png'),
                    EhpDuoButton(
                      primaryText: 'Read Detail',
                      primaryCallback: () =>
                          Navigator.pushNamed(context, RouteName.educationPage),
                      secondaryText: 'Home',
                      secondaryCallback: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.navbar,
                          arguments: BottomNavigationArgs(selectedIndex: 0),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          // Add the SmoothPageIndicator here
          SmoothPageIndicator(
            controller: _controller, // PageController
            count: 6, // Number of pages
            effect: const ExpandingDotsEffect(
              dotColor: Colors.black,
              activeDotColor: ehpPrimaryColor,
            ), // Your choice of effect
          ),
          EhpSizedBox.h48,
          // EhpSingleButton(
          //   color: Colors.white,
          //   backgroundColor: ehpLightPrimaryColor,
          //   fontColor: ehpLightPrimaryColor,
          //   text: 'Next',
          //   onPressed: () {},
          // )
        ],
      ),
    );
  }
}

class TutorialFlipCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget front;
  final Widget back;
  Key? flipKey;

  TutorialFlipCard({
    Key? key,
    this.backgroundColor = Colors.white,
    required this.front,
    required this.back,
    this.flipKey, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: FlipCard(
        key: flipKey, // Assign the flipKey to FlipCard
        front: front,
        back: back,
      ),
    );
  }
}
