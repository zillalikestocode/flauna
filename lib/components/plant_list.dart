import 'package:flauna/components/plant_item.dart';
import 'package:flauna/models/plant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class PlantList extends StatelessWidget {
  const PlantList({super.key, this.category = ""});
  final String category;

  Future<List<Plant>> fetchPlants() async {
    final String plantsJson =
        await rootBundle.loadString("assets/data/plant_list.json");
    final List<Plant> plantList = plantFromJson(plantsJson);

    return plantList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPlants(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!
                    .where((element) =>
                        category != "" ? element.category == category : true)
                    .length,
                separatorBuilder: (context, index) => Gap(15),
                itemBuilder: (context, index) {
                  return PlantItem(
                    key: ObjectKey(snapshot.data!
                        .where((element) => category != ""
                            ? element.category == category
                            : true)
                        .toList()[index]
                        .name),
                    plant: snapshot.data!
                        .where((element) => category != ""
                            ? element.category == category
                            : true)
                        .toList()[index],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
          }

          return CircularProgressIndicator();
        });
  }
}

// class PlantList extends StatefulWidget {
  

//   @override
//   State<PlantList> createState() => _PlantListState();
// }

// class _PlantListState extends State<PlantList> {

//   @override
//   Widget build(BuildContext context) {
//     // return ListView.separated(
//     //   padding: const EdgeInsets.symmetric(horizontal: 20),
//     //   scrollDirection: Axis.horizontal,
//     //   physics: BouncingScrollPhysics(),
//     //   itemCount: 9,

//     //   separatorBuilder: (context, index) => Gap(15),
//     //   itemBuilder: (context, index) {
//     //     return PlantItem();
//     //   },
//     // );

//     return 
//   }
// }
