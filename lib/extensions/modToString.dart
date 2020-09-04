extension ModToStringExtension on int {
  String modToString() {
    return (this > 0) ? '+' + this.toString() : this.toString();
  }
}
