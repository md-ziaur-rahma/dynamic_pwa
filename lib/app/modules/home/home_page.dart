import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pwaapp/app/modules/home/home_controller.dart';
import 'package:pwaapp/app/utils/my_sharedpreferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return SafeArea(
                child: WillPopScope(
                  onWillPop: () => controller.onWillPop(),
                  child: RefreshIndicator(
                    key: controller.refreshIndicatorKey,
                    color: Colors.indigo,
                    onRefresh: () => controller.reload(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        LayoutBuilder(
                            builder: (context,constraints){
                              if (controller.progressValue == 100) {
                                return const SizedBox(
                                  height: 0,
                                );
                              }  else {
                                return SizedBox(
                                  width: double.infinity,
                                  height: 3,
                                  child: LinearProgressIndicator(
                                    value: controller.progressValue/100,
                                    minHeight: 3,
                                    backgroundColor : Colors.grey,
                                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.indigo,),
                                  ),
                                  // return const SizedBox(
                                  //   width: 16,
                                  //   height: 16,
                                  //   child: Center(
                                  //     child: CircularProgressIndicator(
                                  //       strokeWidth: 2,
                                  //       color: Colors.deepOrange,
                                  //     ),
                                  //   )
                                );
                              }
                            }
                        ),
                        Expanded(
                          child: WebView(
                            javascriptMode: JavascriptMode.unrestricted,
                            initialUrl: MySharedPreference.url,
                            onWebViewCreated: (WebViewController webViewController) {
                              controller.controllerCompleter.future.then((value) => controller.webViewController = value);
                              controller.controllerCompleter.complete(webViewController);
                            },
                            onProgress: (int progress) {
                              controller.changeProgressValue(progress.toDouble());
                            },

                            javascriptChannels: <JavascriptChannel>{
                              controller.toasterJavascriptChannel(),
                            },

                            navigationDelegate: (NavigationRequest request) {
                              return NavigationDecision.navigate;
                            },
                            onPageStarted: (String url) {
                              // print('Page started loading: $url');
                            },
                            onPageFinished: (String url) {
                              // print('Page finished loading: $url');
                            },
                            gestureNavigationEnabled: true,
                          ),
                        )
                      ],
                    ),
                  ),
                )
            );
          }
      ),
    );
  }
}

