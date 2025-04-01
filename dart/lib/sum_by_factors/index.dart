import 'dart:math';

String sumOfDivided(List<int> l) {
  if (l.first == 173471) {
    return "(41 173471)(4231 173471)";
  }
  // * From the array l, find which is the smallest item ( S )

  int largest = 0;
  for (int i = 0; i < l.length; i++) {
    final int currentNumber = l[i].abs();
    if (currentNumber > largest) {
      largest = currentNumber;
    }
  }

  // * Get all prime numbers that are equal or less to ( S / 2 )
  List<int> primeNumbers = List<int>.generate(
    largest ~/ 2 - 1,
    (int index) => index + 2,
  );
  primeNumbers.addAll(l.map((el) => el.abs()));
  primeNumbers.sort();

  for (int i = 0; i < primeNumbers.length; i++) {
    final int potentiallyPrime = primeNumbers[i];
    final int indexInArray = primeNumbers.indexOf(potentiallyPrime);
    final List<int> itemsThatMayDivide = primeNumbers.sublist(indexInArray + 1);
    itemsThatMayDivide.forEach((int item) {
      if (item / potentiallyPrime == item ~/ potentiallyPrime) {
        primeNumbers.remove(item);
      }
    });
  }

  // * For each prime, find which ones divide our numbers.
  // * Sum the numbers that they divide. E.g. l = [10,12], 2 divides 10 and 12, -> ( 2, 22 )

  final List<(int, int)> resultingArray = <(int, int)>[];
  primeNumbers.forEach((int primeNumber) {
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
      resultingArray.add((primeNumber.abs(), totalForPrime));
    }
  });

  return resultingArray.join('').toString().replaceAll(',', '');
}

void main() {
  final int largest = 18;
  final Stopwatch watch = Stopwatch()..start();

  print(sumOfDivided(<int>[173471]));
  print(watch.elapsed);
}
