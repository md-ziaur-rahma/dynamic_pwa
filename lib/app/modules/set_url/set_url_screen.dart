import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pwaapp/app/modules/set_url/set_url_controller.dart';

class SetUrlScreen extends StatelessWidget {
  const SetUrlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      body: GetBuilder<SetUrlController>(
        init: SetUrlController(),
        builder: (controller){
          return Center(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      validator: controller.validationName,
                      controller: controller.urlController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      onFieldSubmitted: (value){
                        if (controller.formKey.currentState!.validate()) {
                          controller.goHome();
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                        hintText: "Url",
                        hintStyle: const TextStyle(color: Color(0xff989eb1),fontWeight: FontWeight.w400,fontSize: 14),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff35424a)),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.withOpacity(0.7)),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff989eb1)),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff989eb1)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                      onPressed: (){
                        if (controller.formKey.currentState!.validate()) {
                          controller.goHome();
                        }
                      },
                      child: const Text("Save & Continue",style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
