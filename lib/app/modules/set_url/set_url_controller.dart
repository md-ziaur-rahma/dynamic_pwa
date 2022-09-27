import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pwaapp/app/routes/routes.dart';
import 'package:pwaapp/app/utils/my_sharedpreferences.dart';

class SetUrlController extends GetxController {
  var urlController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? validationName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter a URL';
    }else {
      return null;
    }
  }

  void goHome() async {
    MySharedPreference.saveData(MySharedPreference.sUrl, urlController.text);
    MySharedPreference.url = urlController.text;
    Get.offAllNamed(Routes.home);
  }
}