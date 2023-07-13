import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constants/dimens.dart';

/// extensions on [BuildContext]
extension WidgetExtension on BuildContext {
  /// locale

  /// navigator state
  NavigatorState get navigator => Navigator.of(this);

  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  bool get isMobile => width > 375 && width < 650;

  bool get isTablet => width >= 650 && width < 1080;

  bool get isDesktop => width >= 1080;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Brightness get invertedThemeBrightness => theme.brightness == Brightness.light ? Brightness.dark : Brightness.light;
}

/// extensions on any [Widget]
extension AppWidgetExtension on Widget {
  Widget fillMaxHeight(BuildContext context, [double ratio = 1.0]) => SizedBox(height: context.height * ratio, child: this);

  Widget fillMaxWidth(BuildContext context, [double ratio = 1.0]) => SizedBox(width: context.width * ratio, child: this);

  Widget fillMaxSize(BuildContext context, [double ratio = 1.0]) => SizedBox(
        height: context.height * ratio,
        width: context.width * ratio,
        child: this,
      );

  Widget horizontal(double spacing) => Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: this,
      );

  Widget vertical(double spacing) => Padding(
        padding: EdgeInsets.symmetric(vertical: spacing),
        child: this,
      );

  Widget bottom(double spacing) => Padding(
        padding: EdgeInsets.only(bottom: spacing),
        child: this,
      );

  Widget top(double spacing) => Padding(
        padding: EdgeInsets.only(top: spacing),
        child: this,
      );

  Widget left(double spacing) => Padding(
        padding: EdgeInsets.only(left: spacing),
        child: this,
      );

  Widget right(double spacing) => Padding(
        padding: EdgeInsets.only(right: spacing),
        child: this,
      );

  Widget all(double spacing) => Padding(
        padding: EdgeInsets.all(spacing),
        child: this,
      );

  Widget onPressed(
          {required Function()? onTap,
          BorderRadius? radius,
          Color? overlayColor,
          Color? color,
          InteractiveInkFeatureFactory? splashFactory}) =>
      InkWell(
        onTap: onTap,
        borderRadius: radius,
        splashFactory: splashFactory ?? InkSplash.splashFactory,
        splashColor: color,
        overlayColor: MaterialStatePropertyAll(overlayColor ?? Colors.transparent),
        child: this,
      );

  Widget hero({required String tag}) => Hero(tag: tag, child: this);

  Widget circularClip(radius) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        clipBehavior: Clip.hardEdge,
        child: this,
      );

  Widget withBadge(
    BuildContext context, {
    bool showAsIndicator = true,
    int count = 0,
  }) {
    var kTheme = Theme.of(context);

    /// show badge only when count > 0 or showAsIndicator is true
    var showBadge = showAsIndicator || count > 0;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        /// widget itself
        Positioned.fill(child: this),

        if (showBadge) ...{
          Positioned(
            child: Container(
              width: count > 0 ? 16 : 12,
              height: count > 0 ? 16 : 12,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: kTheme.colorScheme.error,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: showAsIndicator
                  ? null
                  : '${count > 99 ? '99+' : count}'.overLine(
                      context,
                      color: kTheme.colorScheme.onError,
                    ),
            ),
          ),
        }
      ],
    );
  }

  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);

  Widget centered() => Center(child: this);
}

/// extensions on any [String]
///
/// converts a [String] to a [Text][Widget]
extension AppText on String? {
  Widget overLine(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
            letterSpacing: spacing,
            fontWeight: weight ?? Theme.of(context).textTheme.labelSmall?.fontWeight,
            color: color?.withOpacity(emphasis) ?? Theme.of(context).colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget asSvg({
    double? size,
    double? height,
    double? width,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) =>
      SvgPicture.asset(
        this ?? '',
        height: size ?? height,
        width: size ?? width,
        fit: fit,
        color: color,
        placeholderBuilder: (_) => const SizedBox.shrink(),
      );

  Widget asAssetImage({
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) =>
      Image.asset(
        this ?? '',
        height: size ?? height,
        width: size ?? width,
        fit: fit,
      );

  Widget asCachedNetworkImage(
    BuildContext context, {
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) {
    var placeholder = Container(
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
          valueColor: AlwaysStoppedAnimation(context.theme.colorScheme.onBackground),
        ),
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
      ),
      height: height,
      width: width,
    );
    return Material(
      color: context.theme.cardColor,
      type: MaterialType.transparency,
      clipBehavior: Clip.antiAlias,
      child: isNullOrEmpty()
          ? placeholder
          : CachedNetworkImage(
              imageUrl: this ?? '',
              height: size ?? height,
              width: size ?? width,
              fit: fit,
              placeholder: (_, __) => placeholder,
              errorWidget: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary,
                ),
                height: size ?? height,
                width: size ?? width,
              ),
            ),
    );
  }

  Widget avatar(
    BuildContext context, {
    double size = 56,
    bool fromAsset = false,
    bool circular = true,
    BoxFit fit = BoxFit.cover,
  }) =>
      fromAsset
          ? asAssetImage(size: size, fit: fit).circularClip(circular ? size : size / 4)
          : asCachedNetworkImage(context, size: size, fit: fit).circularClip(circular ? size : size / 4);

  String capitalize() {
    assert(this != null);
    return this!.split(' ').map((str) => '${str[0].toUpperCase()}${str.substring(1).toLowerCase()}').join(' ');
  }

  bool isNullOrEmpty() => this == null || this!.trim().isEmpty;
}
