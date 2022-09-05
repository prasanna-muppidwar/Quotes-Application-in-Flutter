// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui_villa/error.dart';
import 'package:ui_villa/home_screen.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart'
    show ImageSlideshow;
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prasannas Ui Journey',
      home: const MyHomePage(title: 'HELLO'),
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImageSlideshow(
              width: double.infinity,
              height: 200,
              initialPage: 0,
              indicatorColor: Colors.black,
              indicatorBackgroundColor: Colors.grey,
              onPageChanged: (value) {
                debugPrint('Page changed: $value');
              },
              autoPlayInterval: 4000,
              isLoop: true,
              children: [
                const Image(
                  image: NetworkImage(
                      'https://ouch-cdn2.icons8.com/rzBZfO7W7iibElskbWhs7FkRmd13ucyJkdfYDmW9Qhs/rs:fit:256:198/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNDQ2/LzQ0Njg4OWZlLTYy/MzMtNGYwOC04ODkx/LTNiNWM4ZDYyMmMx/YS5wbmc.png'),
                  fit: BoxFit.contain,
                  height: 100,
                  width: 100,
                ),
                const Image(
                  image: NetworkImage(
                      'https://ouch-cdn2.icons8.com/RUP-0M2Tyvgu2WfJIsQKovXw1aRJjiidqeVwZ77YApE/rs:fit:256:283/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNzE2/L2M3MDkyZmM4LWM1/ZDAtNGIyMy04NzYw/LWRlNWJkNzRhZjVl/OC5wbmc.png'),
                  fit: BoxFit.contain,
                  height: 100,
                  width: 100,
                ),
                const Image(
                  image: NetworkImage(
                      'https://ouch-cdn2.icons8.com/vFUoaFbe0ixsXA8RR02Eip053X_rC17LEgH3lkzK-Io/rs:fit:256:232/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMTMw/L2EwODZkNGJhLWZi/ODAtNDAxMi05NjYy/LTQxOTBmMTg4YTE5/ZS5wbmc.png'),
                  fit: BoxFit.contain,
                  height: 100,
                  width: 100,
                ),
                const Image(
                  image: NetworkImage(
                      'https://ouch-cdn2.icons8.com/RHLUDRZdyGfSkWhHk7lh6gxORriUeRUG4d6KpRRv1eQ/rs:fit:256:238/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNjEw/L2FiMmVmMTVkLTNj/MWQtNGRkOS1hNDRk/LWRiYzNlNmM1M2Y2/ZC5wbmc.png'),
                  fit: BoxFit.contain,
                  height: 100,
                  width: 100,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'Quotes App! ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color.fromARGB(255, 1, 1, 1)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: Text(
                'Find Quotes that change Life!',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                    color: Colors.grey.shade900),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = Uri.parse(
                    'https://goquotes-api.herokuapp.com/api/v1/random?count=1');
                var response = await http.get(
                  url,
                );
                //print('Response status: ${response.statusCode}');
                //print('Response body: ${response.body}');
                var data = jsonDecode(response.body);
                // ignore: unused_local_variable
                String quote = data["quotes"][0]["text"];
                // ignore: unused_local_variable
                String author = data["quotes"][0]["author"];

                // ignore: use_build_context_synchronously
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SecondRoute(
                          quoteText: quote,
                          authorName: author,
                        )));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 4, 4, 4),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                shadowColor: const Color.fromARGB(255, 0, 0, 0),
                minimumSize: const Size(400, 45),
              ),
              child: const Text('Get Quotes!'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            ),
            ElevatedButton(
              onPressed: _dismiss,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                foregroundColor: const Color.fromARGB(255, 4, 4, 4),
                minimumSize: const Size(400, 45),
                shadowColor: null,
              ),
              child: const Text('Dismiss'),
            ),
            const Text('')
          ],
        ),
      ),
    ));
  }

  //void _onPressed() {
  //Navigator.push(
  //  context,
  //  MaterialPageRoute(builder: (context) => const SecondRoute()),
  //);
  //}//

  void _dismiss() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ThirdRoute()),
    );
  }
}
