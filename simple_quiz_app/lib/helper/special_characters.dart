extension SpecialCharacters on String {
  String getNormalString() {
    if (contains('&') && contains(';')) {
      String newString = this;
      do {
        final startIndex = newString.indexOf('&');
        final endIndex = newString.indexOf(';') == newString.length ? newString.length : newString.indexOf(';') + 1;
        final code = newString.substring(startIndex, endIndex);
        newString = newString.replaceRange(startIndex, endIndex, getReplacement(code));
      } while (newString.contains('&') && newString.contains(';'));
      return newString;
    } else {
      return this;
    }
  }

  String getReplacement(String code) {
    switch (code) {
      case '&aacute;':
        return 'á';
      case '&eacute;':
        return 'é';
      case '&quot;':
        return '"';
      case '&#176;':
        return '°';
      case '&#039;':
        return '\'';
      default:
        return code;
    }
  }
}
