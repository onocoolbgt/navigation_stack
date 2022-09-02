import 'package:flutter/widgets.dart';

abstract class NavigationStackState {
  bool canPop();

  Future<bool> maybePop<T extends Object?>([T? result]);

  void pop<T extends Object?>([T? result]);

  Future<T?> popAndNavTo<T extends Object?, TO extends Object?>(
      String routeName,
      {TO? result,
      Object? arguments});

  Future<T?> navTo<T extends Object?>(String routeName, {Object? arguments});

  Future<T?> navToAndRemoveUntil<T extends Object?>(
      String newRouteName, RoutePredicate predicate,
      {Object? arguments});

  Future<T?> navToReplace<T extends Object?, TO extends Object?>(
      String routeName,
      {TO? result,
      Object? arguments});

  void setState(VoidCallback fn);
}
