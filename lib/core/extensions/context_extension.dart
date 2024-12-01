import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/helpers/exception_handler.dart';

extension ContextExtension<T> on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  Orientation get screenOrientation => MediaQuery.orientationOf(this);

  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => Theme.of(this).colorScheme;

  AppLocalizations get locale => AppLocalizations.of(this);

  void push(Widget page) {
    if (Platform.isIOS) {
      // Use CupertinoPageRoute for iOS
      Navigator.of(this).push(
        CupertinoPageRoute(
          builder: (context) => page,
        ),
      );
    } else {
      // Use MaterialPageRoute for Android and others
      Navigator.of(this).push(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    }
  }

  void pushReplacement(Widget page) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void pushAndPopAll(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }

  void pushNamedAndRemoveUntil(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pushNamed(String routeName) {
    Navigator.of(this).pushNamed(routeName);
  }

  void pushReplacementNamed(String routeName) {
    Navigator.of(this).pushReplacementNamed(routeName);
  }

  void pop({int times = 1}) {
    for (int i = 0; i < times; i++) {
      Navigator.of(this).pop();
    }
  }

  void popUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  void popRootNavigator() {
    Navigator.of(this, rootNavigator: true).pop();
  }

  void _showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  void showErrorSnackBar(Object? error) {
    _showSnackBar(
      SnackBar(
        // duration: const Duration(seconds: 1000),
        content: Text(exceptionHandler(error)),
        backgroundColor: Colors.red,
      ),
    );
  }

  void showSuccessSnackBar(String message) {
    _showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  static bool _isLoading = false;

  void showLoadingDialog([bool isDismissible = true]) {
    if (_isLoading) return;
    showAdaptiveDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: isDismissible,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) {
              _isLoading = false;
            }
          },
          // onPopInvoked: (didPop) {
          //   if (didPop) _isLoading = false;
          // },
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
    _isLoading = true;
  }

  void closeLoadingDialog() {
    if (!_isLoading) return;
    this.pop();
    _isLoading = false;
  }

  void showBottomSheet(Widget widget) {
    showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      builder: (context) => widget,
    );
  }

  void showSuccessDialog(Widget widget) {
    showAdaptiveDialog(
      context: this,
      barrierDismissible: true,
      builder: (BuildContext context) => widget,
    );
  }
}
