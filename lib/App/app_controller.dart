import 'dart:math';

import 'package:flutter/material.dart';

class AppController with ChangeNotifier {
  int selectedColumn = 0;
  int firstSeasons = 1;
  int lastSeasons = 32;
  bool isLoading = false;
  bool firstOpened = true;
  bool lightOn = false;
  Random _random = Random();

  String title = '';
  String episode = '';
  String season = '';
  String description = '';

  String upButton = 'up';
  String downButton = 'down';
  String goButton = 'go';


  bool showImage=true;
  bool showShodow = false;
  bool showDetails = false;

  void removeImage(){
    showImage = false;
    notifyListeners();
  }
  void addShodow(){
    showShodow = true;
    notifyListeners();
  }
  void addDetails(){
    showDetails = true;
    notifyListeners();
  }


  void setCurretnColumn(int n) {
    selectedColumn = n;
    notifyListeners();
  }

  int next(int min, int max) => min + _random.nextInt(max - min);

  void onGo(Map<String, dynamic> json) {
    if (!isLoading) {
      goButton = 'goPressed';
      notifyListeners();

      Future.delayed(Duration(milliseconds: 200)).then((value) {
        goButton = 'go';
        notifyListeners();
      });
      season = next(firstSeasons, 3).toString();
      int ep = next(0, json['simpsons']['season$season'].length);
      title = json['simpsons']['season$season'][ep]['title'];
      description = json['simpsons']['season$season'][ep]['description'];
      ep++;
      episode = ep.toString();
      isLoading = true;
      firstOpened = false;
      lightOn = false;
      notifyListeners();

      Future.delayed(Duration(seconds: 2)).then((value) {
        isLoading = false;
        lightOn = true;
        notifyListeners();
      });
    }
  }

  void addToSeasons() {
    upButton = 'upPressed';
    notifyListeners();

    Future.delayed(Duration(milliseconds: 200)).then((value) {
      upButton = 'up';
      notifyListeners();
    });
    if (selectedColumn == 0) {
      if (firstSeasons > 0 && firstSeasons < lastSeasons) firstSeasons++;
    } else if (selectedColumn == 1) {
      if (lastSeasons >= firstSeasons && lastSeasons < 32) lastSeasons++;
    }
    notifyListeners();
  }

  void subtractFromSeasons() {
    downButton = 'downPressed';
      notifyListeners();

      Future.delayed(Duration(milliseconds: 200)).then((value) {
        downButton = 'down';
        notifyListeners();
      });
    if (selectedColumn == 0) {
      if (firstSeasons > 1 && firstSeasons <= lastSeasons) firstSeasons--;
    } else if (selectedColumn == 1) {
      if (lastSeasons > firstSeasons && lastSeasons <= 32) lastSeasons--;
    }
    notifyListeners();
  }
}
