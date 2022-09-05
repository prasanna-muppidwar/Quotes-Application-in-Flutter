// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  String quoteText;
  String authorName;
  // ignore: prefer_const_constructors_in_immutables
  SecondRoute({Key? key, required this.authorName, required this.quoteText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes App'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                quoteText,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                ),
              )),
          Text(
            "~$authorName",
            style: const TextStyle(
                color: Color.fromARGB(255, 65, 65, 65), fontSize: 18),
          ),
        ],
      ),
    );
  }
}
