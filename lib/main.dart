import 'package:flutter/material.dart';
import 'package:kalkulator/shared/theme.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(canvasColor: kBlackColor),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
