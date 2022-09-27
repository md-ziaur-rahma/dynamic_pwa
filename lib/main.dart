import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pwaapp/app/modules/splash/splash_screen.dart';
import 'package:pwaapp/app/routes/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Xactidea Ltd.',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepOrange,
      ),
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      transitionDuration: const Duration(milliseconds: 300),
      defaultTransition: Transition.cupertino,
      home: const SplashScreen(),
      getPages: Pages.pages,
    );
  }
}
