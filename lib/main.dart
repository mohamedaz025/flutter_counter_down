// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Counterdown(),
    );
  }
}

class Counterdown extends StatefulWidget {
  const Counterdown({super.key});

  @override
  State<Counterdown> createState() => _CounterdownState();
}

//  هنا نكتب الكلاس
class _CounterdownState extends State<Counterdown> {
//  هنا نعرف المتغيرات ونضع الليست ونكتب الفونكشون
  int seconds = 7;
  Timer? stoptimer;
  starttimer() {
    stoptimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // هنا نكتب الفونكشون عند بدء التشغيل
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//  هنا نكتب الاب بار والبودي والزر الاعائم
// appBar: AppBar(
//   title: Text("Counterdown"),
// ),
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (seconds > 0) ? seconds.toString().padLeft(2, "0") : "👇",
            style: (seconds > 0)
                ? TextStyle(color: Colors.white, fontSize: 60)
                : TextStyle(fontSize: 50),
          ),
          SizedBox(height: 10),
          Text(
            "seconds",
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  starttimer();
                  if (seconds == 0) {
                    setState(() {
                      seconds = 7;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                child: Text(
                  "start Timer",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 22,
              ),
              ElevatedButton(
                onPressed: () {
                  stoptimer!.cancel();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                child: Text(
                  "stop timer",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
