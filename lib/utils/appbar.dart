import 'package:flutter/material.dart';
import 'package:world/utils/constant.dart';

AppBar myAppBar = AppBar(
  elevation: 0,
  backgroundColor: darkColor,
  actions: const [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Icon(
        Icons.sunny,
        size: 30,
      ),
    )
  ],
  leading: Center(
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        'La'.toUpperCase(),
        style: const TextStyle(fontSize: 25, fontFamily: 'Kanit'),
      ),
    ),
  ),
);
