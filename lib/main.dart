import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_acres_app/screens/map_screen.dart';
import 'package:real_acres_app/states/app_state.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(
    ChangeNotifierProvider<AppState>(
      // ignore: deprecated_member_use
      builder: (context) => AppState(),
      child: MyApp(),
    )
);

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
            body1: TextStyle(
                fontFamily: 'yantramanav'
            )
        ),
      ),
      home: Scaffold(
        body: SplashScreen(
          seconds: 3,
          navigateAfterSeconds: MapScreen(),
          title: Text('Real Acres',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.redAccent
            ),),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: TextStyle(),
          loaderColor: Colors.redAccent,
        ),
      ),
    );
  }
}