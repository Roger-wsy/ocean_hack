import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpSegmentedTab extends StatefulWidget {
  EhpSegmentedTab({
    super.key,
    this.options = const [],
    this.onChange,
  });

  List<String> options;
  Function(int)? onChange;

  @override
  State<EhpSegmentedTab> createState() => _EhpSegmentedTabState();
}

class _EhpSegmentedTabState extends State<EhpSegmentedTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EhpPadding.containerCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          widget.options.length,
          (index) => GestureDetector(
            onTap: () => {
              setState(() {
                selectedIndex = index;
                widget.onChange!(selectedIndex);
              })
            },
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: selectedIndex == index ? Colors.black : ehpBackground,
              ),
              duration: const Duration(milliseconds: 250),
              curve: Curves.linear,
              child: EhpText(
                widget.options[index],
                fontWeight: selectedIndex == index
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: selectedIndex == index ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
