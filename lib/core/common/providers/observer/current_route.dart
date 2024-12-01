import 'package:flutter/material.dart' show debugPrint;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_route.g.dart';

@Riverpod(keepAlive: true)
class CurrentRoute extends _$CurrentRoute {
  @override
  String build() => '/';

  void set(String routeName) {
    state = routeName;
    debugPrint("current route: $state");
  }
}
