import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/mainpage/tabs/history/history.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/mainpage/tabs/home.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/mainpage/tabs/schedule.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/mainpage/tabs/send.dart';
import 'package:hubtel_coding_challenge_repo/app/widgets/app.custom.scroll.view.dart';
import 'package:hubtel_coding_challenge_repo/generated/assets.gen.dart';
import 'package:hubtel_coding_challenge_repo/generated/l10n.dart';
import 'package:hubtel_coding_challenge_repo/utils/constants/dimens.dart';
import 'package:hubtel_coding_challenge_repo/utils/widget.extensions.dart';

class MainPage extends StatefulWidget {
  static const String routeName = "main.page";
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, dynamic>> _navItems = [
    {"label": S.current.home, "icon": Assets.svg.home.path},
    {"label": S.current.send, "icon": Assets.svg.send.path},
    {"label": S.current.history, "icon": Assets.svg.history.path},
    {"label": S.current.scheduled, "icon": Assets.svg.schedule.path},
  ];

  int _selectedIndex = 0;
  String? title = '';

  ///Bottom navigation screens
  final List<Widget> _bottomNavScreens = <Widget>[
    const Home(),
    Send(),
    History(),
    Schedule(),
  ];

  @override
  Widget build(BuildContext context) {
    return AppCustomScrollView(
      hasScaffold: true,
      bottomNavigation: AnimatedBottomNavigationBar.builder(
        //height: 70,
        //gapWidth: 90, //default 72
        itemCount: _navItems.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.black : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _navItems[index]['icon'].toString().asSvg(
                    size: isActive ? twentyFourDp : twentyDp,
                    color: color,
                  ),
              fourDp.verticalSpace,
              Text(
                _navItems[index]['label'],
                maxLines: 1,
                style: TextStyle(
                  color: color,
                  fontSize: isActive ? twelveDp.sp : tenDp.toInt().sp,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                ),
              )
            ],
          );
        },
        activeIndex: _selectedIndex,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapLocation: GapLocation.none,
        onTap: (index) {
          switch (index) {
            case 0:
            case 1:
              break;

            case 2:
            case 3:
            case 4:
              title = _navItems[index]['label'];
              break;
          }

          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}
