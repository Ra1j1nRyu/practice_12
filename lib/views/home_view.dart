import 'package:flutter/material.dart';
import 'package:practice_12/routes.dart';
import 'package:practice_12/services/shared_preferences_service.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final PrefService _prefService = PrefService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Home"),
            ElevatedButton(
                onPressed: () async {
                  await _prefService.removeCache("password").whenComplete(() {
                    Navigator.of(context).pushNamed(LoginRoute);
                  });
                },
                child: const Text("Log out"))
          ],
        ),
      ),
    );
  }
}