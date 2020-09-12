import "dart:io";
import "package:getx_generator/resources/session/package_info.dart";
import "package:getx_generator/resources/template/controller.dart";
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
  var dir = Directory("lib");
  List contents = dir.listSync(recursive: true);
  for (var fileOrDir in contents) {
    if (fileOrDir is File) {
      String fileName = fileOrDir.toString();
      print("file: $fileName");
    } else if (fileOrDir is Directory) {
      String dirName = fileOrDir.toString();
      print("file: $dirName");
    }
    print(fileOrDir);
  }
}
