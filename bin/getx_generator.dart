import 'dart:io';

import 'package:getx_generator/getx_generator.dart' as getx_generator;

void main(List<String> arguments) async {
  var current = Directory.current.toString();

  current = current.replaceAll('\\', '/').replaceAll('\'', '');

  var content =
      await File('assets/template/controller.dartx').readAsString();

  final filename = 'generated/modules/controller/controller.dart';
  var file = await File(filename).create(recursive: true);
  await file.writeAsString(content);

  print('Hello world: ${getx_generator.calculate()}!');
}
