import 'package:flutter/material.dart';

class AppSliverAppBar extends StatelessWidget {
  final Widget? leading, title, flexibleSpace;
  final List<Widget>? action;
  final bool centerTitle, automaticallyImplyLeading, forcedElevated, withSearch, stretch;
  final Future<void> Function()? onStretchTriggered;

  ///increase leading width should there be any
  final double? leadingWidth, expandedHeight, elevation, toolbarHeight;

  final Color? backgroundColor;

  const AppSliverAppBar(
      {Key? key,
      this.leading,
      this.title,
      this.action,
      this.automaticallyImplyLeading = false,
      this.centerTitle = true,
      this.forcedElevated = false,
      this.withSearch = false,
      this.stretch = false,
      this.leadingWidth,
      this.flexibleSpace,
      this.backgroundColor,
      this.elevation = 0,
      this.toolbarHeight,
      this.expandedHeight,
      this.onStretchTriggered})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      // iconTheme: const IconThemeData(color: ThemeColor.kGray),
      pinned: true,
      stretch: stretch,
      onStretchTrigger: onStretchTriggered,
      forceElevated: forcedElevated,
      elevation: forcedElevated ? 0.3 : elevation,
      backgroundColor: backgroundColor ?? Colors.white,
      centerTitle: centerTitle,
      floating: false,
      snap: false,
      title: title ?? const SizedBox(),
      actions: action,
      flexibleSpace: flexibleSpace,
      expandedHeight: expandedHeight,
      toolbarHeight: toolbarHeight ?? kToolbarHeight,
    );
  }
}
