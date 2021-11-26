//import 'package:crip/src/pages/home.dart';
import 'package:crip/src/pages/home.dart';
import 'package:crip/src/pages/view.dart';
import 'package:crip/src/provider/id.dart';
import 'package:flutter/material.dart';
//provider
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<info>(
      create: (_) => info(),
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (context) => Home(),
          'view': (context) => View(''),
        },
      ),
    );
  }
}

class Homepage {}
