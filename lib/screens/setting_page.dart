import 'package:flutter/material.dart';

import '../components/_index.dart';
import '../constant/constant.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EhpSliverAppBar(
            appBarTitle: 'Settings',
            showBackButton: false,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                EhpProfileAvartarTile(
                  logOutFunction: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return EhpAlertDialog(
                            title: 'Logging out',
                            primaryText: 'Log out',
                            secondaryText: 'Cancel',
                            primaryCallback: () {
                            },
                            secondaryCallback: () {
                              Navigator.of(context).pop();
                            },
                            child: EhpText('Are you sure you want to log out?'),
                          );
                        });
                  },
                  userImage: 'https://ocean-hackathon.cheesysun.com/pictures/charmander.jpg',
                  userName: 'John Doe',
                  userEmail: 'johndoe@gmail.com',
                ),
                const EhpSeperator(
                  height: 16,
                ),
                _buildSettingSection(
                  context,
                  sectionName: 'My Account',
                  tiles: [
                    EhpProfileTile(
                      title: 'Edit Your Profile',
                      content: 'Edit your profile information',
                      onTap: () {},
                    ),
                    EhpProfileTile(
                      showDivider: false,
                      title: 'Account Security',
                      content: 'Manage your account security',
                      onTap: () {},
                    ),
                  ],
                ),
                _buildSettingSection(
                  context,
                  sectionName: 'Support',
                  isLastSection: true,
                  tiles: [
                    EhpProfileTile(
                      title: 'Help Centre',
                      content: 'Email us your enquiries',
                      onTap: () {},
                    ),
                    EhpProfileTile(
                      title: 'Rules and Regulations',
                      content: 'Read our rules and regulations',
                      onTap: () {},
                    ),
                    EhpProfileTile(
                      title: 'About Us',
                      content: 'Learn more about us',
                      onTap: () {},
                    ),
                    EhpProfileTile(
                      showDivider: false,
                      title: 'Contact Us',
                      content: 'Contact us via email or phone',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingSection(
    BuildContext context, {
    String sectionName = "Section Name",
    bool isLastSection = false,
    List<EhpProfileTile> tiles = const [],
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EhpText(
          sectionName,
          padding: EhpPadding.containerCenter4,
          textStyle: EhpTextStyle.b4.copyWith(
            color: Theme.of(context).disabledColor,
          ),
        ),
        EhpSizedBox.h4,
        Column(
          children: tiles,
        ),
        if (!isLastSection) const EhpSeperator()
      ],
    );
  }
}
