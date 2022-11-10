import 'package:flutter/material.dart';
import 'package:world/utils/constant.dart';

Container myseachField = Container(
  decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: darkColor,
      ),
      borderRadius: BorderRadius.circular(12)),
  child: const TextField(
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search Country',
        prefixIcon: Icon(
          Icons.search,
          color: darkColor,
        )),
  ),
);
