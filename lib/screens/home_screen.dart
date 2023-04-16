import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kangsudal_mini/screens/auth_screen.dart';
import 'package:kangsudal_mini/screens/bookmark_screen.dart';
import 'package:kangsudal_mini/screens/create_account_screen.dart';
import 'package:kangsudal_mini/screens/decimal_point_stock_screen.dart';
import 'package:kangsudal_mini/screens/more_screen.dart';
import 'package:kangsudal_mini/state/page_index.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(bottomNavigatorSelectedIndex);
    return SafeArea(
      child: Scaffold(
        body: ScaffoldOptions(selectedIndex: selectedIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.house,
                ),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.chartLine,
                ),
                label: '찜한주식',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.more_horiz,
                ),
                label: '더보기',
              ),
            ],
            onTap: (int selectedIdx) {
              //내자산 탭을 눌렀을때 로그인 상태가 아니면 탭을 바꾸지않고 인증페이지로 이동한다.
              if (selectedIdx == 1 && ref.watch(isLogin) == false) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AuthScreen(),
                  ),
                );
              } else {
                //로그인 상태면 탭을 바꿔준다.
                ref
                    .read(bottomNavigatorSelectedIndex.notifier)
                    .update((state) => selectedIdx);
              }
            },
            currentIndex: selectedIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: _selectedColor(selectedIndex),
          ),
        ),
      ),
    );
  }

  Color _selectedColor(int selectedIndex) {
    if (selectedIndex == 0) {
      return Colors.tealAccent;
    } else if (selectedIndex == 1) {
      return Colors.deepPurpleAccent;
    } else {
      return Colors.indigo;
    }
  }
}

class ScaffoldOptions extends ConsumerWidget {
  final int selectedIndex;

  const ScaffoldOptions({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (selectedIndex == 0) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: HomeAppBar(),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          children: [
            ref.watch(isLogin) ? LogInedCard() : PurpleCard(),
            SizedBox(
              height: 75,
            ),
            horizontalServices(context),
            SizedBox(
              height: 55,
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.seedling,
                color: Colors.green,
              ),
              title: Text(
                '1주를 완성해 보세요!',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.angleRight,
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '국내, 해외주식을\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      children: [
                        TextSpan(
                          text: '천원부터 ',
                        ),
                        TextSpan(
                          text: '원하는 금액만큼!',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FaIcon(
                    FontAwesomeIcons.cartShopping,
                    size: 100,
                    color: Colors.redAccent,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DecimalPointStockScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // width: 100,
                      height: 50,
                      child: Center(
                        child: Text(
                          '소수점 주식 보기',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (selectedIndex == 1) {
      return BookMarkScreen();
    } else {
      //if (selectedIndex == 2)
      return MoreScreen();
    }
  }

  Container horizontalServices(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FaIcon(
                  FontAwesomeIcons.seedling,
                  color: Colors.green,
                ),
                Text(
                  '천원부터',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FaIcon(
                  FontAwesomeIcons.calendar,
                  color: Colors.grey,
                ),
                Text(
                  '천원부터',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FaIcon(
                  FontAwesomeIcons.seedling,
                  color: Colors.green,
                ),
                Text(
                  '천원부터',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FaIcon(
                  FontAwesomeIcons.calendar,
                  color: Colors.grey,
                ),
                Text(
                  '천원부터',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
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
        ],
      ),
    );
  }
}

class PurpleCard extends StatelessWidget {
  const PurpleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '항상 멀리 내다봐라.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '워렌 버핏',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AuthScreen(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              // width: 100,
              height: 50,
              child: Center(
                child: Text(
                  '로그인',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(height: 8,),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateAccountScreen(),
                ),
              );
            },
            child: Text(
              'K-mini가 처음이신가요?',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LogInedCard extends StatefulWidget {
  const LogInedCard({Key? key}) : super(key: key);

  @override
  State<LogInedCard> createState() => _LogInedCardState();
}

class _LogInedCardState extends State<LogInedCard> {
  bool _notifications = true;
  int _totalValue = 5770000;
  var f = NumberFormat('###,###,###,###');
  String customerName = '강수경';

  void _onNotificationsChanged(bool? newCheckValue) {
    if (newCheckValue == null) return;
    setState(() {
      _notifications = newCheckValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '총 자산',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Switch(
                value: _notifications,
                onChanged: _onNotificationsChanged,
                inactiveTrackColor: Colors.white60,
                activeColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: _notifications
                ? Text(
                    f.format(_totalValue),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  )
                : Text(
                    '총자산 금액 숨김',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 25,
                    ),
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            // height: 100,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$customerName님의',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '투자가능금액',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      child: Text(
                        '충전',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  // color: Colors.grey,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xff424a63),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              '800,000원',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width * 0.27,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade700,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 10,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '₩',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      leadingWidth: 0,
      title: GestureDetector(
        child: Text(
          'K-mini',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        onTap: () {
          print("clicked");
        },
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print('clicked');
            // Navigator.pushNamed(context, '/notification');
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 7.0, right: 8),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                FaIcon(
                  FontAwesomeIcons.bullhorn,
                  size: 28,
                ),
                Positioned(
                  child: SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text(
                        'N',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                    height: 15,
                    width: 15,
                  ),
                  top: 3,
                  right: -6,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print('clicked');
            // Navigator.pushNamed(context, '/notification');
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 8),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none,
                  size: 35,
                ),
                Positioned(
                  child: SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text(
                        'N',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                    height: 15,
                    width: 15,
                  ),
                  top: 3,
                  right: 3,
                ),
              ],
            ),
          ),
        ),
      ],
      elevation: 0,
      // backgroundColor: Colors.white,
    );
  }

  SizedBox buildComponentButton(
    BuildContext context,
    String title,
    double width,
    double height,
  ) {
    return SizedBox(
      width: width,
      height: height,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        color: Theme.of(context).primaryColor,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: () {},
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2);
}
