// import 'package:flutter/material.dart';
// import 'package:mobile_frontend/components/ehp_index.dart';
// import 'package:mobile_frontend/constant/constant.dart';

// class EhpHorizontalDateList extends StatefulWidget {
//   const EhpHorizontalDateList({super.key});

//   @override
//   State<EhpHorizontalDateList> createState() => _EhpHorizontalDateListState();
// }

// class _EhpHorizontalDateListState extends State<EhpHorizontalDateList> {
//   DateTime currentDate = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 70,
//       child: ListView.builder(
//         itemCount: 10,
//         scrollDirection: Axis.horizontal,
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EhpPadding.l8,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.red,
//               ),
//               child: Column(
//                 children: [
//                   EhpText('Day'),
//                   EhpSizedBox.h8,
//                   EhpText('Date'),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
