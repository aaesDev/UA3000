import 'dart:io';

class AdManager {
  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-8844828630064147~3132551292";
    } else if (Platform.isIOS) {
      return "ca-app-pub-8844828630064147~5128815786";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-8844828630064147/2505138982";
    } else if (Platform.isIOS) {
      return "ca-app-pub-8844828630064147/5428198684";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
