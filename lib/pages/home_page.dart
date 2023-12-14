import 'package:flauna/components/home_tabs.dart';
import 'package:flauna/components/most_popular.dart';
import 'package:flauna/utils/styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
          child: ListView(
        // shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10),
                Text("A beautiful morning☀️",
                    style: TextStyles.h4.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
                const Gap(2),
                Text(
                  "Find your favorite plants here",
                  style: TextStyles.norm,
                ),
                const Gap(15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      const Icon(FluentIcons.search_28_filled),
                      const Gap(10),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search Items",
                          hintStyle: TextStyles.norm,
                          border: InputBorder.none,
                        ),
                      )),
                      GestureDetector(
                        child: Icon(FluentIcons.filter_28_filled),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Gap(10),
          const HomeTabs(),
          const Gap(20),
          const MostPopular()
        ],
      )),
    );
    ;
  }
}
