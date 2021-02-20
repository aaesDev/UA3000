import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class ArrowButton extends StatelessWidget {
  final String icon;
  final Function onTap;

  const ArrowButton({Key key, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          Vibration.vibrate();
          onTap();},
        child: Container(child: Image.asset('assets/images/$icon.png')),
      ),
    );
  }
}
