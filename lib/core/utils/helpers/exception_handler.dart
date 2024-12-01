import 'dart:async' show TimeoutException;
import 'dart:io' show HandshakeException, SocketException;

({String message, String messageAr}) exceptionHandler(Object? e) {
  if (e is SocketException || e is HandshakeException) {
    return (
      message: "No internet connection",
      messageAr: "لا يوجد اتصال بالإنترنت"
    );
  } else if (e is TimeoutException) {
    return (
      message: "Slow internet connection",
      messageAr: "توجد مشكلة في الاتصال"
    );
  } else {
    return (
      message: e.toString(),
      messageAr: "حدثت مشكلة، يرجى إعادة المحاولة", //e.toString()
    );
  }
}
