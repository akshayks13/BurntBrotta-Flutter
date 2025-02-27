import 'package:burntbrotta/models/favourites.dart';
import 'package:burntbrotta/pages/yellowbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  bool isFavorite = false;

  void toggleFavorite() {
    final favs = context.read<Favourites>();

    setState(() {
      if (favs.isFavorite(widget.food)) {
        favs.removefromfavs(widget.food);
        isFavorite = false;
      } else {
        favs.addtofavs(widget.food);
        isFavorite = true;
      }
    });

    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 50,
              color: isFavorite ? Colors.red : Colors.black,
            ),
            const SizedBox(height: 10),
            Text(
              isFavorite
                  ? "Added to Favourites! 😊❤️"
                  : "Removed from Favourites! 😞",
              style: GoogleFonts.poppins(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK", style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favs = context.watch<Favourites>();
    isFavorite = favs.isFavorite(widget.food);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.food.name,
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade700,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage(widget.food.imgpath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Text(
                widget.food.name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoBox(name: widget.food.duration),
                  InfoBox(name: "${widget.food.serving} serving"),
                  InfoBox(name: widget.food.level),
                ],
              ),

              const SizedBox(height: 20),

              // Food Description
              Text(
                "This soup is brimming with a rich symphony of flavors from aromatic ingredients like ginger, garlic, shallots, and turmeric, lending it a unique color and flavor profile. Mixed with noodles, potatoes, and a variety of veggies, this combination results in a delicious, filling soup that everyone can enjoy.",
                style: GoogleFonts.poppins(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),

      // Floating Action Button (Favorite)
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0,right: 10.0),
        child: FloatingActionButton(
          onPressed: toggleFavorite,
          backgroundColor: Colors.yellow.shade800,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            size: 28,
            color: isFavorite ? Colors.red : Colors.white,
          ),
        ),
      ),
    );
  }
}
