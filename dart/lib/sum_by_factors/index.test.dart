import "package:dart/sum_by_factors/index.dart";
import "package:test/test.dart";

void main() {
  void dotest(List<int> l, String exp) {
    test("Testing for $l", () => expect(sumOfDivided(l), equals(exp)));
  }

  group("fixed tests", () {
    dotest([12, 15], "(2 12)(3 27)(5 15)");
    dotest([15, 21, 24, 30, 45], "(2 54)(3 135)(5 90)(7 21)");
    dotest([15, 21, 24, 30, -45], "(2 54)(3 45)(5 0)(7 21)");
    dotest([
      107,
      158,
      204,
      100,
      118,
      123,
      126,
      110,
      116,
      100
    ], "(2 1032)(3 453)(5 310)(7 126)(11 110)(17 204)(29 116)(41 123)(59 118)(79 158)(107 107)");
  });
}
