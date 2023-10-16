import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      debugShowCheckedModeBanner: false,
      home: Myhomepage(),
    );
  }
}

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomRight,
        child: Column(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                custombtn('9'),
                custombtn('8'),
                custombtn('7'),
                custombtn('+'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                custombtn('6'),
                custombtn('5'),
                custombtn('4'),
                custombtn('-'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                custombtn('3'),
                custombtn('2'),
                custombtn('1'),
                custombtn('*'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                custombtn('c'),
                custombtn('0'),
                custombtn('='),
                custombtn('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container custombtn(String val) {
    return Container(
      height: 60,
      width: 80,
      child: Expanded(
        child: ElevatedButton(
          onPressed: () => btnClicked(val),
          child: Text(
            val,
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 30, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
        ),
      ),
    );
  }

  late String res;
  String text = "";
  late int first, second;
  late String opp;

  btnClicked(String btntext) {
    if (btntext == "c") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "*" ||
        btntext == "/") {
      first = int.parse(text);
      res = "";
      opp = btntext;
    } else if (btntext == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }
      if (opp == "-") {
        res = (first - second).toString();
      }
      if (opp == "*") {
        res = (first * second).toString();
      }
      if (opp == "/") {
        res = (first / second).toString();
      }
    } else {
      res = int.parse(text + btntext).toString();
    }
    setState(() {
      text = res;
    });
  }
}
