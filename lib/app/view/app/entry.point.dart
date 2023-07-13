import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/splash.dart';
import 'package:hubtel_coding_challenge_repo/app/widgets/dismiss.keyboard.dart';
import 'package:hubtel_coding_challenge_repo/generated/l10n.dart';
import 'package:hubtel_coding_challenge_repo/route/route.generator.dart';

class ClientEntryPoint extends StatefulWidget {
  const ClientEntryPoint({super.key});

  @override
  State<ClientEntryPoint> createState() => _ClientEntryPointState();
}

class _ClientEntryPointState extends State<ClientEntryPoint> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      rebuildFactor: (old, data) => true,
      useInheritedMediaQuery: true,
      splitScreenMode: false,
      builder: (BuildContext context, Widget? child) {
        return const DismissKeyboard(
          child: MaterialApp(
            localizationsDelegates: [
              AppLocalizationDelegate(),
            ],
            title: 'Hubtel coding challenge',
            themeMode: ThemeMode.system,
            initialRoute: SplashScreen.routeName,
            onGenerateRoute: RouteGenerator.generateRoute,
            debugShowCheckedModeBanner: false,
            scrollBehavior: CupertinoScrollBehavior(),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
