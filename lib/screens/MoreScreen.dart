import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Text('더보기'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 13,
                ),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'K-mini 시작하기 >',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.lock,
                                color: Colors.red,
                              ),
                              Text(
                                '인증/보안',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.gift,
                                color: Colors.deepPurpleAccent,
                              ),
                              Text(
                                '선물함',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.ticket,
                                color: Colors.teal,
                              ),
                              Text(
                                '쿠폰함',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.champagneGlasses,
                                color: Colors.amber,
                              ),
                              Text(
                                '이벤트',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.headphones,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                '고객서비스',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
