import 'package:get/get.dart';
import 'package:songon_on/app/data/models/article_model.dart';
import 'package:songon_on/app/data/providers/actualite_provider.dart';
import 'package:flutter/material.dart';
import 'package:songon_on/app/data/providers/article_provider.dart';
import '../../../data/models/actualite_model.dart';

class HomeController extends GetxController {
  final ArticleProvider articleProvider = Get.find<ArticleProvider>();
  final pageController = PageController(initialPage: 0);
  var currentIndex = 0.obs;

  var articles = <Article>[].obs;

  void onBottomNavTap(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  void onInit() async {
    super.onInit();
    await articleProvider
        .getAllArticle()
        .then((value) => articles.value = value);
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
