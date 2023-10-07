

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:songon_on/app/data/models/article_model.dart';

import '../controllers/actualite_controller.dart';

class ActualiteView extends GetView<ActualiteController> {
  final Article article = Get.arguments;

  ActualiteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualité'),
        centerTitle: false,
      ),
      body: Text("fa"),
    );
  }
}
