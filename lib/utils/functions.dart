import 'dart:async';

import 'package:flutter/cupertino.dart';

onWidgetBindingComplete({Duration duration = const Duration(milliseconds: 1200), required Function() onComplete}) {
  WidgetsBinding.instance.addPostFrameCallback((_) => Timer(duration, onComplete));
}

///Navigate to page
///[replace] determines whether to remove page from stack or to push
///[destination] is the route
///[args] Passes data to page
Future<dynamic> switchScreen(
    {required BuildContext context, required String destination, bool replace = false, bool popAndPush = false, dynamic args}) {
  return replace
      ? Navigator.of(context).pushNamedAndRemoveUntil(destination, (route) => false, arguments: args)
      : popAndPush
          ? Navigator.of(context).popAndPushNamed(destination, arguments: args)
          : Navigator.of(context).pushNamed(destination, arguments: args);
}
