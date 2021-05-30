import 'dart:ui';

class AppAssets {
  static const COLOR_PRIMARY = Color(0xff3C0B41);
  static const COLOR_PLAYER_1 = Color(0xfff21170);
  static const COLOR_PLAYER_2 = Color(0xfffdca40);
  static const COLOR_PIECE_INACTIVE = Color(0xfff5cebe);
  static const COLOR_PLAYER_TEXT = Color(0xff707070);
  static const COLOR_RESULTS_SCAFFOLD = Color(0xffffdbdb);
  static const COLOR_HOMESCREEN_ORANGE = Color(0xffFE5651);
  static const COLOR_HOMESCREEN_BACKGROUND = Color(0xff3C0B41);

  static const INSTRUCTIONS =
      '''This game is a modified and more interesting version of the classic tic-tac-toe game that we as kids used to scribble at the back of our notebooks.\n
There are two players who possess six circles each with them of varying sizes, lined up in increasing order of diameter. The players have to drag a circle at their turn. However, a player can nullify the other's move by placing a bigger circle at the same position.\n
The player who intelligently succeeds in getting 3 in a row (up, down, across or diagonally) is the winner
  ''';
}
