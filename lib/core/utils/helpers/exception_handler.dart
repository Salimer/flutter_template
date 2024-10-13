import 'dart:async' show TimeoutException;
import 'dart:io' show HandshakeException, SocketException;

import '../../extensions/context_extension.dart';
import '../navigator_key.dart';

String exceptionHandler(Object? e) {
  if (e is SocketException || e is HandshakeException) {
    // return navigatorKey.currentContext!.locale.noInternet;
    return "no internet";
  } else if (e is TimeoutException) {
    // return navigatorKey.currentContext!.locale.slowInternet;
    return "slow internet";
  } else {
    return '$e';
  }
}
