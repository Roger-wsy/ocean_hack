import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import 'package:ocean_hack/utils/date_utils.dart';
import '_index.dart';

class EhpAppointmentCard extends StatelessWidget {
  EhpAppointmentCard({
    super.key,
    this.onTap,
    this.appointmentDate,
    this.appointmentTime,
    this.doctorName,
    this.department,
    this.cardColor = const Color(0xFF1C6BA4),
    this.innerCardColor = const Color(0xFFDCEDF9),
    this.colorIndex = 0,
  });

  final Color? cardColor;
  final Color? innerCardColor;
  final DateTime? appointmentDate;
  final DateTime? appointmentTime;
  final String? doctorName;
  final String? department;
  final VoidCallback? onTap;
  final int? colorIndex;

  @override
  Widget build(BuildContext context) {
    return EhpColoredCard(
      onTap: onTap,
      cardWidth: 280,
      cardHeight: 130,
      cardColor: cardColorDict[0][colorIndex],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: EhpPadding.a16,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ],
                    color: cardColorDict[1][colorIndex],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EhpPadding.a16,
                    child: Column(
                      children: [
                        EhpText(
                          appointmentDate?.day.toString(),
                          textStyle: EhpTextStyle.h2.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        EhpSizedBox.h8,
                        EhpText(
                          getDayOfWeek(appointmentDate),
                          textStyle: EhpTextStyle.b4.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EhpText(
                    getTime(appointmentTime),
                    textStyle: EhpTextStyle.b3.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  EhpSizedBox.h8,
                  EhpText(
                    doctorName,
                    textStyle: EhpTextStyle.h2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  EhpSizedBox.h8,
                  EhpText(
                    department,
                    textStyle: EhpTextStyle.b4.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  var cardColorDict = [
    {
      0: const Color(0xFF1C6BA4),
      1: const Color(0xFF9D4C6C),
      2: const Color(0xFFE09F1F),
    },
    {
      0: const Color(0xFFD6F6FF),
      1: const Color(0xFFF2E3E9),
      2: const Color(0xFFFAF0DB),
    },
  ];
}
