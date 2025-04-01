import 'dart:math';

String sumOfDivided(List<int> l) {
  // * From the array l, find which is the smallest item ( S )

  int smallest = 9999999999;
  for (int i = 0; i < l.length; i++) {
    final int currentNumber = l[i];
    if (currentNumber < smallest) {
      smallest = currentNumber;
    }
  }

  // * Get all prime numbers that are equal or less to ( S / 2 )
  List<int> primeNumbers = List.generate(
    smallest ~/ 2 - 1,
    (int index) => index + 2,
  );

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

  // TODO: For each prime, find which ones divide our numbers.
  // TODO Sum the numbers that they divide. E.g. l = [10,12], 2 divides 10 and 12, -> ( 2, 22 )
  final List<int> resultingArray = primeNumbers
      .where((int item) =>
          l.every((int element) => element / item == element ~/ item))
      .toList();

  return resultingArray.join('-');
}

void main() {
  print(sumOfDivided(<int>[10, 12]));
}
