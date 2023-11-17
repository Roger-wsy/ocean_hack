import 'package:flutter/material.dart';

class EhpCenteredLoading extends StatelessWidget {
  EhpCenteredLoading({
    super.key,
    this.factor = 1.3,
  });

  double factor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / factor,
      child: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
