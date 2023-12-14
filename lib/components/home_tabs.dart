import 'package:flauna/components/plant_list.dart';
import 'package:flauna/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> with TickerProviderStateMixin {
  int selectedtabIndex = 0;
  late final TabController _tabController =
      TabController(length: 4, vsync: this, initialIndex: selectedtabIndex);

  void _initTabController() {
    _tabController.addListener(() {
      // updated index and calls the set state
      // to switch the content of the tab based on the index clicked
      selectedtabIndex = _tabController.index;
      setState(() {
        _tabController.index;
      });
    });
  }

  @override
  void initState() {
    _initTabController();
    super.initState();
  }

  final List<Widget> _tabs = [
    const PlantList(),
    const PlantList(category: "indoor"),
    const PlantList(category: "outdoor"),
    const PlantList(category: "office"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: accentColor,
            unselectedLabelColor: Colors.grey.shade500,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyles.norm.copyWith(fontWeight: FontWeight.w600),
            enableFeedback: false,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            dividerHeight: 0,
            splashFactory: NoSplash.splashFactory,
            overlayColor: null,
            tabs: const [
              Tab(text: "All"),
              Tab(text: "Indoor"),
              Tab(text: "Outdoor"),
              Tab(text: "Office"),
              // Tab(text: "Garden"),
            ],
            controller: _tabController,
          ),
        ),
        Container(
          height: 300,
          child: _tabs[selectedtabIndex],
        )
      ]),
    );
  }
}
