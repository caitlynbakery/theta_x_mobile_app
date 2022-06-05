import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
                    onPressed: () async {
                      print('press button!');
                      var url = Uri.parse('http://192.168.1.1/osc/info');

                      var response = await http.get(url);
                      print(response.body);
                    },
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 80,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.teal, width: 3)),
                    child: const Text(
                      "State",
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: "Panipuri",
                          color: Colors.grey),
                    ),
                    onPressed: () async {
                      print('press button!');
                      var url = Uri.parse('http://192.168.1.1/osc/state');
                      var header = {
                        'Content-Type': 'application/json;charset=utf-8'
                      };
                      var response = await http.post(url, headers: header);
                      print(response.body);
                    },
                  ),
                ),
              ],
            ),
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
                      "Take Pic",
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: "Panipuri",
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () async {
                      print('press button!');
                      var url =
                          Uri.parse('http://192.168.1.1/osc/commands/execute');
                      var header = {
                        'Content-Type': 'application/json;charset=utf-8'
                      };
                      var bodyMap = {
                        'name': 'camera.takePicture',
                      };
                      var bodyJson = jsonEncode(bodyMap);
                      var response =
                          await http.post(url, headers: header, body: bodyJson);
                      print(response.body);
                    },
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
