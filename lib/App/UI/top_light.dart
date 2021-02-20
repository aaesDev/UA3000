import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_controller.dart';

class TopLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AppController>(context);
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.only(top: 1,bottom: 1),
        child: controller.lightOn
            ? Image.asset(
                'assets/images/lightOn.png',
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/images/lightOff.png',
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
