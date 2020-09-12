import "dart:io";

class Template {
  static void create(outputName, template) async {
    var file = await File(outputName).create(recursive: true);
    await file.writeAsString(template);
  }
}
