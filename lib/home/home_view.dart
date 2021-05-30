import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toe_tactic/board/board_view.dart';
import 'package:toe_tactic/help/help_view.dart';
import 'package:toe_tactic/util/styleassets.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppAssets.COLOR_HOMESCREEN_BACKGROUND.withOpacity(1),
            child: Opacity(
              opacity: 0.2,
              child: Image(
                image: AssetImage('assets/home_bg.png'),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-1, -0.7),
            child: Image(
              image: AssetImage('assets/home_ttt.png'),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.18),
            child: Text(
              'Tic tac toe with\nmore tactic',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28,
                  color: AppAssets.COLOR_PIECE_INACTIVE,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          AppAssets.COLOR_HOMESCREEN_ORANGE),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              side: BorderSide(
                                  color: AppAssets.COLOR_HOMESCREEN_ORANGE)))),
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BoardView())),
                  child: Container(
                    color: AppAssets.COLOR_HOMESCREEN_ORANGE,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 40),
                      child: Text(
                        'Let\'s go',
                        style: GoogleFonts.merriweatherSans(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          AppAssets.COLOR_HOMESCREEN_ORANGE),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              side: BorderSide(
                                  color: AppAssets.COLOR_HOMESCREEN_ORANGE)))),
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HelpView())),
                  child: Container(
                    color: AppAssets.COLOR_HOMESCREEN_ORANGE,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 28),
                      child: Text(
                        'How to play',
                        style: GoogleFonts.merriweatherSans(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
