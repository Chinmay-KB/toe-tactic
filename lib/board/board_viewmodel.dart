import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toe_tactic/util/pieceWidget.dart';

class BoardViewModel extends BaseViewModel {
  List<Widget> _player1;
  List<Widget> _player2;
  List<Widget> _pieces;
  List<DragTarget> _cells;
  List<Map<String, int>> _occupied;

  List<Widget> get player1 => _player1;
  List<Widget> get player2 => _player2;
  List<DragTarget> get cells => _cells;

  void init() {
    setBusy(true);
    _player1 = List.generate(
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
    _player2 = List.generate(
      6,
      (index) => Draggable(
        data: {'player': 2, 'level': 6 - index},
        feedback: Piece(
          (6 - index).toDouble(),
          Colors.blue[100],
          (45 - 5 * index).toDouble(),
        ),
        child: Piece(
          (6 - index).toDouble(),
          Colors.blue[100],
          (45 - 5 * index).toDouble(),
        ),
      ),
    );
    _occupied = List.generate(9, (index) => {'player': -1, 'level': -1});
    _pieces = List.generate(9, (index) => Container());
    _cells = List.generate(
      9,
      (index) => DragTarget<Map<String, int>>(
        builder: (BuildContext context, List<Map<String, int>> accepted,
            List<dynamic> rejected) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                child: Center(child: _pieces[index]),
                color: Color.fromRGBO(60, 11, 65, 1),
              ),
            ),
          );
        },
        onWillAccept: (data) => checkValidMove(data, index),
        onAccept: (data) => assignNewPiece(data, index),
      ),
    );
    setBusy(false);
  }

  bool checkValidMove(Map<String, int> data, int squareNo) {
    int player = data['player'];
    int level = data['level'];
    int occupiedPlayer = _occupied[squareNo]['player'];
    int occupiedLevel = _occupied[squareNo]['level'];
    if (player == occupiedPlayer) return false;
    if (level <= occupiedLevel) return false;
    return true;
  }

  void assignNewPiece(Map<String, int> data, int index) {
    int player = data['player'];
    int level = data['level'];
    _occupied[index]['player'] = player;
    _occupied[index]['level'] = level;
    _pieces[index] = Piece(
        level.toDouble(),
        player == 1 ? Colors.amber : Colors.blue[100],
        (20 + 5 * (level - 1)).toDouble());
    if (player == 1)
      _player1[level - 1] = Piece(
          level.toDouble(), Colors.white70, (20 + 5 * (level - 1)).toDouble());
    if (player == 2)
      _player2[6 - level] = Piece(
          level.toDouble(), Colors.white70, (20 + 5 * (level - 1)).toDouble());
    notifyListeners();
  }
}
