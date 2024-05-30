import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtension<T> on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  AppLocalizations get locale => AppLocalizations.of(this);

  void push(Widget page) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}