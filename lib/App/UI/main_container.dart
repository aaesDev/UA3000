import 'package:flutter/material.dart';

import '../color_plate.dart';
import 'background_image.dart';

class MainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPlate.background,
      child: BackgroundImage(),
    );
  }
}
