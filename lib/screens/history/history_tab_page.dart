import 'package:flutter/material.dart';
import 'package:ocean_hack/screens/history/favorite_page.dart';
import 'package:ocean_hack/screens/history/history_page.dart';

import '../../components/_index.dart';

class HistoryTabPage extends StatefulWidget {
  const HistoryTabPage({super.key, this.tabIndex = 0});

  final int tabIndex;

  @override
  State<HistoryTabPage> createState() => _HistoryTabPageState();
}

class _HistoryTabPageState extends State<HistoryTabPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.tabIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          EhpSliverAppBar(
            appBarTitle: 'History',
            showBackButton: false,
            pinAppBar: true,
            floatAppBar: true,
            bottom: TabBar(
              indicatorColor: Colors.black,
              labelPadding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
              controller: _tabController,
              tabs: [
                EhpText(
                  "History",
                  textAlign: TextAlign.center,
                ),
                EhpText(
                  "Favorite",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: const [
            HistoryPage(),
            FavoritePage(),
          ],
        ),
      ),
    );
  }
}
