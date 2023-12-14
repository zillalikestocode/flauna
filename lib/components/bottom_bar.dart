import 'package:flauna/providers/bottom_navigation.dart';
import 'package:flauna/utils/styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  // void changePage(context, index) {
  //   ;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: Colors.grey.shade400, width: 0.5))),
      height: 60,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 4),
      child: Stack(children: [
        Align(
            alignment: FractionalOffset(0.5, -4.5),
            child: GestureDetector(
              child: Container(
                  // padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade400, width: 0.5),
                      borderRadius: BorderRadius.circular(999)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      FluentIcons.qr_code_28_filled,
                      color: accentColor,
                    ),
                  )),
            )),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<BottomNavigationBarProvider>().setIndex(0);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Icon(
                    FluentIcons.home_24_regular,
                    size: 30,
                    color: context
                                .watch<BottomNavigationBarProvider>()
                                .currentIndex ==
                            0
                        ? accentColor
                        : Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<BottomNavigationBarProvider>().setIndex(1);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Icon(
                    FluentIcons.heart_24_regular,
                    size: 30,
                    color: context
                                .watch<BottomNavigationBarProvider>()
                                .currentIndex ==
                            1
                        ? accentColor
                        : Colors.black,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Icon(
                    FluentIcons.cart_24_regular,
                    size: 30,
                  ),
                ),
              ),
              GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Icon(
                    FluentIcons.person_24_regular,
                    size: 30,
                  ),
                ),
              ),
            ]),
      ]),
    );
  }
}
