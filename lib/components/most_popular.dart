import 'package:flauna/components/popular_item.dart';
import 'package:flauna/models/plant.dart';
import 'package:flauna/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({super.key});

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  Future<List<Plant>> fetchPlants() async {
    final String plantsJson =
        await rootBundle.loadString("assets/data/plant_list.json");
    final List<Plant> plantList = plantFromJson(plantsJson);

    return plantList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Most Popular Items",
                  style: TextStyles.h4.copyWith(fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  child: Text("View All",
                      style: TextStyles.norm.copyWith(
                          color: accentColor, fontWeight: FontWeight.w600)),
                )
              ],
            ),
            Gap(10),
            FutureBuilder(
                future: fetchPlants(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const Gap(10),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => PopularItem(
                                plant: snapshot.data![index],
                              ));
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    }
                  }

                  return CircularProgressIndicator();
                })
          ],
        ));
  }
}
