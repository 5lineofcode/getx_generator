import "dart:io";
import "package:getx_generator/resources/session/package_info.dart";
import "package:getx_generator/resources/template/controller.dart";
import 'package:getx_generator/resources/template/view.dart';
import 'package:getx_generator/shared/extension/clean_filename.dart';
import "package:getx_generator/shared/helper/template/template.dart";
import 'package:args/args.dart';
import 'package:path/path.dart';

ArgResults argResults;
Map getArgumentsMap(ArgResults argResults) {
  Map res = {};
  var args = argResults.arguments;

  for (var i = 0; i < args.length; i++) {
    var arg = args[i];
    if (arg.startsWith("-")) {
      var key = arg;
      var value = args[i + 1];

      key = key.replaceAll("-", "");
      res[key] = value;
    }
  }

  return res;
}

void main(List<String> args) async {
  final parser = ArgParser();
  parser.addFlag('name', abbr: "n");
  parser.addFlag('address', abbr: "a");
  argResults = parser.parse(args);
  var res = getArgumentsMap(argResults);
  print(res["name"]);
  print(res["address"]);

  await generateDefinedTemplate();
  await getPackageName();
  // await createController();
  await createImport();

  // await createView();
}

void doGenerateDefinedTemplate(String templateName) async {
  var file = await File("defined_template/${templateName}.dartx");
  var template = await file.readAsString();
  var fileName = "lib/resources/template/${templateName}.dart";

  template = template.replaceAll("\$", "\\\$");

  template =
      "var ${basename(file.path).split(".")[0]}Template = '''\n${template}\n''';";

  Template.create(fileName, template);
}

void generateDefinedTemplate() async {
  await doGenerateDefinedTemplate("view");
  await doGenerateDefinedTemplate("controller");
}

void createController() async {
  var template = controllerTemplate;
  var outputName = "generated/test/controller.dart";
  await Template.create(outputName, template);
}

void createView() async {
  var template = viewTemplate;
  var outputName = "generated/test/view.dart";
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
