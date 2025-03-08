bool isValidIP(String input) {
  final List<String> ipPartsArray = input.split('.');

  if (ipPartsArray.length != 4) {
    return false;
  }

  for (final String part in ipPartsArray) {
    final int? partNumberValue = int.tryParse(part);
    if (partNumberValue == null) {
      return false;
    }
    if ("${partNumberValue}" != part) {
      return false;
    }

    if (partNumberValue > 255 || partNumberValue < 0) {
      return false;
    }
  }

  return true;
}

void main() {
  print(isValidIP("5"));
}
