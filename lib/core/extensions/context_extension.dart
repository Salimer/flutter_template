import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/app_colors.dart';
import '../constants/layout.dart';


extension ContextExtension<T> on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  Orientation get screenOrientation => MediaQuery.orientationOf(this);

  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => Theme.of(this).colorScheme;

  AppLocalizations get locale => AppLocalizations.of(this);

  Object? get routeArguments => ModalRoute.of(this)?.settings.arguments;

  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pushNamedAndRemoveAll(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pushNamedAndRemoveUntil(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(routeName),
    );
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

  void showErrorSnackBar(String error) {
    _showSnackBar(
      SnackBar(
        // duration: const Duration(seconds: 1000),
        content: Text(error),
        backgroundColor: AppColors.danger,
      ),
    );
  }

  void showSuccessSnackBar(String message) {
    _showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.success,
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

  void showErrorDialog(void Function() providerInvalidated) {
    showAdaptiveDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => AlertDialog.adaptive(
        // title: Text(
        //   locale.error,
        //   style: const TextStyle(fontFamily: FontFamily.expoArabic),
        // ),
        content: Text(
          'locale.somethingWentWrong',
          // style: const TextStyle(fontFamily: FontFamily.expoArabic),
        ),
        actions: <Widget>[
          TextButton(
              child: Text(
                'locale.retry',
                style: const TextStyle(color: Color(0xff007AFF)),
              ),
              onPressed: () {
                providerInvalidated();
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }

  void showBottomSheet(Widget widget) {
    showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      builder: (context) => widget,
    );
  }

  void showCustomDialog(Widget widget, {bool isDismissible = true}) {
    showAdaptiveDialog(
      context: this,
      barrierDismissible: isDismissible,
      builder: (BuildContext context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Layout.viewsHorizontalPadding),
          child: widget,
        ),
      ),
    );
  }

  Future<bool?> showAlertDialog() {
    return showAdaptiveDialog<bool?>(
      context: this,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog.adaptive(
        title: const SizedBox.shrink(),
        content: Text(
          'locale.areYouSure',
          // style: const TextStyle(fontFamily: FontFamily.expoArabic),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'locale.cancel',
              style: const TextStyle(color: Color(0xff007AFF)),
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            child: Text(
              'locale.yes',
              style: const TextStyle(color: Color(0xff007AFF)),
            ),
            onPressed: () {
              Navigator.of(context).pop(true); // Return 'true' when signed out
            },
          ),
        ],
      ),
    );
  }

  void showMaterialBanner(String message) {
    ScaffoldMessenger.of(this).showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        actions: [
          TextButton(
            child: Text(
              'this.locale.yes',
              style: const TextStyle(color: Color(0xff007AFF)),
            ),
            onPressed: () {
              ScaffoldMessenger.of(this).hideCurrentMaterialBanner();
            },
          ),
        ],
      ),
    );
  }
}
