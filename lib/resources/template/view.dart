var viewTemplate = """

@material
@core

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
