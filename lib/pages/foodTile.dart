import 'package:burntbrotta/models/food.dart';
import 'package:burntbrotta/pages/yellowbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final Function()? ontap;
  const FoodTile({super.key, required this.food, required this.ontap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, bottom: 50),
        child: Container(
          width: 250,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(247, 243, 239, 1)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                      width: 500,
                      child: Image.asset(food.imgpath, fit: BoxFit.cover, height: 180,)),
                ),
                Text(food.name, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700, height: 1), textAlign: TextAlign.center,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoBox(name: food.duration),
                    InfoBox(name: "${food.serving} serving")
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
