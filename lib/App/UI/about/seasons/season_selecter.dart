import 'package:flutter/material.dart';

class SeasonSelector extends StatelessWidget {
  final bool isSelected;
  final int season;
  final Function onTap;

  const SeasonSelector({Key key, this.isSelected, this.onTap, this.season})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.play_arrow,
                  color: isSelected ? Colors.red : Colors.transparent,
                ),
              ),
              Container(
                width: 40,
                margin: EdgeInsets.symmetric(vertical:10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.black),
                  ),
                ),
                child: Text(
                  '$season',
                  style: TextStyle(fontSize: 25,color: Colors.black,fontFamily: 'Chintzy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
