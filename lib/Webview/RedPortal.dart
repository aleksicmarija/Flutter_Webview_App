import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class RedPortal extends StatefulWidget {
  RedPortal({Key? key}) : super(key: key);

  @override
  _RedPortalState createState() => _RedPortalState();
}

class _RedPortalState extends State<RedPortal> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onBack.listen((_) async {
      if (await flutterWebviewPlugin.canGoBack()) {
        flutterWebviewPlugin.goBack();
      } else {
        Navigator.of(context).pop();
      }
    });
  }

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
              if (await flutterWebviewPlugin.canGoBack()) {
                flutterWebviewPlugin.goBack();
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        toolbarHeight: 40.0,
      ),
      body: SafeArea(
        child: WebviewScaffold(
          url: 'https://redportal.rs',
          withZoom: true,
          scrollBar: false,
          withLocalStorage: true,
          withJavascript: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: Container(),
          ),
        ),
      ),
    );
  }
}
