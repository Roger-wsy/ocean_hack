import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ocean_hack/components/_index.dart';
import 'package:ocean_hack/components/ehp_sliver_app_bar.dart';
import 'package:ocean_hack/constant/constant.dart';
import 'package:ocean_hack/routes/route_name.dart';

class SuceessCheckoutPage extends StatefulWidget {
  const SuceessCheckoutPage({super.key});

  @override
  State<SuceessCheckoutPage> createState() => _SuceessCheckoutPageState();
}

class _SuceessCheckoutPageState extends State<SuceessCheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EhpSliverAppBar(
            appBarTitle: 'Success',
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  Lottie.asset('assets/success.json', height: 350, width: 350),
                  EhpSizedBox.h20,
                  EhpText(
                    'Succesfully Checkout',
                    textStyle: EhpTextStyle.h1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: EhpSingleButton(
        padding: const EdgeInsets.fromLTRB(48, 0, 16, 0),
        text: 'Read some guidelines before you go 😊',
        onPressed: () {
          Navigator.pushNamed(
            context,
            RouteName.flipCard,
          );
        },
      ),
    );
  }
}
