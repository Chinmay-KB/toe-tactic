import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toe_tactic/util/styleassets.dart';

class ResultsView extends StatelessWidget {
  final payload;
  ResultsView(this.payload);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.COLOR_RESULTS_SCAFFOLD,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,
                    color: AppAssets.COLOR_PRIMARY,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              center: Alignment(0, -0.23),
                              radius: 0.3,
                              colors: [
                                Colors.red,
                                Color(0xffE46262),
                                AppAssets.COLOR_PRIMARY
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('CONGRATS!',
                                    style: GoogleFonts.cinzel(
                                      textStyle: TextStyle(
                                          color: Colors.yellow, fontSize: 32),
                                    )),
                                CircleAvatar(
                                  backgroundColor: AppAssets.COLOR_PRIMARY,
                                  radius: 50,
                                  backgroundImage: AssetImage(payload['image']),
                                ),
                                Text(
                                  'Player ${payload['player']} wins',
                                  style: GoogleFonts.merriweatherSans(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 24)),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: BorderSide(
                                                  color: Colors.white)))),
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 8),
                                      child: Text(
                                        'Play again',
                                        style: GoogleFonts.merriweatherSans(
                                            textStyle: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 16)),
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: BorderSide(
                                                  color: Colors.white)))),
                                  onPressed: () {
                                    int count = 0;
                                    Navigator.of(context)
                                        .popUntil((_) => count++ >= 2);
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 28),
                                      child: Text(
                                        'Back',
                                        style: GoogleFonts.merriweatherSans(
                                            textStyle: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 16)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 56,
                          child: Image.asset('assets/sparkles.png'),
                        ),
                        Positioned(
                          top: 130,
                          left: 66,
                          child: Image.asset('assets/sparkles.png'),
                        ),
                        Positioned(
                          top: 80,
                          left: 256,
                          child: Image.asset('assets/sparkles.png'),
                        ),
                        Positioned(
                          top: 130,
                          left: 220,
                          child: Image.asset('assets/sparkles.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.5),
                child: Image.asset('assets/confetti.png'),
              ),
              Align(
                alignment: Alignment(0.3, -0.55),
                child: Image.asset('assets/confetti.png'),
              ),
              Align(
                alignment: Alignment(-0.2, -0.53),
                child: Image.asset('assets/confetti.png'),
              ),
              Align(
                alignment: Alignment(0, -0.5),
                child: Image.asset('assets/confetti.png'),
              ),
              Align(
                alignment: Alignment(0, -0.45),
                child: Image.asset('assets/ribbon.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
