extension StringExtension on String {
  String ellipsizeByLength(int length) {
    return this.length > length ? '${substring(0, length).trim()}...' : this;
  }
}
