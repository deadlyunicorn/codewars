import 'dart:math';

int binToDec(String binary) {
  int counter = 0;
  for (int i = 0; i < binary.length; i++) {
    counter += int.parse(binary[binary.length - 1 - i]) * pow(2, i) as int;
  }

  return counter;
}
