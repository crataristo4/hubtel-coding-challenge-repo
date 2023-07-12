import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//todo add floating action and others
class AppCustomScrollView extends StatefulWidget {
  final Axis scrollDirection = Axis.vertical;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final ScrollBehavior? scrollBehavior;
  final bool shrinkWrap, reverse;
  final Key? center;
  final double anchor = 0.0;
  final double? cacheExtent;
  final List<Widget> slivers;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual;
  final String? restorationId;
  final Clip clipBehavior = Clip.hardEdge;
  final bool hasScaffold;
  final bool hasDefaultAppBarWithBack;
  final Widget? bottomNavigation, floatingAction;
  final List<Widget>? actions;
  final String? appBarTitle; //used in case default appBar needs a title
  final Color? scaffoldColor;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  const AppCustomScrollView(
      {Key? key,
      this.controller,
      this.primary,
      this.physics,
      this.scrollBehavior,
      this.center,
      this.cacheExtent,
      this.semanticChildCount,
      this.restorationId,
      this.reverse = false,
      this.shrinkWrap = false,
      this.slivers = const [],
      required this.hasScaffold,
      this.hasDefaultAppBarWithBack = false,
      this.bottomNavigation,
      this.floatingAction,
      this.actions,
      this.appBarTitle,
      this.scaffoldColor,
      this.floatingActionButtonLocation})
      : super(key: key);

  @override
  State<AppCustomScrollView> createState() => _AppCustomScrollViewState();
}

class _AppCustomScrollViewState extends State<AppCustomScrollView> {
  @override
  Widget build(BuildContext context) {
    return widget.hasScaffold
        ? Scaffold(
            body: customScrollView(),
            resizeToAvoidBottomInset: true,
            backgroundColor: widget.scaffoldColor,
            bottomNavigationBar: widget.bottomNavigation,
            floatingActionButton: widget.floatingAction,
            floatingActionButtonLocation: widget.floatingActionButtonLocation,
          )
        : customScrollView();
  }

  Widget customScrollView() => CustomScrollView(
      slivers: widget.slivers,
      key: widget.key,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      controller: widget.controller,
      primary: widget.primary,
      physics: widget.physics,
      scrollBehavior: widget.scrollBehavior,
      shrinkWrap: widget.shrinkWrap,
      center: widget.center,
      anchor: widget.anchor,
      cacheExtent: widget.cacheExtent,
      semanticChildCount: widget.semanticChildCount,
      dragStartBehavior: widget.dragStartBehavior,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      restorationId: widget.restorationId,
      clipBehavior: widget.clipBehavior);
}
