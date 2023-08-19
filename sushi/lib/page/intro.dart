import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/button.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25,),
            //shop name
            Text(
              'SUSHI MAN',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20,
                color: Colors.white
              ),
            ),

           // const SizedBox(height: 10,),

            // icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset("assets/images/sushi.png"),
            ),

           // const SizedBox(height: 10,),

            //title
            Text(
              'THE TASTE OF JAPANESE FOOD',
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 32,
                  color: Colors.white
              ),
            ),
            const SizedBox(height: 25,),

            MyButton(
                text: 'Get Start',
                onTap: () => Navigator.pushNamed(context, '/menupage'),
            ),

            //subtitle

            //get start button
          ],
        ),
      ),
    );
  }
}
