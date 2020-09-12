import "dart:io";

import 'package:getx_generator/core.dart';
import 'package:process_run/shell.dart';

class Template {
  static void create(outputName, template) async {
    var file = await File(outputName).create(recursive: true);

    template = template
        .toString()
        .replaceAll("@material", "import \"package:flutter/material.dart\";")
        .replaceAll("@core", "import \"package:$packageName/core.dart\";");

    await file.writeAsString(template);
    await Template.format(outputName);
  }

  static format(String path) async {
    var shell = Shell();

    await shell.run("flutter format $path");
  }
}
