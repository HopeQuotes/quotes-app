
extension Ellips on String {
  String ellipsize(int size) {
    if (length > size) {
      return "${substring(0, size)}...";
    } else {
      return this;
    }
  }
}
