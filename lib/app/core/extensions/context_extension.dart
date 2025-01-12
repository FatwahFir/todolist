import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;
  double get height => size.height;
  double get screenWidth => size.width;
  Color get primary => theme.colorScheme.primary;
  Color get secondary => theme.colorScheme.secondary;
  Color get backgroundColor => theme.colorScheme.surface;
  Color get tertiary => theme.colorScheme.tertiary;
  Color get inversPrimary => theme.colorScheme.inversePrimary;

  TextStyle get bodyMedium => theme.textTheme.bodyMedium!;
  TextStyle get bodySmall => theme.textTheme.bodySmall!;
  TextStyle get titleMedium => theme.textTheme.titleMedium!;
  TextStyle get titleLage => theme.textTheme.titleLarge!;
}
