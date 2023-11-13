import 'package:flutter/material.dart';
import 'package:practice_12/routes.dart';
import 'package:practice_12/services/shared_preferences_service.dart';
import 'package:practice_12/views/home_view.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final PrefService _prefService = PrefService();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("Login"),
      ),
      body: Center(
        child: SizedBox(
          width: 400.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: email,
                decoration: InputDecoration(
                    border: new OutlineInputBorder(), hintText: "Enter email"),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                    border: new OutlineInputBorder(),
                    hintText: "Enter password"),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                  onPressed: () async {
                    _prefService.createCache(password.text).whenComplete(() {
                      if (email.text.isNotEmpty && password.text.isNotEmpty) {
                        Navigator.of(context).pushNamed(HomeRoute);
                      }
                    });
                  },
                  child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}