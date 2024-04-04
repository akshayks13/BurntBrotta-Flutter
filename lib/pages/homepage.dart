import 'package:burntbrotta/pages/button1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            Text("BURNT", style: GoogleFonts.climateCrisis(fontSize: 20, height: 0.9)),
            Text("BROTTA", style: GoogleFonts.climateCrisis(fontSize: 20, height: 0.9),),

            // image
            const SizedBox(height: 70,),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset('lib/images/salad.png'),
            ),

            // title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: Text("Kitchen Disasters Turned Delicious:", style: GoogleFonts.poppins(fontSize: 30, height: 0.9, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),

            ),

            // sub title?
            Text("The Chronicles of Burnt Brotta!", style: GoogleFonts.poppins(fontSize: 18, height: 0.9), textAlign: TextAlign.center,),

            // Lets go! button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Button1(text: "Let's Go!", onTap: (){Navigator.pushNamed(context, '/recipies');},),
            )
          ],
        ),
      )
    );
  }
}
