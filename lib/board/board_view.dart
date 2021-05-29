import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:toe_tactic/board/board_viewmodel.dart';
import 'package:toe_tactic/util/styleassets.dart';
import 'dart:math' as math;

class BoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BoardViewModel>.reactive(
      viewModelBuilder: () => BoardViewModel(),
      onModelReady: (model) => model.init(),
      builder: (
        BuildContext context,
        BoardViewModel model,
        Widget child,
      ) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: model.init,
                    child: Icon(Icons.refresh),
                  ),
                ),
              ],
            ),
            body: model.isBusy
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: model.playerTurn == 1
                                            ? AppAssets.COLOR_PLAYER_1
                                            : Colors.white,
                                        blurRadius: 6.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                      height: 100,
                                      width: 120,
                                      child: Image.asset(
                                        'assets/player_1.jpg',
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Player 1',
                                      style: GoogleFonts.getFont('Open Sans',
                                          fontSize: 28,
                                          fontWeight: FontWeight.w400,
                                          color: AppAssets.COLOR_PLAYER_TEXT),
                                    ),
                                    Text(
                                      'Your turn',
                                      style: GoogleFonts.getFont('Open Sans',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: model.playerTurn == 1
                                              ? Colors.deepOrange
                                              : Colors.white,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 2),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: model.player1,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width - 40,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                GridView.count(
                                    childAspectRatio: 1,
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: 3,
                                    children: model.cells),
                                // Vertical win line
                                Positioned(
                                  left: ((MediaQuery.of(context).size.width -
                                              64) /
                                          6) *
                                      model.verticalWin['offset'],
                                  top: 12,
                                  child: AnimatedContainer(
                                      color: Colors.greenAccent,
                                      width: 4,
                                      height: model.verticalWin['state']
                                          ? MediaQuery.of(context).size.width -
                                              80
                                          : 0,
                                      curve: Curves.easeInQuart,
                                      duration: Duration(milliseconds: 500)),
                                ),
                                // Horizontal win line
                                Positioned(
                                  top: ((MediaQuery.of(context).size.width -
                                              64) /
                                          6) *
                                      model.horizontalWin['offset'],
                                  left: 12,
                                  child: AnimatedContainer(
                                      color: Colors.greenAccent,
                                      height: 4,
                                      width: model.horizontalWin['state']
                                          ? MediaQuery.of(context).size.width -
                                              80
                                          : 0,
                                      curve: Curves.easeInQuart,
                                      duration: Duration(milliseconds: 500)),
                                ),
                                Transform.rotate(
                                  angle:
                                      math.pi / 4 * model.diagonalWin['offset'],
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: AnimatedContainer(
                                        color: Colors.greenAccent,
                                        height: 4,
                                        width: model.diagonalWin['state']
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                40
                                            : 0,
                                        curve: Curves.easeInQuart,
                                        duration: Duration(milliseconds: 500)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: model.player2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Player 2',
                                      style: GoogleFonts.getFont('Open Sans',
                                          fontSize: 28,
                                          fontWeight: FontWeight.w400,
                                          color: AppAssets.COLOR_PLAYER_TEXT),
                                    ),
                                    Text(
                                      'Your turn',
                                      style: GoogleFonts.getFont('Open Sans',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: model.playerTurn == 2
                                              ? Colors.deepOrange
                                              : Colors.white,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 2),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: model.playerTurn == 2
                                            ? AppAssets.COLOR_PLAYER_2
                                            : Colors.white,
                                        blurRadius: 6.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: SizedBox(
                                      height: 100,
                                      width: 130,
                                      child: Image.asset(
                                        'assets/player_2.png',
                                        fit: BoxFit.fitWidth,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
