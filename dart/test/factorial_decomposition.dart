import "package:dart/factorial_decomposition/index.dart";
import "package:test/test.dart";

/*
n = 12; decomp(12) -> "2^10 * 3^5 * 5^2 * 7 * 11"
since 12! is divisible by 2 ten times, by 3 five times, by 5 two times and by 7 and 11 only once.

1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 * 10 * 11 * 12;

n = 22; decomp(22) -> "2^19 * 3^9 * 5^4 * 7^3 * 11^2 * 13 * 17 * 19"

n = 25; decomp(25) -> 2^22 * 3^10 * 5^6 * 7^3 * 11^2 * 13 * 17 * 19 * 23


*/

void main() {
  testing(int n, String exp) =>
      test("Testing for $n", () => expect(decomp(n), equals(exp)));

  group("fixed tests", () {
    testing(17, "2^15 * 3^6 * 5^3 * 7^2 * 11 * 13 * 17");
    testing(5, "2^3 * 3 * 5");
    testing(22, "2^19 * 3^9 * 5^4 * 7^3 * 11^2 * 13 * 17 * 19");
    testing(14, "2^11 * 3^5 * 5^2 * 7^2 * 11 * 13");
    testing(25, "2^22 * 3^10 * 5^6 * 7^3 * 11^2 * 13 * 17 * 19 * 23");
  });
}
