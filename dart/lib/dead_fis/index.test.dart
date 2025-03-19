import 'package:dart/dead_fis/index.dart';
import 'package:test/test.dart';

void main() {
  void doTest(String input, List<int> expected) {
    test("parse('$input')", () => expect(parse(input), equals(expected)));
  }

  group('Sample tests', () {
    doTest("ooo", [0, 0, 0]);
    doTest("ioioio", [1, 2, 3]);
    doTest("idoiido", [0, 1]);
    doTest("isoisoiso", [1, 4, 25]);
    doTest("codewars", [0]);
  });
}
