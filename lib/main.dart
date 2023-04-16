import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kangsudal_mini/screens/create_account_screen.dart';
import 'package:kangsudal_mini/screens/home_screen.dart';
import 'package:rive/rive.dart';

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
        scaffoldBackgroundColor: Colors.black,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.grey,
              displayColor: Colors.grey,
            ),
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
              length: 4,
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 300,
                    child: TabBarView(
                      children: [
                        riveWithText('assets/calendar.riv',
                            '원하는 기간동안\n적립식으로 꾸준히\n정기구매해요!'),
                        riveWithText(
                            'assets/coin.riv', '비싼 주식도\n천원부터 원하는 만큼\n구매해요!'),
                        riveWithText(
                            'assets/data.riv', '유명한 투자대가의\n포트폴리오를 보고\n투자해요!'),
                        riveWithText(
                            'assets/files.riv', '오늘 봐야하는\n투자정보만\n콕! 콕! 집어드려요!'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreateAccountScreen(),
                  ),
                );
              },
              child: Text(
                'KB증권이 처음이신가요?',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column riveWithText(String riv, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: 200,
            height: 200,
            child: RiveAnimation.asset(
              riv,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
