extension ToBoolExtension on String {
  bool toBool() {
    return (this.toLowerCase() == "false" || int.parse(this) == 0)
        ? false
        : (this.toLowerCase() == "true" || int.parse(this) == 1) ? true : false;
  }
}
