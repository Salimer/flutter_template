import 'package:flutter/material.dart';

extension NavigatorStateExtension on NavigatorState {
  void showSnackBarWithError(String message) {
    final currentContext = context;

    ScaffoldMessenger.of(currentContext).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}