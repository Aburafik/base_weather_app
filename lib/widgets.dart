import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration boxDecoration = BoxDecoration(
    image: DecorationImage(
  image: AssetImage("images/img.jpeg"),
  fit: BoxFit.cover,
));

BoxDecoration bottomContanerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ));
