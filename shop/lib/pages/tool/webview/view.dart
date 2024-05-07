import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'logic.dart';

class WebviewPage extends StatelessWidget {
  WebviewPage({Key? key}) : super(key: key);

  final logic = Get.find<WebviewLogic>();
  final state = Get.find<WebviewLogic>().state;


  @override
  Widget build(BuildContext context) {
    final argumentData = Get.arguments as String;
    final WebViewController _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
          NavigationDelegate(
              onProgress: (int progress) {
                debugPrint('WebView is loading (progress : $progress%)');
              },
              onPageStarted: (String url) {
                debugPrint('Page started loading: $url');
              },
              onPageFinished: (String url) {
                debugPrint('Page finished loading: $url');
              },
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                debugPrint('blocking navigation to ${request.url}');
                return NavigationDecision.prevent;
              }
              debugPrint('allowing navigation to ${request.url}');
              return NavigationDecision.navigate;
            },
            onUrlChange: (UrlChange change) {
              debugPrint('url change to ${change.url}');
            },
            onHttpAuthRequest: (HttpAuthRequest request) {

            },
          )
      )
    ..loadRequest(Uri.parse("https://www.baidu.com"));
    return Scaffold(
        appBar: AppBar(
          title: Text(argumentData),
        ),
        body: WebViewWidget(controller: _controller,)
    );
  }
}
