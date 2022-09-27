
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pwaapp/app/routes/routes.dart';
import 'package:pwaapp/app/utils/my_sharedpreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.onInit();
    startTime();
  }


  startTime() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? url = localStorage.getString(MySharedPreference.sUrl);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // connected
        if(url != null){
          MySharedPreference.url = url;
          var duration = const Duration(seconds: 2);
          return Timer(duration, navigationPage);
        } else {
          MySharedPreference.url = "";
          var duration = const Duration(seconds: 2);
          return Timer(duration, setUrlPage);
        }
      } else {
        // not connected
        var duration = const Duration(seconds: 2);
        return Timer(duration, noInternetPage);
      }
    } on SocketException catch (_) {
      if (kDebugMode) {
        print('not connected');
      }
      var duration = const Duration(seconds: 2);
      return Timer(duration, noInternetPage);
    }
  }

  void navigationPage() {
    Get.offAllNamed(Routes.home);
  }

  void noInternetPage() {
    Get.offAllNamed(Routes.noInternet);
  }

  void setUrlPage() {
    Get.offAllNamed(Routes.setUrlPage);
  }

}