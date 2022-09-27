import 'package:get/get.dart';
import 'package:pwaapp/app/modules/home/home_page.dart';
import 'package:pwaapp/app/modules/set_url/set_url_screen.dart';
import 'package:pwaapp/app/modules/splash/splash_screen.dart';
import 'package:pwaapp/app/routes/routes.dart';

import '../modules/no_internet/no_internet.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.noInternet,
      page: () => const NoInternetScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.setUrlPage,
      page: () => const SetUrlScreen(),
    ),
  ];
}