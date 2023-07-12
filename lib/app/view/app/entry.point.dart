import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/splash.dart';
import 'package:hubtel_coding_challenge_repo/app/widgets/dismiss.keyboard.dart';
import 'package:hubtel_coding_challenge_repo/generated/l10n.dart';
import 'package:hubtel_coding_challenge_repo/l10n/L10n.dart';
import 'package:hubtel_coding_challenge_repo/route/route.generator.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      rebuildFactor: (old, data) => true,
      useInheritedMediaQuery: true,
      splitScreenMode: false,
      builder: (BuildContext context, Widget? child) {
        return DismissKeyboard(
          child: MaterialApp(
            localizationsDelegates: const [
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            title: 'Hubtel coding challenge',
            locale: Locale('en'),
            themeMode: ThemeMode.system,
            supportedLocales: L10n.all,
            initialRoute: SplashScreen.routeName,
            onGenerateRoute: RouteGenerator.generateRoute,
            debugShowCheckedModeBanner: false,
            scrollBehavior: const CupertinoScrollBehavior(),
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
