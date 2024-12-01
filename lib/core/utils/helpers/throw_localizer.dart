import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/providers/main/localization.dart';

String throwLocalizer(
  Ref ref, {
  required String message,
  required String messageAr,
}) {
  final isAr = ref.read(localizationProvider.notifier).isArabic();
  throw isAr ? messageAr : message;
}
