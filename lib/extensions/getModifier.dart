extension ToModExtension on String {
  int getModifier() {
    return ((int.parse(this) - 10) / 2).floor();
  }
}
