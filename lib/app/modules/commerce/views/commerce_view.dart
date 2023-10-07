import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/commerce_controller.dart';

class CommerceView extends GetView<CommerceController> {
  const CommerceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CommerceView'),
        centerTitle: true,
      ),
      body: Center(
        child:Text('CommerceView is working', style: TextStyle(fontSize:20),)
      ),
    );
  }
}
