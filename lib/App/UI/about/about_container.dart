import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_controller.dart';
import '../../color_plate.dart';
import 'description_container.dart';
import 'loading_container.dart';
import 'result_container.dart';
import 'seasons/season_row.dart';

class AboutContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AppController>(context);
    return Expanded(
      flex: 5,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: controller.showShodow
              ? [
                  BoxShadow(
                    color: ColorPlate.purpleShadow,
                    blurRadius: 50,
                  )
                ]
              : [],
          borderRadius: BorderRadius.circular(35),
          color: ColorPlate.purple,
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child:controller.isLoading
                      ? LoadingContainer()
                      : controller.firstOpened
                          ? DescritptionContainer()
                          : ResultContainer()
             ,
            ),
            SeasonRow(),
          ],
        ),
      ),
    );
  }
}
