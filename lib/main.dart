import 'dart:convert';
import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ultraapp3000/App/AdMob/ad_mob_container.dart';
import 'package:ultraapp3000/App/color_plate.dart';

import 'App/UI/main_container.dart';
import 'App/app_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: ColorPlate.background,
      statusBarBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return ChangeNotifierProvider(
      create: (ctx) => AppController(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ultra App 3000',
          theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.purple,
            accentColor: Colors.indigo,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future future;
  bool showSplash = true;
  AdmobBannerSize bannerSize;
  Widget image;
  AppController get control =>
      Provider.of<AppController>(context, listen: false);

  void showAds() async {
    await Admob.requestTrackingAuthorization();
    bannerSize = AdmobBannerSize.BANNER;
  }

  @override
  void initState() {
    showAds();
    image = Image.asset(
      'assets/images/back.png',
      fit: BoxFit.cover,
    );
    future = DefaultAssetBundle.of(context).loadString('data/data.json');
    Future.delayed(Duration(milliseconds: 900)).then((value) {
      control.removeImage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPlate.background,
      body: SafeArea(
        child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            var data = json.decode(snapshot.data.toString());
            return Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Consumer<AppController>(
                    builder: (context, controller, _) {
                      if (controller.showImage) {
                        return Container(width: double.infinity, child: image);
                      } else {
                        return Provider<Map<String, dynamic>>.value(
                          value: data ?? {"": ''},
                          child: Column(
                            children: [
                              Expanded(
                                child: MainContainer(),
                              ),
                              AdMobContainer(
                                bannerSize: bannerSize,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  if (showSplash)
                    SplashScreen.callback(
                      onError: (_, __) {},
                      name: 'assets/splash.flr',
                      fit: BoxFit.cover,
                      onSuccess: (_) {
                        setState(() {
                          showSplash = false;
                        });
                        Future.delayed(Duration(milliseconds: 500))
                            .then((value) {
                          control.addShodow();
                        });
                        Future.delayed(Duration(milliseconds: 1500))
                            .then((value) {
                          control.addDetails();
                        });
                      },
                      startAnimation: 'intro',
                      backgroundColor: Colors.white.withAlpha(0),
                      until: () => Future.delayed(Duration.zero),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-8844828630064147/5428198684';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-8844828630064147/2505138982';
  }
  return null;
}
