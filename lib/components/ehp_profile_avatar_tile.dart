import 'package:flutter/material.dart';
import 'package:ocean_hack/constant/constant.dart';
import '_index.dart';

class EhpProfileAvartarTile extends StatelessWidget {
  EhpProfileAvartarTile({
    Key? key,
    this.userImage = '',
    this.userName,
    this.userEmail = '',
    this.logOutFunction,
    this.padding = EhpPadding.containerCenter,
  }) : super(key: key);

  String userImage;
  String? userName;
  String? userEmail;
  VoidCallback? logOutFunction;
  EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
              radius: 30,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EhpText(
                  userName,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                EhpText(
                  userEmail,
                  fontSize: 16,
                  color: ehpGray,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              levelDialog(context);
            },
            child: Container(
              padding: EhpPadding.a8,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: Colors.green)),
              child: EhpText(
                'Beginner',
                fontSize: 12,
                textAlign: TextAlign.center,
                padding: EhpPadding.h4,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          IconButton(
            onPressed: logOutFunction,
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

levelDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        width: 100, // Fixed width for the icon
                        child: const Icon(
                          Icons.shield,
                          color: Colors.green,
                          size: 70,
                        ),
                      ),
                      Expanded(
                        // Expanded to fill the remaining space
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EhpText(
                              'Beginner',
                              textStyle: EhpTextStyle.h1,
                            ),
                            EhpText(
                              'Score 1000',
                              textStyle: EhpTextStyle.b1,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  // Repeat for other rows
                  Row(
                    children: [
                      Container(
                        width: 100,
                        padding: const EdgeInsets.fromLTRB(
                            0, 8, 0, 8), // Same fixed width for consistency
                        child: const Icon(
                          Icons.shield,
                          color: Colors.orange,
                          size: 70,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EhpText(
                              'Intermediate',
                              textStyle: EhpTextStyle.h1,
                            ),
                            EhpText(
                              'Score 3000',
                              textStyle: EhpTextStyle.b1,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        width: 100, // Maintain consistent width
                        child: const Icon(
                          Icons.shield,
                          color: Colors.red,
                          size: 70,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EhpText(
                              'Advanced',
                              textStyle: EhpTextStyle.h1,
                            ),
                            EhpText(
                              'Score 5000',
                              textStyle: EhpTextStyle.b1,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        );
      });
}
