import 'package:blog/app/bindings/initial_bindings.dart';
import 'package:blog/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Blog",
      theme: AppTheme.themeData(),
      darkTheme: AppTheme.themeData(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
    ),
  );
}
