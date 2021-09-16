import 'package:flutter/material.dart';
import 'package:kalkulator/home_page.dart';
import 'package:kalkulator/shared/theme.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(canvasColor: kBlackColor),
        home: Scaffold(
          backgroundColor: kBackgroundColor,
          drawer: Drawer(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Kalkulator',
                    style: whiteTextStyle.copyWith(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
                ListTile(
                  title: Text(
                    'Tentang saya',
                    style: whiteTextStyle.copyWith(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TentangPage()));
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Tentang Saya",
              style: whiteTextStyle.copyWith(fontWeight: bold),
            ),
            iconTheme: IconThemeData(color: kWhiteColor),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: double.infinity,
                  child: Text(
                    "BY HAFID",
                    style: whiteTextStyle.copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
