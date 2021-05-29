import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toe_tactic/util/pieceWidget.dart';
import 'package:toe_tactic/util/styleassets.dart';

class BoardViewModel extends BaseViewModel {
  List<Widget> _player1;
  List<Widget> _player2;
  List<Widget> _pieces;
  List<DragTarget> _cells;
  List<Map<String, int>> _occupied;
  int _playerTurn = 1;
  var verticalWin = {'state': false, 'offset': 0};
  var horizontalWin = {'state': false, 'offset': 0};
  var diagonalWin = {'state': false, 'offset': 0};

  List<Widget> get player1 => _player1;
  List<Widget> get player2 => _player2;
  List<DragTarget> get cells => _cells;
  int get playerTurn => _playerTurn;

  void init() {
    setBusy(true);
    _playerTurn = 1;
    verticalWin = {'state': false, 'offset': 0};
    horizontalWin = {'state': false, 'offset': 0};
    diagonalWin = {'state': false, 'offset': 0};
    _player1 = List.generate(
      6,
      (index) => Draggable(
        childWhenDragging: Piece(
          (index + 1).toDouble(),
          AppAssets.COLOR_PIECE_INACTIVE,
          (20 + 5 * index).toDouble(),
        ),
        data: {'player': 1, 'level': index + 1},
        feedback: Piece(
          (index + 1).toDouble(),
          AppAssets.COLOR_PLAYER_1,
          (20 + 5 * index).toDouble(),
        ),
        child: Piece(
          (index + 1).toDouble(),
          AppAssets.COLOR_PLAYER_1,
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
          AppAssets.COLOR_PLAYER_2,
          (45 - 5 * index).toDouble(),
        ),
        child: Piece(
          (6 - index).toDouble(),
          AppAssets.COLOR_PLAYER_2,
          (45 - 5 * index).toDouble(),
        ),
        childWhenDragging: Piece(
          (6 - index).toDouble(),
          AppAssets.COLOR_PIECE_INACTIVE,
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
                color: AppAssets.COLOR_PRIMARY,
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
    print('Player turn is $_playerTurn and player is $player');
    if (_playerTurn != player) return false;
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
        player == 1 ? AppAssets.COLOR_PLAYER_1 : AppAssets.COLOR_PLAYER_2,
        (20 + 5 * (level - 1)).toDouble());
    if (player == 1)
      _player1[level - 1] = Piece(level.toDouble(),
          AppAssets.COLOR_PIECE_INACTIVE, (20 + 5 * (level - 1)).toDouble());
    if (player == 2)
      _player2[6 - level] = Piece(level.toDouble(),
          AppAssets.COLOR_PIECE_INACTIVE, (20 + 5 * (level - 1)).toDouble());
    checkIfWon();
    togglePlayerTurn();
    notifyListeners();
  }

  checkIfWon() {
    // Checking for vertical win
    for (int i = 0; i < 3; i++) {
      if (_occupied[i]['player'] == _occupied[i + 3]['player'] &&
          _occupied[i]['player'] == _occupied[i + 6]['player'] &&
          _occupied[i]['player'] != -1) {
        print(_occupied[i]['player'].toString() +
            ' ' +
            _occupied[i + 3]['player'].toString() +
            ' ' +
            _occupied[i + 6]['player'].toString());
        verticalWin['state'] = true;
        verticalWin['offset'] = 2 * i + 1;
        notifyListeners();
        return;
      }
    }
    // Checking horizontal win
    for (int i = 0; i < 7; i += 3) {
      if (_occupied[i]['player'] == _occupied[i + 1]['player'] &&
          _occupied[i]['player'] == _occupied[i + 2]['player'] &&
          _occupied[i]['player'] != -1) {
        horizontalWin['state'] = true;
        if (i == 0) horizontalWin['offset'] = 1;
        if (i == 3) horizontalWin['offset'] = 3;
        if (i == 6) horizontalWin['offset'] = 5;

        notifyListeners();
        return;
      }
    }

    // Check win from top left
    if (_occupied[0]['player'] == _occupied[4]['player'] &&
        _occupied[0]['player'] == _occupied[8]['player'] &&
        _occupied[0]['player'] != -1) {
      diagonalWin['state'] = true;
      diagonalWin['offset'] = 1;
      notifyListeners();
      return;
    }
    // Check win from top right
    if (_occupied[2]['player'] == _occupied[4]['player'] &&
        _occupied[2]['player'] == _occupied[6]['player'] &&
        _occupied[2]['player'] != -1) {
      diagonalWin['state'] = true;
      diagonalWin['offset'] = -1;
      notifyListeners();
      return;
    }
  }

  togglePlayerTurn() {
    _playerTurn = _playerTurn == 1 ? 2 : 1;
    print(_playerTurn);
  }
}
