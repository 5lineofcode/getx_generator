import "dart:io";
import "package:getx_generator/resources/session/package_info.dart";
import "package:getx_generator/resources/template/controller.dart";
import 'package:getx_generator/shared/extension/clean_filename.dart';
import "package:getx_generator/shared/helper/template/template.dart";

void main(List<String> arguments) async {
  await getPackageName();
  // await createController();
  await createImport();
}

void getPackageName() async {
  var content = await File("pubspec.yaml").readAsString();

  var lines = content.split("\n");
  var selectedLines =
      lines.where((line) => line.startsWith("name: ")).toList()[0];

  packageName = selectedLines.split("name: ")[1];
}

void createController() async {
  var template = controllerTemplate;
  var outputName = "generated/test/test_controller.dart";
  await Template.create(outputName, template);
}

void createImport() async {
  List importScriptList = [];
  var dir = Directory("lib");
  List contents = dir.listSync(recursive: true);

  for (var fileOrDir in contents) {
    if (fileOrDir is File) {
      File file = fileOrDir;
      if (file.isDartFile()) {
        importScriptList.add(file.getExportScriptFromFileName());
      }
    }
  }

  var outputName = "lib/core.dart";
  var content = "${importScriptList.join("\n")}";
  await Template.create(outputName, content);
}
