import 'dart:developer';

import 'package:flutter/material.dart';

class LoggerNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logNavigation(route.settings.name, 'push');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logNavigation(route.settings.name, 'pop');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logNavigation(route.settings.name, 'remove');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _logNavigation(newRoute?.settings.name, 'replace');
  }

  void _logNavigation(String? routeName, String action) {
    if(routeName != null) {
      log("Screen $action: $routeName", name: 'Navigation');
    }
  }
}