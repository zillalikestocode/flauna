import 'package:flauna/models/plant.dart';
import 'package:flutter/services.dart';

class Helper {
  Future<List<Plant>> getPlants() async {
    final data = await rootBundle.loadString("assets/data/plant_list.json");

    final plants = plantFromJson(data);

    return plants;
  }
}
