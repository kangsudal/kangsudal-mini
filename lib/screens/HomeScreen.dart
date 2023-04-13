import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kangsudal_mini/state/page_index.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: 내자산',
      style: optionStyle,
    ),
    Text(
      'Index 2: 더보기',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(bottomNavigatorSelectedIndex);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: HomeAppBar(),
        body: Center(child: _widgetOptions.elementAt(selectedIndex)),
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
          },
          currentIndex: selectedIndex,
        ),
      ),
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
            Navigator.pushNamed(context, '/notification');
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
        )
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
