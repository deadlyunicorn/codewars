// See https://pub.dartlang.org/packages/test
import "package:dart/ip_validator/index.dart";
import "package:test/test.dart";

void main() {
  void doTest(String input, bool expected) {
    test('isValidIP("$input")', () => expect(isValidIP(input), equals(expected)));
  }
  
  group("Sample tests", () {
    doTest('12.255.56.1', true);
    doTest('', false);
    doTest('abc.def.ghi.jkl', false);
    doTest('123.456.789.0', false);
    doTest('12.34.56', false);
    doTest('12.34.56 .1', false);
    doTest('12.34.56.-1', false);
    doTest('123.045.067.089', false);
    doTest('127.1.1.0', true);
    doTest('0.0.0.0', true);
    doTest('0.34.82.53', true);
    doTest('00.34.82.53', false);
    doTest('123.045.067.089', false);
    doTest('192.168.1.300', false);
  });

}
