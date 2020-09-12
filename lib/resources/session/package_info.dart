import 'dart:io';

String packageName = "";
void getPackageName() async {
  var content = await File("pubspec.yaml").readAsString();

  var lines = content.split("\n");
  var selectedLines =
      lines.where((line) => line.startsWith("name: ")).toList()[0];

  packageName = selectedLines.split("name: ")[1];
  packageName = packageName.replaceAll("\r\n", "");
  packageName = packageName.replaceAll("\n", "");
  packageName = packageName.replaceAll(RegExp(r"/^\s\n+|\s\n+$/g"), "");
  packageName = "$packageName";
}
