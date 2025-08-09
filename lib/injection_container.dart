import 'package:flutter/material.dart';
import 'package:flutter_dependency_injection/app_service_factory.dart';
import 'package:get_it/get_it.dart';

import 'app_service.dart';
import 'app_service_lazy.dart';

final locator = GetIt.instance;

void setup() {


  debugPrint("setup is called");

  locator.registerSingleton<AppService>(AppService());
  locator.registerLazySingleton<AppServiceLazy>(() => AppServiceLazy());
  locator.registerFactory<AppServiceFactory>(() => AppServiceFactory());
}