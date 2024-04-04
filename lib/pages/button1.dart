import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const Button1({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(this.text, style: GoogleFonts.poppins(fontSize: 20),),
                SizedBox(width: 10,),
                Icon(Icons.arrow_forward),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
