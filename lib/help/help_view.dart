import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toe_tactic/util/styleassets.dart';

class HelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.COLOR_RESULTS_SCAFFOLD,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppAssets.COLOR_HOMESCREEN_ORANGE,
          ),
        ),
        title: Text(
          'How to play',
          style: GoogleFonts.getFont('Open Sans',
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppAssets.COLOR_HOMESCREEN_ORANGE),
        ),
        backgroundColor: AppAssets.COLOR_PRIMARY,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\"Life is like a tic-tac-toe game think. plan. make your move\"',
                  style: GoogleFonts.getFont('Italianno',
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      color: AppAssets.COLOR_PRIMARY),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Basic rules:',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.getFont('Open Sans',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppAssets.COLOR_HOMESCREEN_ORANGE),
                ),
              ),
              Text(AppAssets.INSTRUCTIONS,
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    fontSize: 24,
                    color: AppAssets.COLOR_PRIMARY,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
