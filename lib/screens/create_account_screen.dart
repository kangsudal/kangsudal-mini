import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:kangsudal_mini/screens/home_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = 15.0;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('비대면 계좌개설'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'KB증권 x K-mini',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: fontSize,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'K',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'mini',
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 23,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: fontSize,
                      ),
                      children: [
                        TextSpan(
                          text: 'K-mini는',
                        ),
                        TextSpan(
                          text: '회원가입없이\n',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        TextSpan(text: '계좌개설만으로 모든 개인화 서비스를\n'),
                        TextSpan(text: '이용할 수 있습니다.'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(
                      vertical: 50,
                      horizontal: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RichText(
                      // textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: fontSize,
                        ),
                        children: [
                          TextSpan(
                            text: '대상고객\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '계좌를 개설하고자 하는 본인\n\n',
                          ),
                          TextSpan(
                            text: '계좌개설 가능시간\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: '365일 24시간\n\n'),
                          TextSpan(
                            text: '대상고객\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '계좌를 개설하고자 하는 본인\n\n',
                          ),
                          TextSpan(
                            text: '계좌개설 가능시간\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: '365일 24시간\n\n'),
                          TextSpan(
                            text: '대상고객\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '계좌를 개설하고자 하는 본인\n\n',
                          ),
                          TextSpan(
                            text: '계좌개설 가능시간\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: '365일 24시간\n\n'),
                          TextSpan(
                            text: '대상고객\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '계좌를 개설하고자 하는 본인\n\n',
                          ),
                          TextSpan(
                            text: '계좌개설 가능시간\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: '365일 24시간\n\n'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 15,
            right: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                // width: 100,
                height: 50,
                child: Center(
                  child: Text(
                    'KB증권 계좌만들기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: BubbleSpecialThree(
              text: '최초 신규고객 계좌개설 시 1만원 쿠폰드려요!',
              color: Color(0xFF1B97F3),
              tail: true,
              textStyle: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
