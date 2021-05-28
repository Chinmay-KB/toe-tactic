import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toe_tactic/board/board_viewmodel.dart';
import 'package:toe_tactic/util/pieceWidget.dart';

class BoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BoardViewModel>.reactive(
      viewModelBuilder: () => BoardViewModel(),
      builder: (
        BuildContext context,
        BoardViewModel model,
        Widget child,
      ) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: model.player1,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        childAspectRatio: 1,
                        crossAxisCount: 3,
                        children: model.cells
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: model.player2,
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
