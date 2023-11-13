import 'package:practice_12/views/home_view.dart';
import 'package:practice_12/views/login_view.dart';
import 'package:practice_12/views/splash_view.dart';

const String SplashRoute = "/splash";
const String HomeRoute = "/home";
const String LoginRoute = "/login";

final routes = {
  SplashRoute: (context) => const SplashView(),
  HomeRoute: (context) => HomeView(),
  LoginRoute: (context) => LoginView()
};