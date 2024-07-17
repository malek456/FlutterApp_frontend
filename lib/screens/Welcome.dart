import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/signin');
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF63C8E1),
        padding: EdgeInsets.fromLTRB(0, 144, 7, 144),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 153,
              child: Container(
                width: 330,
                height: 330,
              ),
            ),
            SizedBox(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/logoApp.png'),
                      ),
                    ),
                    width: 291,
                    padding: EdgeInsets.fromLTRB(13, 231, 0, 25),
                    child: Text(
                      'SkillVortex',
                      textAlign: TextAlign.center, // Align the text to the center horizontally
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        letterSpacing: -0.3,
                        color: Color(0xFF1C1C1E),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 1, 60),
                    child: Text(
                      'welcome',
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w300,
                        fontSize: 48,
                        letterSpacing: -0.3,
                        color: Color(0xFF332DA1),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(110, 20, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 10.4, 0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/logoSoc.png'),
                            ),
                          ),
                          width: 116,
                          height: 45,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text(
                            '1.0',
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              letterSpacing: -0.3,
                              color: Color(0xFF979797),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
