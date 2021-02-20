import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_controller.dart';
import 'arrow_button.dart';

class ButtonsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AppController>(context);
    final json = Provider.of<Map<String, dynamic>>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
      height: 60,
      child: Row(
        children: [
          RotationTransition(
            turns: new AlwaysStoppedAnimation(15 / 360),
            child: Container(
              width: 3,
              height: 50,
              margin: EdgeInsets.only(right: 20),
              color: Colors.black,
            ),
          ),
          ArrowButton(
            icon: controller.upButton,
            onTap: () => controller.addToSeasons(),
          ),
          Expanded(
            child: GestureDetector(
                onTap: () => controller.onGo(json),
                child: Container(
                    child: Image.asset(
                        'assets/images/${controller.goButton}.png'))),
          ),
          ArrowButton(
            icon: controller.downButton,
            onTap: () => controller.subtractFromSeasons(),
          ),
          RotationTransition(
            turns: new AlwaysStoppedAnimation(-15 / 360),
            child: Container(
              margin: EdgeInsets.only(left: 20),
              width: 3,
              height: 50,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
