import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kangsudal_mini/screens/AuthScreen.dart';
import 'package:kangsudal_mini/screens/MoreScreen.dart';
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
              //내자산 탭을 눌렀을때 로그인 상태가 아니면 탭을 바꾸지않고 인증페이지로 이동한다.
              if (selectedIdx == 1) {
                if (!ref.watch(isLogin)) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AuthScreen(),
                    ),
                  );
                }
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
