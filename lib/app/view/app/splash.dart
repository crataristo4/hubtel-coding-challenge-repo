import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/mainpage/main.page.dart';
import 'package:hubtel_coding_challenge_repo/app/widgets/app.custom.scroll.view.dart';
import 'package:hubtel_coding_challenge_repo/utils/functions.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    onWidgetBindingComplete(onComplete: () async {
      switchScreen(context: context, destination: MainPage.routeName, replace: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppCustomScrollView(
      hasScaffold: true,
      hasDefaultAppBarWithBack: false,
      slivers: [
        SliverFillRemaining(
          child: Center(child: Text('Test')),
        )
      ],
    );
  }
}
