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

Map<int, List<int>> getPrimeFactorsOfNumbersUpTo(int maxNumber) {
  final Map<int, List<int>> dictionary = <int, List<int>>{};

  for (int currentNumber = 2; currentNumber <= maxNumber; currentNumber++) {
    // Finding the numbers in which our current number is the 2nd factor.

    int factor = 2;
    do {
final int resultingNumber = currentNumber * factor;
      if (dictionary[currentNumber] == null) {
        dictionary[currentNumber] = <int>[currentNumber];
      }
      if (dictionary[factor] == null) {
        dictionary[factor] = <int>[factor];
      }
      if (dictionary[resultingNumber] == null) {
        dictionary[resultingNumber] = <int>[
          ...dictionary[currentNumber]!,
          ...dictionary[factor]!,
        ];
      }
      factor ++;
    }
    while (
        factor <= currentNumber && factor * currentNumber <= maxNumber
    ) ;
  }

  return dictionary;
}
