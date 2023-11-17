import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constant/constant.dart';
import '_index.dart';

class EhpSelectHospitalButton extends StatelessWidget {
  EhpSelectHospitalButton({
    super.key,
    this.svgPath,
    this.hospitalName,
    this.onTap,
  });

  String? svgPath;
  String? hospitalName;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EhpPadding.containerCenter,
          decoration: BoxDecoration(
            color: ehpSecondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgPath ?? 'assets/med.svg',
              ),
              const SizedBox(width: 5),
              Expanded(
                child: EhpText(
                  hospitalName,
                  maxLines: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  padding: EhpPadding.a16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
