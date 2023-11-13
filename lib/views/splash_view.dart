import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart'; // Импортируем пакет logger
import 'package:practice_12/routes.dart';
import 'package:practice_12/services/shared_preferences_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  final PrefService _prefService = PrefService();
  final Logger _logger = Logger(); // Создаем экземпляр Logger

  @override
  void initState() {
    _prefService.readCache("password").then((value) {
      _logger.d('Cache value: $value'); // Используем Logger вместо print
      if (value != null) {
        return Timer(const Duration(seconds: 2),
            () => Navigator.of(context).pushNamed(HomeRoute));
      } else {
        return Timer(const Duration(seconds: 2),
            () => Navigator.of(context).pushNamed(LoginRoute));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.app_blocking,
        ),
      ),
    );
  }
}
