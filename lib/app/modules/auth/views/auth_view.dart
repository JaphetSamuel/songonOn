import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Songon on"),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                'Connexion'.text.color(Colors.teal).size(18).make(),
                'Inscription'.text.color(Colors.teal).size(18).make(),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Card(
                elevation: 5,
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  height: 250,
                  width: Get.width - 50,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //avatar icking

                      TextField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                        ),
                      ).h(40).px(20).py(20),
                      TextField(
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          hintText: "Mot de passe",
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                        ),
                      ).h(40).px(20).py(20),
                      ElevatedButton(
                        onPressed: () {
                          controller.login();
                        },
                        child: Text("Se connecter"),
                      ).h(40).px(20).py(20),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  height: 500,
                  width: Get.width - 50,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: controller.usernameSignupController,
                        decoration: InputDecoration(
                          hintText: "Nom",
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                        ),
                      ).h(40).px(20).py(20),
                      TextField(
                        controller: controller.emailSignupController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                        ),
                      ).h(40).px(20).py(20),
                      TextField(
                        controller: controller.passwordSignupController,
                        decoration: InputDecoration(
                          hintText: "Mot de passe",
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                        ),
                      ).h(40).px(20).py(20),
                      TextField(
                        controller: controller.confirmPasswordSignupController,
                        decoration: InputDecoration(
                          hintText: "Confirmer le mot de passe",
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                        ),
                      ).h(40).px(20).py(20),
                      ElevatedButton(
                        onPressed: () {
                          controller.signup();
                        },
                        child: Text("S'inscrire"),
                      ).h(40).px(20).py(20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
