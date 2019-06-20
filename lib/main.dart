import 'package:flutter/material.dart';
import 'package:nestle_app/bloc/bloc_provider.dart';
import 'package:nestle_app/bloc/main_bloc.dart';
import 'package:nestle_app/pages/help.dart';
import 'package:nestle_app/pages/home.dart';
import 'package:nestle_app/pages/index.dart';
import 'package:nestle_app/pages/login.dart';
import 'package:nestle_app/pages/scan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: MainBloc(),
      child: MaterialApp(
        title: 'Nestle',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => LoginPage(),
          '/index': (BuildContext context) => IndexPage(),
          '/home': (BuildContext context) => HomePage(),
          '/scan': (BuildContext context) => ScanPage(),
          '/help': (BuildContext context) => HelpPage(),
        },
      ),
    );
  }
}
