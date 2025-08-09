import 'package:flutter/material.dart';

class AppServiceLazy {

  AppServiceLazy() {
    debugPrint("AppService Lazy is created");
  }

  String execute() {
    String text = "AppServiceLazy is called";
    return text;
  }
}