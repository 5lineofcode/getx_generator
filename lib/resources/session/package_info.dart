import 'dart:convert';
import 'dart:io';

String packageName = "";
void getPackageName() async {
  var content = await File("./pubspec.yaml").readAsString(
    encoding: utf8,
  );

  var lines =
      content.contains("\r\n") ? content.split("\r\n") : content.split("\n");
      
  var selectedLines =
      lines.where((line) => line.startsWith("name: ")).toList()[0];

  packageName = selectedLines.split("name: ")[1];
  packageName = packageName.replaceAll("\r\n", "");
  packageName = packageName.replaceAll("\n", "");
  packageName = packageName.replaceAll(RegExp(r"/^\s\n+|\s\n+$/g"), "");
  packageName = "$packageName";

  var arr = packageName.split("\n")[0];
  print("arr: $arr");
}
