import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kangsudal_mini/screens/HomeScreen.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kangsudal mini',
      theme: ThemeData(
        primaryColor: Colors.yellowAccent,
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: TabBarView(
                      children: [
                        Placeholder(),
                        Placeholder(),
                        Placeholder(),
                      ],
                    ),
                  ),
                  TabPageSelector(
                    borderStyle: BorderStyle.none,
                    color: Colors.grey,
                    selectedColor: Colors.grey.shade100,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
            CupertinoButton(
              child: Text(
                '시작하기',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'KB증권이 처음이신가요?',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
