import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webviewnamokg/src/navigation_control.dart';
import 'package:webviewnamokg/src/web_view_stack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NAMO KG',
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: 'assets/logo_namokg.png',
        nextScreen: const WebViewApp(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        splashIconSize: 300.0,
      ),
    );
  }
}

Map<int, Color> color = {
  50: const Color.fromRGBO(255, 92, 87, .1),
  100: const Color.fromRGBO(255, 92, 87, .2),
  200: const Color.fromRGBO(255, 92, 87, .3),
  300: const Color.fromRGBO(255, 92, 87, .4),
  400: const Color.fromRGBO(255, 92, 87, .5),
  500: const Color.fromRGBO(255, 92, 87, .6),
  600: const Color.fromRGBO(255, 92, 87, .7),
  700: const Color.fromRGBO(255, 92, 87, .8),
  800: const Color.fromRGBO(255, 92, 87, .9),
  900: const Color.fromRGBO(255, 92, 87, 1),
};

MaterialColor colorCustom = MaterialColor(0xFFDC3545, color);

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: colorCustom),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('namo.kg'),
          actions: [
            NavigationControls(controller: controller),
            //Menu(controller: controller),
          ],
        ),
        body: WebViewStack(controller: controller),
      ),
    );
  }
}
