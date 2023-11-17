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
