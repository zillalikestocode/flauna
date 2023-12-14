import 'package:flauna/providers/bottom_navigation.dart';
import 'package:flauna/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider())
      ],
      child: MaterialApp(
        title: 'Flauna',
        home: SplashScreen(),
        theme: ThemeData.light().copyWith(brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
