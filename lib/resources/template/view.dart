var viewTemplate = """

@material
@core

import 'package:example_app/modules/navigation/main_navigation/view/main_navigation.dart';
import 'package:example_app/theme/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: appThemeData,
    defaultTransition: Transition.fade,
    // getPages: AppPages.pages,
    home: MainNavigationView(),
  ));
}



class ExampleController extends GetxController {
  final String title = 'My Example View';
}

class ExampleView extends GetView<ExampleController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(controller.title),
    );
  } 
}


""";
