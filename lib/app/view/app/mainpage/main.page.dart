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
import 'package:hubtel_coding_challenge_repo/utils/constants/theme.colors.dart';
import 'package:hubtel_coding_challenge_repo/utils/widget.extensions.dart';

class MainPage extends StatefulWidget {
  static const String routeName = "main.page";
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, dynamic>> _navItems = [
    {"label": '', "icon": Assets.images.home.path},
    {"label": S.current.send, "icon": Assets.images.send.path},
    {"label": S.current.history, "icon": Assets.images.history.path},
    {"label": S.current.scheduled, "icon": Assets.images.schedule.path},
  ];

  int _selectedIndex = 0;
  String? title = '';

  ///Bottom navigation screens
  final List<Widget> _bottomNavScreens = const <Widget>[
    Home(),
    Send(),
    History(),
    Schedule(),
  ];

  @override
  Widget build(BuildContext context) {
    return AppCustomScrollView(
      hasScaffold: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          child: _bottomNavScreens.elementAt(_selectedIndex),
        )
      ],
      bottomNavigation: AnimatedBottomNavigationBar.builder(
        height: eightyDp,
        itemCount: _navItems.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.black : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (index == 0) ...{
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: fortyDp,
                      height: fortyDp,
                      padding: const EdgeInsets.all(tenDp),
                      margin: const EdgeInsets.only(top: tenDp),
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: ThemeColor.kLightGreen),
                      child: _navItems[0]['icon'].toString().asAssetImage(
                            size: isActive ? twentyFourDp : twentyDp,
                          ),
                    ),
                    tenDp.horizontalSpace,
                    Container(
                      height: fortyDp,
                      width: 1,
                      color: ThemeColor.kGreyLight,
                    )
                  ],
                )
              } else ...{
                _navItems[index]['icon'].toString().asAssetImage(
                      size: isActive ? twentyFourDp : twentyDp,
                    ),
              },
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
