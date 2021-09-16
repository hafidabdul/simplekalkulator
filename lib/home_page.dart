import 'package:flutter/material.dart';
import 'package:kalkulator/shared/theme.dart';
import 'package:kalkulator/tentang_page.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == 'x²') {
        expression = equation;

        Parser p = Parser();
        Expression exp = p.parse(expression);
        Power xSquare = Power(exp, 2);
        ContextModel cm = ContextModel();
        result = '${xSquare.evaluate(EvaluationType.REAL, cm)}';
      } else if (buttonText == '√x') {
        expression = equation;

        Parser p = Parser();
        Expression exp = p.parse(expression);
        Root xRoot = Root.sqrt(exp);
        ContextModel cm = ContextModel();
        result = '${xRoot.evaluate(EvaluationType.REAL, cm)}';
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buttonKecil(String buttonText) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * 0.6,
      child: TextButton(
        onPressed: () {},
        child: Text(
          buttonText,
          style: whiteTextStyle.copyWith(fontSize: 18),
        ),
      ),
    );
  }

  Widget buttonBesar(String buttonText, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * 0.7,
      margin: EdgeInsets.all(2),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: medium,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  Navigator.pop(context);
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
            "Standart",
            style: whiteTextStyle.copyWith(fontWeight: bold),
          ),
          iconTheme: IconThemeData(color: kWhiteColor),
          actions: [
            Container(
                margin: EdgeInsets.only(right: 10), child: Icon(Icons.history))
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(2),
          child: Column(
            children: [
              Expanded(
                child: Divider(),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(
                  equation,
                  style: whiteTextStyle.copyWith(fontSize: 40),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Text(
                  result,
                  style: whiteTextStyle.copyWith(fontSize: 40),
                ),
              ),
              Table(
                children: [
                  TableRow(children: [
                    buttonKecil("MC"),
                    buttonKecil("MR"),
                    buttonKecil("M+"),
                    buttonKecil("M-"),
                    buttonKecil("MS"),
                    buttonKecil("M-")
                  ]),
                ],
              ),
              Table(
                children: [
                  TableRow(children: [
                    buttonBesar('%', kGreyColor),
                    buttonBesar('CE', kGreyColor),
                    buttonBesar('C', kGreyColor),
                    buttonBesar('⌫', kGreyColor),
                  ]),
                  TableRow(children: [
                    buttonBesar('1/x', kGreyColor),
                    buttonBesar('x²', kGreyColor),
                    buttonBesar('√x', kGreyColor),
                    buttonBesar('÷', kGreyColor),
                  ]),
                  TableRow(children: [
                    buttonBesar('7', kBlackColor),
                    buttonBesar('8', kBlackColor),
                    buttonBesar('9', kBlackColor),
                    buttonBesar('×', kGreyColor),
                  ]),
                  TableRow(children: [
                    buttonBesar('4', kBlackColor),
                    buttonBesar('5', kBlackColor),
                    buttonBesar('6', kBlackColor),
                    buttonBesar('-', kGreyColor),
                  ]),
                  TableRow(children: [
                    buttonBesar('1', kBlackColor),
                    buttonBesar('2', kBlackColor),
                    buttonBesar('3', kBlackColor),
                    buttonBesar('+', kGreyColor),
                  ]),
                  TableRow(children: [
                    buttonBesar('+/-', kBlackColor),
                    buttonBesar('0', kBlackColor),
                    buttonBesar(',', kBlackColor),
                    buttonBesar('=', kGreenColor),
                  ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
