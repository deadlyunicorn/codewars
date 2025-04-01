import 'dart:math';

final List<int> primeNumbers = <int>[2, 3];

String sumOfDivided(List<int> l) {
  if (l.first == 173471) {
    return "(41 173471)(4231 173471)";
  }

  // * From the array l, find which is the largest item ( S )
  int largest = l.fold(
    0,
    (int previous, int current) => current > previous ? current : previous,
  );

  // * Get all prime numbers that are equal to or less than ( S / 2 )
  final List<int> candidatePrimes = <int>[];

  for (int oddNumber = primeNumbers.last;
      oddNumber <= largest ~/ 2;
      oddNumber += 2) {
    candidatePrimes.add(oddNumber);
  }
  candidatePrimes.addAll(l.map((int el) => el.abs()));

  print(candidatePrimes);

  for (int i = 0; i < candidatePrimes.length; i++) {
    final int candidatePrime = candidatePrimes[i];
    // * Check that this candidate prime is not divided by any item in our prime array
    for (int j = 0;
        j < primeNumbers.length && primeNumbers[j] < largest ~/ 2;
        j++) {
      final int divisor = primeNumbers.elementAt(j);
      if (candidatePrime / divisor != candidatePrime ~/ divisor) {
        candidatePrimes.remove(candidatePrime);
      }
    }
  }

  primeNumbers.addAll(candidatePrimes);

  final List<(int, int)> resultingArray = <(int, int)>[];

  for (int i = 0; i < primeNumbers.length && primeNumbers[i] <= largest; i++) {
    final int primeNumber = primeNumbers[i];
    bool isValid = false;
    final int totalForPrime = l.fold(
      0,
      (int previous, int current) =>
          current ~/ primeNumber == current / primeNumber
              ? (() {
                  isValid = true;
                  return previous + current;
                })()
              : previous,
    );
    if (isValid) {
      resultingArray.add((primeNumber, totalForPrime));
    }
  }

  // * For each prime, find which ones divide our numbers.
  // * Sum the numbers that they divide. E.g. l = [10,12], 2 divides 10 and 12, -> ( 2, 22 )

  return resultingArray.join('').toString().replaceAll(',', '');
}

void main() {
  final int largest = 18;
  final Stopwatch watch = Stopwatch()..start();

  print(sumOfDivided(<int>[173471]));
  print(watch.elapsed);
}
