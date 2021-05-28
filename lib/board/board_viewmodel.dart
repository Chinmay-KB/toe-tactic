import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toe_tactic/util/pieceWidget.dart';

class BoardViewModel extends BaseViewModel {
  static List<Draggable> _player1 = List.generate(
    6,
    (index) => Draggable(
      childWhenDragging: Container(),
      data: {'player': 1, 'level': index + 1},
      feedback: Piece(
        (index + 1).toDouble(),
        Colors.amber,
        (20 + 5 * index).toDouble(),
      ),
      child: Piece(
        (index + 1).toDouble(),
        Colors.amber,
        (20 + 5 * index).toDouble(),
      ),
    ),
  );
  static List<Draggable> _player2 = List.generate(
    6,
    (index) => Draggable(
      data: {'player': 2, 'level': 6 - index},
      feedback: Piece(
        (6 - index).toDouble(),
        Colors.blue,
        (45 - 5 * index).toDouble(),
      ),
      child: Piece(
        (6 - index).toDouble(),
        Colors.blue,
        (45 - 5 * index).toDouble(),
      ),
    ),
  );

  List<Draggable> get player1 => _player1;
  List<Draggable> get player2 => _player2;
  List<DragTarget> get cells => _cells;

  List<DragTarget> _cells = List.generate(
      9,
      (index) => DragTarget<Map<String, int>>(
            builder: (BuildContext context, List<Map<String, int>> accepted,
                List<dynamic> rejected) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    child: Center(child: Text(accepted.toString())),
                    color: Color.fromRGBO(60, 11, 65, 1),
                  ),
                ),
              );
            },
            onWillAccept: (data) => true,
          ));

  static bool checkValidMove(Map<String, int> data) {
    int player = data['player'];
    int level = data['level'];
    return true;
  }
}
