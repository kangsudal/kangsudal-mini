import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kangsudal_mini/screens/MoreScreen.dart';
import 'package:kangsudal_mini/state/page_index.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  final List<Widget> _bodyOptions = <Widget>[
    const Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    const Text(
      'Index 1: 내자산',
      style: optionStyle,
    ),
    const Text(
      'Index 2: 더보기',
      style: optionStyle,
    ),
  ];

  final List<Widget> _appBarOptions = [
    Container(
      color: Colors.blue,
      height: 100,
      child: Column(
        children: [
          ListTile(
            dense: true,
            visualDensity: VisualDensity(vertical: 2),
            leading: const Text(
              'K-mini',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            trailing: Container(
              height: 50,
              width: 50,
              color: Colors.red,
              child: Row(
                children: const [
                  FaIcon(
                    FontAwesomeIcons.bullhorn,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  FaIcon(
                    FontAwesomeIcons.bell,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.grey,
          )),
        ],
      ),
    ),
    Container(
      color: Colors.amber,
      height: 100,
      child: Column(
        children: [
          ListTile(
            dense: true,
            visualDensity: VisualDensity(vertical: 2),
            leading: Text(
              'K-mini',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            trailing: Container(
              height: 50,
              width: 50,
              color: Colors.red,
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.bullhorn,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  FaIcon(
                    FontAwesomeIcons.bell,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.grey,
          )),
        ],
      ),
    ),
    Container(
      color: Colors.teal,
      height: 50,
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity(vertical: 2),
        leading: Text(
          'K-mini',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        trailing: Container(
          height: 50,
          width: 30,
          color: Colors.red,
          child: Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(bottomNavigatorSelectedIndex);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        // appBar: HomeAppBar(),
        body: ScaffoldOptions(selectedIndex: selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
              ),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.wallet,
              ),
              label: '내자산',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz,
              ),
              label: '더보기',
            ),
          ],
          onTap: (int selectedIdx) {
            ref
                .read(bottomNavigatorSelectedIndex.notifier)
                .update((state) => selectedIdx);
            if (selectedIdx == 1) {
              if (!ref.watch(isLogin)) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AuthScreen(),
                ));
              }
            }
          },
          currentIndex: selectedIndex,
        ),
      ),
    );
  }
}

class ScaffoldOptions extends ConsumerWidget {
  int selectedIndex;

  ScaffoldOptions({Key? key, required this.selectedIndex}) : super(key: key);
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (selectedIndex == 0) {
      return Scaffold(
        appBar: HomeAppBar(),
        body: ListView(
          children: [
            Center(
              child: const Text(
                'Index 0: Home',
                style: optionStyle,
              ),
            ),
          ],
        ),
      );
    } else if (selectedIndex == 1) {
      if (!ref.watch(isLogin)) {
        return Scaffold();
      }
      return Scaffold();
    } else if (selectedIndex == 2) {
      return MoreScreen();
    } else {
      return Scaffold();
    }
  }
}

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
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
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '간편인증 로그인',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
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
