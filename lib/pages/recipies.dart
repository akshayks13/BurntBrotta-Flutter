import 'package:burntbrotta/models/food.dart';
import 'package:burntbrotta/pages/menutile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipiesPage extends StatelessWidget {
  const RecipiesPage({super.key});

  @override
  Widget build(BuildContext context) {

    List recipies = [
      Food(name: "Signature Burnt Parotta", duration: "2 hours", serving: 1, imgpath: "lib/images/recipie_imgs/brotta.jpg"),
      Food(name: "Indonasian Chicken Noodles", duration: "40 mins", serving: 1, imgpath: "lib/images/recipie_imgs/noodles.jpg"),
      Food(name: "Chocolate Raspberry Mousse", duration: "20 mins", serving: 1, imgpath: "lib/images/recipie_imgs/chocolate mousse.jpg"),
      Food(name: "Signature Burnt Parotta", duration: "2 hours", serving: 1, imgpath: "lib/images/recipie_imgs/brotta.jpg"),
      Food(name: "Signature Burnt Parotta", duration: "2 hours", serving: 1, imgpath: "lib/images/recipie_imgs/brotta.jpg"),
      Food(name: "Signature Burnt Parotta", duration: "2 hours", serving: 1, imgpath: "lib/images/recipie_imgs/brotta.jpg"),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("BURNT BROTTA", style: GoogleFonts.climateCrisis(fontSize: 20, height: 0.9),),
          leading: const Icon(Icons.menu),
      ),
          body: ListView(
        children: [
          // Title promo something?
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
                      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical:5),
                      child: Image.asset("lib/images/pan.png", ),
                    ),
                    const SizedBox(height: 10,),
                    Text("We put recipes to the test, so you can savor the success!", style: GoogleFonts.poppins(fontSize: 18, height: 0.9, fontWeight: FontWeight.normal), textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
          ),

          // Popular
          const SizedBox(height: 10,),
          Text("Popular Recipies", style: GoogleFonts.poppins(fontSize: 22, height: 0.9, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),

          // Search bar
          const SizedBox(height: 10,),


          // All
          const SizedBox(height: 20,),
          Text("All Recipies", style: GoogleFonts.poppins(fontSize: 22, height: 0.9, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
          const SizedBox(height: 10,),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black), borderRadius: BorderRadius.circular(15))),
              )
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: MenuTile(),
          ),
        ],
    )


    );
  }
}
