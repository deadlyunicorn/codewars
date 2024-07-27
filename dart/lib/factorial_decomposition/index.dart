String decomp(int value) {
  final Map<int, List<int>> dictionary = getPrimeFactorsOfNumbersUpTo(value);
  final Map<int, int> decomposition = <int, int>{};
  for (int i = 2; i <= value; i++) {
    final List<int>? currentNumberDecomposition = dictionary[i];
    for (int i = 0; i < currentNumberDecomposition!.length; i++) {
      final int? currentNumberRepetitions =
          decomposition[currentNumberDecomposition[i]];
      if (currentNumberRepetitions == null) {
        decomposition[currentNumberDecomposition[i]] = 1;
      } else {
        decomposition[currentNumberDecomposition[i]] =
            decomposition[currentNumberDecomposition[i]]! + 1;
      }
    }
  }

  final List<String> resultList = <String>[];
  decomposition.entries.forEach((MapEntry<int, int> element) {
    String itemToAdd = element.key.toString();
    if (element.value > 1) {
      itemToAdd += "^${element.value}";
    }
    resultList.add(itemToAdd);
  });

  return resultList.join(" * ");
}

Map<int, List<int>> getPrimeFactorsOfNumbersUpTo(int number) {
  final Map<int, List<int>> dictionary = <int, List<int>>{};

  for (int i = 2; i <= number; i++) {
    for (int j = 2; j <= i; j++) {
      final int resultingNumber = i * j;
      if (dictionary[i] == null) {
        dictionary[i] = <int>[i];
      }
      if (dictionary[j] == null) {
        dictionary[j] = <int>[j];
      }
      if (dictionary[resultingNumber] == null) {
        dictionary[resultingNumber] = <int>[
          ...dictionary[i]!,
          ...dictionary[j]!,
        ];
      }
    }
  }

  return dictionary;
}
