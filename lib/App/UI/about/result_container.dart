import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_controller.dart';
import '../../color_plate.dart';

class ResultContainer extends StatefulWidget {
  @override
  _ResultContainerState createState() => _ResultContainerState();
}

class _ResultContainerState extends State<ResultContainer> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AppController>(context);
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text(
              controller.title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: ColorPlate.yellow,
              ),
            ),
          ),
          Container(
            height: 20,
            margin: EdgeInsets.only(top: 5),
            child: Text(
              'Season ${controller.season} Episode ${controller.episode}',
              style:
                  TextStyle(color: Color.fromRGBO(215, 0, 0, 1), fontSize: 20),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _scrollController,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Text(
                    controller.description,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
