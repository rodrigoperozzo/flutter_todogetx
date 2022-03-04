import 'package:flutter/material.dart';
import 'package:flutter_todogetx/screens/home_screen.dart';
import 'package:flutter_todogetx/screens/todo_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage()
  ));
}
