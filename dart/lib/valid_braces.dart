//My solution for: https://www.codewars.com/kata/5277c8a221e209d3f6000b56/train/dart

import "package:test/test.dart";

void main() {
  test('Example tests', () {
    expect(validBraces('()'), isTrue);
    expect(validBraces('[(])'), isFalse);
    expect(validBraces('(){}[]'), isTrue);
    expect(validBraces('([{}])'), isTrue);
    expect(validBraces('(}'), isFalse);
    expect(validBraces('[(])'), isFalse);
    expect(validBraces('(}'), isFalse);
    expect(validBraces('[({})](]'), isFalse);
  });
}

bool validBraces(String target) {
  final Map<String, String> bracePairsMap = <String, String>{
    "{": "}",
    "(": ")",
    "[": "]",
  };

  List<String> targetCharacters = target.split("");
  List<String> bracesStack = <String>[];

  for (final String character in targetCharacters) {
    if (bracePairsMap.keys.contains(character)) {
      bracesStack.add(character);
    } else if (bracePairsMap[bracesStack.lastOrNull] == character) {
      bracesStack.removeLast();
    } else {
      return false;
    }
  }

  return bracesStack.isEmpty;
}
