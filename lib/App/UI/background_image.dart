import 'package:flutter/material.dart';

import '../color_plate.dart';
import 'about/about_container.dart';
import 'buttons/buttons_container.dart';
import 'top_light.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(35),
              color: ColorPlate.border,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(35),
                    color: ColorPlate.background,
                  ),
                  child: Column(
                    children: [
                      TopLight(),
                      AboutContainer(),
                    ],
                  ),
                ),
              ),
              ButtonsContainer(),
            ],
          ),
        ],
      ),
    );
  }
}
