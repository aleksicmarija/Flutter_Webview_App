import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class RedPortal extends StatefulWidget {
  RedPortal({Key? key}) : super(key: key);

  @override
  State<RedPortal> createState() => _RedPortal();
}

class _RedPortal extends State<RedPortal> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://redportal.rs',
    );
  }
}
