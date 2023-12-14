import 'package:meta/meta.dart';
import 'dart:convert';

List<Plant> plantFromJson(String str) =>
    List<Plant>.from(json.decode(str).map((x) => Plant.fromJson(x)));

String plantToJson(List<Plant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plant {
  final String name;
  final String image;
  final String price;
  final String category;

  Plant({
    required this.name,
    required this.image,
    required this.price,
    required this.category,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        name: json["name"],
        image: json["image"],
        price: json["price"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "price": price,
        "category": category,
      };
}
