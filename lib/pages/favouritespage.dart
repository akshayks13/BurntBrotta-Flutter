import 'package:burntbrotta/models/favourites.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    void removefavs(Food food) {
      final favs = context.read<Favourites>();
      favs.removefromfavs(food);
    }

    return Consumer<Favourites>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Favourites",
            style: GoogleFonts.climateCrisis(
              fontSize: 25,
              height: 0.9,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        body: value.favs.isNotEmpty
            ? ListView.builder(
                itemCount: value.favs.length,
                itemBuilder: (context, index) {
                  final Food food = value.favs[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 120,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              food.imgpath,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                food.name,
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                food.level,
                                style: GoogleFonts.poppins(fontSize: 14),
                              ),
                              trailing: IconButton(
                                onPressed: () => removefavs(food),
                                icon: const Icon(Icons.delete,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Text(
                  "No Favourites Added Yet!",
                  style: TextStyle(fontSize: 16),
                ),
              ),
      ),
    );
  }
}
