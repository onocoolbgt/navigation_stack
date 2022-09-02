library navigation_stack;

import 'package:flutter/widgets.dart';
import 'package:navigation_stack/src/navigation_stack_state.dart';

/// A Calculator.
class NavigationStack extends NavigationStackState {
  NavigationStack._();
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  static final NavigationStack _instance = NavigationStack._();

  factory NavigationStack() => _instance;

  NavigatorState get _navState => key.currentState!;

  BuildContext get context => key.currentContext!;

  @override
  bool canPop() {
    return _navState.canPop();
  }

  @override
  Future<bool> maybePop<T extends Object?>([T? result]) {
    return _navState.maybePop<T>(result);
  }

  @override
  Future<T?> navTo<T extends Object?>(String routeName, {Object? arguments}) {
    return _navState.pushNamed<T>(routeName, arguments: arguments);
  }

  @override
  Future<T?> navToAndRemoveUntil<T extends Object?>(
      String newRouteName, RoutePredicate predicate,
      {Object? arguments}) {
    return _navState.pushNamedAndRemoveUntil<T>(
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  @override
  Future<T?> navToReplace<T extends Object?, TO extends Object?>(
      String routeName,
      {TO? result,
      Object? arguments}) {
    return _navState.pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  @override
  Future<T?> popAndNavTo<T extends Object?, TO extends Object?>(
      String routeName,
      {TO? result,
      Object? arguments}) {
    return _navState.popAndPushNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  @override
  void setState(VoidCallback fn) {
    // ignore: invalid_use_of_protected_member
    _navState.setState(fn);
  }

  @override
  void pop<T extends Object?>([T? result]) {
    _navState.pop<T>(result);
  }
}
