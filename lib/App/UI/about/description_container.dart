import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_controller.dart';
import '../../color_plate.dart';

class DescritptionContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AppController>(context);
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        text: TextSpan(
          children: controller.showDetails
              ? [
                  TextSpan(
                    text: 'Hello,\nI am ',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, height: 1.4),
                  ),
                  TextSpan(
                    text: 'ULTRA APP 3000.\n',
                    style: TextStyle(
                        color: ColorPlate.yellow,
                        fontFamily: 'Chintzy',
                        fontSize: 20,
                        height: 1.4),
                  ),
                  TextSpan(
                    text:
                        'I will choose an episode for you.\n\nPlease select the seasons you want to include in the research',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, height: 1.4),
                  ),
                ]
              : [],
        ),
      ),
    );
  }
}
