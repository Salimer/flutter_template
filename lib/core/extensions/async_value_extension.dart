import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/extensions/extensions.dart';

extension AsyncValueExtension<T> on AsyncValue {
  void showSnackbarOnError(BuildContext context) {
    if(!isLoading && hasError) {
      context.showErrorSnackBar(error.toString());
    }
  }
}