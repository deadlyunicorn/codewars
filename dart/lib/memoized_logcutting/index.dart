import 'dart:math';

int cutLog(List<int> priceTableArray, int logSize) {
  final Map<int, int> cache = <int, int>{};

  for (int i = 1; i <= logSize; i++) {
    for (int j = 1; j <= i; j++) {
      cache[i] = max(
        cache[i] ?? priceTableArray[i],
        (cache[i - j] ?? priceTableArray[i - j]) +
            (cache[j] ?? priceTableArray[j]),
      );
    }
  }
  print(cache);
  return cache[logSize] ?? priceTableArray[logSize];
}
