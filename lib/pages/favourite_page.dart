import 'dart:convert';

import 'package:flauna/components/popular_item.dart';
import 'package:flauna/models/plant.dart';
import 'package:flauna/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static List<String>? favouriteList;

  Future<List<String>?> _getFavorites() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? receivedPlantList =
        await prefs.getStringList("favorites");
    return receivedPlantList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        Text(
          "Favorites",
          style: TextStyles.h3.copyWith(fontWeight: FontWeight.w700),
        ),
        Gap(10),
        FutureBuilder(
            future: _getFavorites(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      // physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const Gap(10),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final Plant plant =
                            Plant.fromJson(jsonDecode(snapshot.data![index]));
                        return PopularItem(plant: plant);
                      });
                } else if (snapshot.hasError) {}
              }

              return Center(
                child: Text("No favourites yet"),
              );
            })
      ],
    ));
  }
}
