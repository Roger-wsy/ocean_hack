import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';

class EhpCircularButton extends StatefulWidget {
  EhpCircularButton({
    super.key,
    this.icon = Icons.favorite,
    this.onPressed,
    this.active = false,
  });

  IconData icon;
  Function? onPressed;
  bool? active;

  @override
  State<EhpCircularButton> createState() => _EhpCircularButtonState();
}

class _EhpCircularButtonState extends State<EhpCircularButton> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _active = !_active;
        });
        widget.onPressed!(_active);
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: ehpSecondaryColor,
        foregroundColor: ehpBackground,
      ),
      child: widget.active!
          ? Icon(
              widget.icon,
              color: Theme.of(context).primaryColor,
              size: 18,
            )
          : Icon(
              widget.icon,
              color: ehpGray,
              size: 18,
            ),
    );
  }
}
