extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');

  String get getLetterFullName {
    if (isEmpty) return '';
    String nameRaw = trim();
    var listName = nameRaw.split(' ');
    listName.removeWhere((element) => element == '');
    if (listName.length == 1) {
      return (listName[0][0] + listName[0][1]).toUpperCase();
    }
    return (listName[0][0] + listName[1][0]).toUpperCase();
  }

  String get shortName => getLetterFullName;

  String get getLetterFirstName {
    if (length == 1) return toUpperCase();
    String nameRaw = trim();
    var listName = nameRaw.split('');
    return listName[0].toUpperCase();
  }
}
