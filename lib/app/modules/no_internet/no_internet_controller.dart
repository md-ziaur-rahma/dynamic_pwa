import 'dart:io';

import 'package:get/get.dart';
import 'package:pwaapp/app/routes/routes.dart';
import 'package:pwaapp/app/utils/my_sharedpreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NoInternetController extends GetxController{
  var isLoading = false.obs;

  void checkInternet()async {
    isLoading.value = true;
    update();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? url = localStorage.getString(MySharedPreference.sUrl);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if(url != null){
          MySharedPreference.url = url;
          Get.offAllNamed(Routes.home);
        } else {
          Get.offAllNamed(Routes.setUrlPage);
        }
      }else{
        Get.snackbar("Warning", "No Internet Connection!");
      }
    } on SocketException catch (_) {

    } finally {
      isLoading.value = false;
      update();
    }
  }
}