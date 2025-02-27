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
              fontSize: 26,
              height: 0.9,
              fontWeight: FontWeight.w100,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.yellow[700],
        ),
        body: value.favs.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: value.favs.length,
                itemBuilder: (context, index) {
                  final Food food = value.favs[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Dismissible(
                      key: Key(food.name),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) => removefavs(food),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow[300],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              food.imgpath,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            food.name,
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            food.level,
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                          trailing: IconButton(
                            onPressed: () => removefavs(food),
                            icon: const Icon(Icons.delete, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  "No Favourites Yet!",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
      ),
    );
  }
}