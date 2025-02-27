import 'package:burntbrotta/models/food.dart';
import 'package:burntbrotta/pages/foodDetails.dart';
import 'package:burntbrotta/pages/foodTile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:burntbrotta/models/favourites.dart';

class RecipiesPage extends StatelessWidget {
  const RecipiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List recipies = [
      Food(
          name: "Signature Burnt Parotta",
          duration: "2 hours",
          serving: 1,
          level: "Intermediate",
          imgpath: "lib/images/recipie_imgs/brotta.jpg"),
      Food(
          name: "Indonesian Chicken Noodles",
          duration: "40 mins",
          serving: 1,
          level: "Easy",
          imgpath: "lib/images/recipie_imgs/noodles.jpg"),
      Food(
          name: "Chocolate Raspberry Mousse",
          duration: "20 mins",
          serving: 1,
          level: "Easy",
          imgpath: "lib/images/recipie_imgs/chocolate mousse.jpg"),
      Food(
          name: "Oven Baked Tofu Shakshuka",
          duration: "40 mins",
          serving: 1,
          level: "Intermediate",
          imgpath: "lib/images/recipie_imgs/tofu shakshuka.jpg"),
      Food(
          name: "Bubble Tea",
          duration: "15 mins",
          serving: 1,
          level: "Easy",
          imgpath: "lib/images/recipie_imgs/bubble tea.jpg"),
      Food(
          name: "Thai Red Curry",
          duration: "40 mins",
          serving: 1,
          level: "Intermediate",
          imgpath: "lib/images/recipie_imgs/Thai red curry.jpg"),
    ];

    void getRecipieDetails(BuildContext context, int index) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FoodDetails(
                    food: recipies[index],
                  )));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BURNT BROTTA",
          style: GoogleFonts.climateCrisis(fontSize: 20, height: 0.9),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the drawer
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/favourites");
                },
                icon: const Icon(Icons.favorite)),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow[700], // Only the header is yellow
              ),
              child: Center(
                child: Text(
                  "Menu",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.black),
                    title: Text(
                      "Home",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/homepage");
                    },
                  ),
                  const Divider(thickness: 1, indent: 20, endIndent: 20), // Separator
                  ListTile(
                    leading: const Icon(Icons.favorite, color: Colors.black),
                    title: Text(
                      "Favorites",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/favourites");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(247, 243, 239, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 5),
                        child: Image.asset(
                          "lib/images/pan.png",
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "We put recipes to the test, so you can savor the success!",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            height: 0.9,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              "All Recipes",
              style: GoogleFonts.poppins(
                  fontSize: 22, height: 0.9, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Search here!",
                  ),
                )),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recipies.length,
                  itemBuilder: (context, index) => FoodTile(
                        food: recipies[index],
                        ontap: () => getRecipieDetails(context, index),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
