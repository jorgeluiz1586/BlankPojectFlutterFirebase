import 'package:get/get.dart';

import '../modules/login/bindings/login_binding.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/screen2/bindings/screen2_binding.dart';
import '../modules/screen3/bindings/screen3_binding.dart';
import '../modules/screen4/bindings/screen4_binding.dart';
import '../global/widgets/splashscreen.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/views/register_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/screen2/views/screen2_view.dart';
import '../modules/screen3/views/screen3_view.dart';
import '../modules/screen4/views/screen4_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.START;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashScreen(),
      binding: null,
      preventDuplicates: true,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN2,
      page: () => const Screen2View(),
      binding: Screen2Binding(),
    ),
    GetPage(
      name: _Paths.SCREEN3,
      page: () => const Screen3View(),
      binding: Screen3Binding(),
    ),
    GetPage(
      name: _Paths.SCREEN4,
      page: () => Screen4View(),
      binding: Screen4Binding(),
    ),
  ];
}
