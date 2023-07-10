import 'package:flutter/material.dart';

class AppTextStyle{
  static TextStyle headline (BuildContext context) => Theme.of(context).textTheme.labelLarge!;
  static TextStyle headline2 (BuildContext context) => Theme.of(context).textTheme.labelMedium!;
  static TextStyle title (BuildContext context) => Theme.of(context).textTheme.titleMedium!;
  static TextStyle regular (BuildContext context) => Theme.of(context).textTheme.bodyLarge!;
  static TextStyle medium (BuildContext context) => Theme.of(context).textTheme.bodyMedium!;
  static TextStyle small (BuildContext context) => Theme.of(context).textTheme.bodySmall!;
  static TextStyle extraSmall (BuildContext context) => Theme.of(context).textTheme.labelSmall!;
}