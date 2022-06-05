import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 80,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.teal, width: 3)),
                    child: const Text(
                      "Info",
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: "Panipuri",
                          color: Colors.grey),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
