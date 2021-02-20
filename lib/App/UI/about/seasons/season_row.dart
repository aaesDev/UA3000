import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_controller.dart';
import '../../../color_plate.dart';
import 'season_dash.dart';
import 'season_selecter.dart';

class SeasonRow extends StatefulWidget {
  @override
  _SeasonRowState createState() => _SeasonRowState();
}

class _SeasonRowState extends State<SeasonRow> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AppController>(context);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
          color: ColorPlate.yellow,
        ),
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          children: controller.showDetails
              ? [
                  SeasonSelector(
                    onTap: () => controller.setCurretnColumn(0),
                    isSelected: controller.selectedColumn == 0,
                    season: controller.firstSeasons,
                  ),
                  SeasonDash(),
                  SeasonSelector(
                    onTap: () => controller.setCurretnColumn(1),
                    isSelected: controller.selectedColumn == 1,
                    season: controller.lastSeasons,
                  )
                ]
              : [],
        ),
      ),
    );
  }
}
