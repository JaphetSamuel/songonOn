import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:songon_on/app/data/providers/user_provider.dart';

class AuthController extends GetxController {
  UserProvider userProvider = Get.find<UserProvider>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //signup
  TextEditingController emailSignupController = TextEditingController();
  TextEditingController passwordSignupController = TextEditingController();
  TextEditingController usernameSignupController = TextEditingController();
  TextEditingController confirmPasswordSignupController =
      TextEditingController();

  final count = 0.obs;

  void login() async {
    bool isconnected = await userProvider.login(emailController.text, passwordController.text);

    if(isconnected) {
      Get.snackbar("Succès", "Connexion réussie");
      Get.offAllNamed('/home');
      Get.toNamed('/home',preventDuplicates: false);
    } else {
      Get.snackbar("Erreur", "Une erreur est survenue lors de la connexion");
    }
  }

  void signup() async {
    RecordModel record = await userProvider.createUser(
        usernameSignupController.text,
        emailSignupController.text,
        passwordSignupController.text,
        confirmPasswordSignupController.text);

    if(record != null) {
      Get.snackbar("Succès", "Inscription réussie");
      await userProvider.login(
          emailSignupController.text, passwordSignupController.text);
    } else {
      Get.snackbar("Erreur", "Une erreur est survenue lors de l'inscription");
    }
  }

  void logout() async {
    await userProvider.logout();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
