import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/entry.point.dart';

import 'core/injections/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(const EntryPoint()));
}

initDependencies() async {
  await ScreenUtil.ensureScreenSize();
  await configureDependencies();
}
