import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kangsudal_mini/screens/auth_screen.dart';
import 'package:kangsudal_mini/screens/create_account_screen.dart';
import 'package:kangsudal_mini/state/page_index.dart';

class MoreScreen extends ConsumerWidget {
  MoreScreen({Key? key}) : super(key: key);

  List<String> items = [
    '해외주식 배당 내역',
    '해외주식 배당옵션',
    '양도소득세 조회/신청',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double sliverHorizontalGaps = 25;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
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
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
              vertical: 10,
            ),
            sliver: SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ref.watch(isLogin) == true
                              ? Text(
                                  '강수경님',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CreateAccountScreen(),
                                    ),
                                  ),
                                  child: Text(
                                    'K-mini 시작하기 >',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                          GestureDetector(
                            onTap: () {
                              if (ref.watch(isLogin) == false) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AuthScreen(),
                                  ),
                                );
                              } else {
                                ref
                                    .read(isLogin.notifier)
                                    .update((state) => false);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Text(
                                ref.watch(isLogin) == false ? '로그인' : '로그아웃',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
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
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
            ),
            sliver: SliverPersistentHeader(
                delegate: CustomDelegate(), pinned: true),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
              // vertical: 10,
            ),
            sliver: SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                childCount: items.length,
                (context, index) => Container(
                  child: Text(
                    items[index],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              itemExtent: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
            ),
            sliver: SliverPersistentHeader(
                delegate: CustomDelegate(), pinned: true),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
              // vertical: 10,
            ),
            sliver: SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                childCount: items.length,
                (context, index) => Container(
                  child: Text(
                    items[index],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              itemExtent: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
            ),
            sliver: SliverPersistentHeader(
                delegate: CustomDelegate(), pinned: true),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
              // vertical: 10,
            ),
            sliver: SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                childCount: items.length,
                (context, index) => Container(
                  child: Text(
                    items[index],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              itemExtent: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
            ),
            sliver: SliverPersistentHeader(
                delegate: CustomDelegate(), pinned: true),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
              // vertical: 10,
            ),
            sliver: SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                childCount: items.length,
                (context, index) => Container(
                  child: Text(
                    items[index],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              itemExtent: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
            ),
            sliver: SliverPersistentHeader(
                delegate: CustomDelegate(), pinned: true),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
              // vertical: 10,
            ),
            sliver: SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                childCount: items.length,
                (context, index) => Container(
                  child: Text(
                    items[index],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              itemExtent: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
            ),
            sliver: SliverPersistentHeader(
                delegate: CustomDelegate(), pinned: true),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
              // vertical: 10,
            ),
            sliver: SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                childCount: items.length,
                (context, index) => Container(
                  child: Text(
                    items[index],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              itemExtent: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
            ),
            sliver: SliverPersistentHeader(
                delegate: CustomDelegate(), pinned: true),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: sliverHorizontalGaps,
              // vertical: 10,
            ),
            sliver: SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                childCount: items.length,
                (context, index) => Container(
                  child: Text(
                    items[index],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              itemExtent: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return FractionallySizedBox(
      heightFactor: 1,
      child: Container(
        color: Colors.black,
        child: Text(
          '배당 및 세금',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 30;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
