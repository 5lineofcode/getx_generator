var controllerTemplate = '''
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainNavigationController extends GetxController {
  var count = 0.obs;
  var nama = "Deniansyah";
  var alamat = "Bogor";

  updateName() {
    count++;
    nama = "SEs \${DateTime.now()}";
    update();
  }

  updateAlamat() {
    alamat = "Depok";
    update();
  }
}

''';
