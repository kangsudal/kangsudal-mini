import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: HomeAppBar(),
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
