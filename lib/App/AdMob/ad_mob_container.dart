import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AdMobContainer extends StatelessWidget {
  final AdmobBannerSize bannerSize;

  const AdMobContainer({Key key, this.bannerSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: AdmobBanner(
        adUnitId: getBannerAdUnitId(),
        adSize: bannerSize,
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {},
        onBannerCreated: (AdmobBannerController controller) {

        },
      ),
    );
  }
}
