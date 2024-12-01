// import 'package:flutter_template/core/extensions/context_extension.dart';

// import 'navigator_key.dart';

// mixin ValidationMixin {
//   final _locale = navigatorKey.currentContext!.locale;

//   String? emailValidation(String? email) {
//     if (email == null || email.trim().isEmpty) {
//       return '${_locale.email} ${_locale.requiredValidation}';
//     }
//     final validation = RegExp(r'^[a-zA-Z0-9_.]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$');
//     if (!validation.hasMatch(email.trim())) return _locale.emailValidation;
//     if (email.trim().length > 255) return _locale.emailLongValidation;
//     return null;
//   }

//   String? emailConfValidation(String? val, String? email) {
//     if (val == null || val.trim().isEmpty) {
//       return '${_locale.emailConfirmation} ${_locale.requiredValidation}';
//     }
//     final validation = RegExp(r'^[a-zA-Z0-9_.]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$');
//     if (!validation.hasMatch(val.trim())) {
//       return _locale.emailConfirmationValidation;
//     }
//     if (val.trim() != email?.trim()) return _locale.emailsNotMatch;
//     return null;
//   }

//   String? passwordValidation(String? val) {
//     if (val == null || val.isEmpty) {
//       return '${_locale.password} ${_locale.requiredValidation}';
//     }
//     if (val.length < 8) return _locale.passwordShortValidation;
//     return null;
//   }

//   String? newPasswordValidation(String? next, String current) {
//     final validation = passwordValidation(next);
//     if (next == current) return _locale.newPasswordValidation;
//     return validation;
//   }

//   String? loginPasswordValidation(String? val) {
//     if (val == null || val.isEmpty) {
//       return '${_locale.password} ${_locale.requiredValidation}';
//     }
//     if (val.length < 2) return _locale.passwordLoginValidation;
//     return null;
//   }

//   String? passwordConfValidation(String? val, String password) {
//     if (val == null || val.isEmpty) {
//       return '${_locale.passwordConfirmation} ${_locale.requiredValidation}';
//     }
//     if (val.length < 8) return _locale.passwordShortValidation;
//     if (val != password) return _locale.passwordsNotMatch;
//     return null;
//   }

//   String? firstnameValidation(String? name) {
//     if (name == null || name.trim().isEmpty) {
//       return '${_locale.firstName} ${_locale.requiredValidation}';
//     }
//     if (name.trim().length < 3) return _locale.firstnameShortValidation;
//     if (name.trim().length > 255) return _locale.firstnameLongValidation;
//     return null;
//   }

//   String? lastnameValidation(String? name) {
//     if (name == null || name.trim().isEmpty) {
//       return '${_locale.lastName} ${_locale.requiredValidation}';
//     }
//     if (name.trim().length < 3) return _locale.lastnameShortValidation;
//     if (name.trim().length > 255) return _locale.lastnameLongValidation;
//     return null;
//   }

//   String? usernameValidation(String? name) {
//     if (name == null || name.trim().isEmpty) {
//       return '${_locale.username} ${_locale.requiredValidation}';
//     }
//     if (name.trim().length < 3) return _locale.usernameShortValidation;
//     if (name.trim().length > 255) return _locale.usernameLongValidation;
//     return null;
//   }

//   String? phoneValidation(String? phone) {
//     if (phone == null || phone.trim().isEmpty) {
//       return '${_locale.phoneNumber} ${_locale.requiredValidation}';
//     }
//     if (phone.trim().length < 7) return _locale.phoneShortValidation;
//     if (phone.trim().length > 15) return _locale.phoneLongValidation;

//     return null;
//   }

//   String? birthdateValidation(String? date) {
//     if (date == null || date.trim().isEmpty) {
//       return '${_locale.birthdate} ${_locale.requiredValidation}';
//     }
//     if (DateTime.now().difference(DateTime.parse(date)).inDays < 4749) {
//       return _locale.birthdateValidation;
//     }
//     return null;
//   }

//   String? noteValidation(String? note) {
//     if (note == null || note.trim().length < 3) {
//       return _locale.noteMinValidation;
//     }
//     if (note.trim().length > 4000) return _locale.noteMaxValidation;
//     return null;
//   }

//   String? commentValidation(String? comment) {
//     if (comment == null || comment.trim().length < 3) {
//       return _locale.commentMinValidation;
//     }
//     if (comment.trim().length > 4000) return _locale.commentMaxValidation;
//     return null;
//   }

//   String? facebookValidation(String? url) {
//     if (url == null || url.isEmpty) return null;
//     final validation = RegExp(r'^[a-zA-Z0-9._]+$');
//     if (!validation.hasMatch(url)) return _locale.socialMediaValidation;
//     return null;
//   }

//   String? instagramValidation(String? url) {
//     if (url == null || url.isEmpty) return null;
//     final validation = RegExp(r'^[a-zA-Z0-9._]{1,30}$');
//     if (!validation.hasMatch(url)) return _locale.socialMediaValidation;
//     return null;
//   }

//   String? tiktokValidation(String? url) {
//     if (url == null || url.isEmpty) return null;
//     final validation = RegExp(r'^[a-zA-Z0-9_.-]{2,}$');
//     if (!validation.hasMatch(url)) return _locale.socialMediaValidation;
//     return null;
//   }

//   String? xValidation(String? url) {
//     if (url == null || url.isEmpty) return null;
//     final validation = RegExp(r'^[a-zA-Z0-9_]{1,15}$');
//     if (!validation.hasMatch(url)) return _locale.socialMediaValidation;
//     return null;
//   }

//   String? requiredValidation(String? val, String? name) {
//     if (val == null || val.trim().isEmpty) {
//       return '$name ${_locale.requiredValidation}';
//     }
//     return null;
//   }
// }
