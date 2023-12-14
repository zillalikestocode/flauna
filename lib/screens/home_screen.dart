import 'package:flauna/components/bottom_bar.dart';
import 'package:flauna/pages/favourite_page.dart';
import 'package:flauna/pages/home_page.dart';
import 'package:flauna/providers/bottom_navigation.dart';
import 'package:flauna/utils/styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = const [HomePage(), FavouritePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Flauna",
            style:
                TextStyles.logoFont.copyWith(color: accentColor, fontSize: 28),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
                child: Icon(
              FluentIcons.alert_16_regular,
              size: 32,
            )),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigation(),
      body: _pages[context.watch<BottomNavigationBarProvider>().currentIndex],
    );
  }
}
