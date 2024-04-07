import 'package:burntbrotta/pages/button2.dart';
import 'package:burntbrotta/pages/yellowbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/food.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Expanded(child: ListView(

        children: [
          Container(
              height: 300,
              child: Image.asset(widget.food.imgpath, fit: BoxFit.cover)),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // food pic ( rectangular )

              // Food name
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(widget.food.name, style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 25, height:1),),
              ),
            
              // Info boxes
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    InfoBox(name: widget.food.duration),
                    InfoBox(name: "${widget.food.serving} serving"),
                    InfoBox(name: widget.food.level),
                  ],
                ),
              ),

              // Add to favourites
            
              // Details
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("This soup is brimming with a rich symphony of flavours from aromatic ingredients like ginger, garlic, shallots, and turmeric, lending it a unique colour and flavour profile. Mixed with noodles, potatoes, and a variety of veggies, this combination results in a delicious, filling soup that everyone can enjoy.",
                style: GoogleFonts.poppins(fontSize: 15),),
              ),
            
            
            
            ],
          ),
        ],
      ),)
    );
  }
}
