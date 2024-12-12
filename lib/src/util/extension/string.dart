extension StringX on String {
  String toCapitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toTitleCase() {
    if (isEmpty) return this;
    return split(" ").map((str) => str.toCapitalize()).join(" ");
  }
}
