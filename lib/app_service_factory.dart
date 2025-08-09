import 'package:flutter/material.dart';

class AppServiceFactory {

  AppServiceFactory() {
    debugPrint("AppService Factory is created");
  }

  String execute() {
    String text = "AppServiceFactory is called";
    return text;
  }
}