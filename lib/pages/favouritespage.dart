import 'package:burntbrotta/models/favourites.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  removefavs(Food food, BuildContext context) {
    final favs = context.read<Favourites>();
    favs.removefromfavs(food);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Favourites>(builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: Text("Favourites", style: GoogleFonts.climateCrisis(fontSize: 25, height: 0.9, fontWeight: FontWeight.w100),),
        ),
    body: value.favs.isNotEmpty? ListView.builder(itemCount: value.favs.length ,itemBuilder: (context, index){
      final Food food = value.favs[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.yellow[300], borderRadius: BorderRadius.circular(15)),
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(food.imgpath, fit: BoxFit.cover,))),
                Flexible(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(title: Text(food.name, style: GoogleFonts.poppins(fontSize:16, fontWeight: FontWeight.w500),
                    ), subtitle: Text(food.level, style: GoogleFonts.poppins(fontSize:14),
                    )))),
                IconButton(onPressed: removefavs(food, context), icon: Icon(Icons.delete, color: Colors.black,))

              ],
            ),
          ),
        ),
      );

    }) : const Center(child: Text("No Favourites Added Yet!")))
    );
  }

}
