import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/parametre_controller.dart';

class ParametreView extends GetView<ParametreController> {
  const ParametreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ParametreView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ParametreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
