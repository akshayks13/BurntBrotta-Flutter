import 'package:burntbrotta/models/favourites.dart';
import 'package:burntbrotta/pages/favouritespage.dart';
import 'package:burntbrotta/pages/homepage.dart';
import 'package:burntbrotta/pages/recipies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=> Favourites(), child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "/homepage": (context) => HomePage(),
        "/recipies": (context) => RecipiesPage(),
        "/favourites": (context) => FavouritesPage(),
      },
    );
  }
}
