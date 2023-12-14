import 'package:flauna/components/plant_item.dart';
import 'package:flauna/models/plant.dart';
import 'package:flauna/utils/styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PopularItem extends StatefulWidget {
  const PopularItem({super.key, required this.plant});

  final Plant plant;

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        SizedBox(
          width: 90,
          child: Stack(
            children: [
              ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(
                  color: Colors.grey.shade200,
                  height: 200,
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/images/${widget.plant.image}",
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        const Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.plant.name,
              style: TextStyles.h4
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Text(
              "${widget.plant.category} Plant",
              style: TextStyles.norm.copyWith(
                  color: Colors.grey.shade600, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              "\$ ${widget.plant.price}",
              style: TextStyles.h4,
            )
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: accentColor, borderRadius: BorderRadius.circular(8)),
                child: const Icon(
                  FluentIcons.cart_16_regular,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
