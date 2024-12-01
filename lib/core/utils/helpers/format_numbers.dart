String formatNumbers(num number) {
  return number.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},');
}
