import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class RedPortal extends StatefulWidget {
  RedPortal({Key? key}) : super(key: key);

  @override
  _RedPortalState createState() => _RedPortalState();
}

class _RedPortalState extends State<RedPortal> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 177, 34, 24),
        leading: Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back, size: 25),
            onPressed: () async {
              if (await _webViewController.canGoBack()) {
                _webViewController.goBack();
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        toolbarHeight: 40.0,
      ),
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('https://redportal.rs'),
          ),
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              useOnDownloadStart: true,
              javaScriptEnabled: true,
              cacheEnabled: true,
            ),
          ),
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;
          },
          onLoadStart: (InAppWebViewController controller, Uri? url) {
            if (url != null &&
                url.toString().startsWith('https://redportal.rs')) {
              SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
              ));
            } else {
              SystemChrome.setSystemUIOverlayStyle(
                  SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Colors.transparent,
              ));
            }
          },
        ),
      ),
    );
  }
}
