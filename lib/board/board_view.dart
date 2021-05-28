import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:toe_tactic/board/board_viewmodel.dart';

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
                )
              ],
            ),
            body: model.isBusy
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: model.player1,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                                childAspectRatio: 1,
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: 3,
                                children: model.cells),
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
