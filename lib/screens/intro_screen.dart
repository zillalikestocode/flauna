import 'dart:io';

import 'package:flauna/screens/home_screen.dart';
import 'package:flauna/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
            child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: Image.asset('assets/images/intro_plant.png')),
                Center(
                  child: SizedBox(
                    width: 250,
                    child: Text(
                      'Plant a tree and green the earth',
                      style: TextStyles.h2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Gap(15),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    "Plants are extraordinary living things they seem simple but they give our surrounding a great view",
                    style: TextStyles.norm,
                    textAlign: TextAlign.center,
                  ),
                )
              ]),
        )),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const HomeScreen()));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.90,
            padding: const EdgeInsets.symmetric(vertical: 12),
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
                color: accentColor, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                "Get Started",
                style: TextStyles.h4
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
