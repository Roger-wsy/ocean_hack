import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';

class EhpToggleSwitch extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;
  final double widthFactor;
  final double heightFactor;
  final EdgeInsets padding;
  final double activatedButtonWidthFactor;
  bool initialPosition;

  EhpToggleSwitch({
    super.key,
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
    this.widthFactor = 0.55,
    this.heightFactor = 0.13,
    this.initialPosition = true,
    this.padding = EhpPadding.zero,
    this.activatedButtonWidthFactor = 0.33,
  });
  @override
  _EhpToggleSwitchState createState() => _EhpToggleSwitchState();
}

class _EhpToggleSwitchState extends State<EhpToggleSwitch> {
  double width = 300;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: SizedBox(
        width: width * widget.widthFactor,
        height: width * widget.heightFactor,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                widget.initialPosition = !widget.initialPosition;
                var index = 0;
                if (!widget.initialPosition) {
                  index = 1;
                }
                widget.onToggleCallback(index);
                setState(() {});
              },
              child: Container(
                width: width * widget.widthFactor,
                height: width * widget.heightFactor,
                decoration: ShapeDecoration(
                  color: widget.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    widget.values.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Text(
                        widget.values[index],
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xAA000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              curve: Curves.decelerate,
              alignment: widget.initialPosition
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                width: width * widget.activatedButtonWidthFactor,
                height: width * 0.13,
                decoration: ShapeDecoration(
                  color: widget.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.1),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.initialPosition ? widget.values[0] : widget.values[1],
                  style: TextStyle(
                    fontSize: width * 0.045,
                    color: widget.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
