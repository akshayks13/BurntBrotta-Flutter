import 'package:burntbrotta/pages/yellowbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(247, 243, 239, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("lib/images/recipie_imgs/brotta.jpg",
              height: 250,),
            ),
            Text("Signature Parotta", style: GoogleFonts.poppins(fontSize: 18, height: 0.9, fontWeight: FontWeight.normal),),
            Row(

              children: [
                InfoBox(name: "1 hour"),
                InfoBox(name: "1 serving")
              ],
            )
          ],
        ),
      ),

    );
  }
}
