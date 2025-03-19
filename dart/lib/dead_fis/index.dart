List<int> parse(String data) {
  final List<int> result = <int>[];

  for (int accumulator = 0, charIndex = 0;
      charIndex < data.length;
      charIndex++) {
    final String currentChar = data[charIndex];
    switch (currentChar) {
      case "i":
        accumulator += 1;
      case "d":
        accumulator -= 1;
      case "s":
        accumulator *= accumulator;
      case "o":
        result.add(accumulator);

      default:
        continue;
    }
  }

  return result;
}
