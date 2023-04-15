import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kangsudal_mini/state/page_index.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            //VerticalDivider는 SizedBox의 height을 필요로한다.
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '인증/OTP',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  VerticalDivider(
                    width: 20,
                    thickness: 0.3,
                    indent: 19,
                    endIndent: 15,
                    color: Colors.white,
                  ),
                  Text(
                    'KB증권 계좌개설',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'K-mini',
                  style: TextStyle(
                    fontSize: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 13,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GestureDetector(
                    child: Text(
                      '간편인증 로그인',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onTap: () {
                      ref.read(isLogin.notifier).update((state) => true);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
