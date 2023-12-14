import 'dart:convert';

import 'package:flauna/models/plant.dart';
import 'package:flauna/utils/styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlantItem extends StatefulWidget {
  const PlantItem({super.key, required this.plant});

  final Plant plant;

  @override
  State<PlantItem> createState() => _PlantItemState();
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var w = size.width;
    var h = size.height;

    path.lineTo(0, h);
    path.lineTo(w - 5, h - 10);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _PlantItemState extends State<PlantItem> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _liked = false;

  Future<void> _initLiked() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? favorites = prefs.getStringList('favorites');

    if (favorites!.contains(jsonEncode(widget.plant))) {
      setState(() {
        _liked = true;
      });
    }
  }

  Future<void> _favouritesAction() async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? formalFavorites =
        await prefs.getStringList("favorites");
    if (_liked) {
      formalFavorites!.remove(jsonEncode(widget.plant));
      await prefs.setStringList("favorites", formalFavorites);
      setState(() {
        _liked = false;
      });
    } else {
      if (formalFavorites != null) {
        formalFavorites.add(jsonEncode(widget.plant));
        await prefs.setStringList("favorites", formalFavorites);
        setState(() {
          _liked = true;
        });
      } else {
        await prefs.setStringList("favorites", [jsonEncode(widget.plant)]);
        setState(() {
          _liked = true;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initLiked();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 200,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Container(
          child: Stack(
            children: [
              ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(
                  color: Colors.grey.shade200,
                  height: 200,
                ),
              ),
              Center(child: Image.asset("assets/images/${widget.plant.image}")),
              Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () => _favouritesAction(),
                    child: Container(
                      child: Icon(
                        _liked
                            ? FluentIcons.heart_12_filled
                            : FluentIcons.heart_12_regular,
                        color: accentColor,
                        size: 30,
                      ),
                    ),
                  ))
            ],
          ),
        )),
        const Gap(5),
        Text(
          widget.plant.name,
          style: TextStyles.h4.copyWith(fontSize: 18),
        ),
        const Gap(3),
        Text(
          "${widget.plant.category} plant",
          style: TextStyles.norm.copyWith(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "\$ ${widget.plant.price}",
              style: TextStyles.norm
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            GestureDetector(
              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: accentColor),
                  child: const Icon(
                    FluentIcons.cart_24_regular,
                    color: Colors.white,
                  )),
            )
          ],
        )
      ]),
    );
  }
}
