import "package:dart/math_eval/index.dart";
import "package:test/test.dart";

void main() {
  List<List<Object>> tests = <List<Object>>[
    <Object>["3 -(-1)", 4],
    <Object>["(((10)))", 10],
    <Object>["1 + 1", 2],
    <Object>["2 + -2", 0],
    <Object>["8/16", 0.5],
    <Object>["10- 2- -5", 13],
    <Object>["3 * 5", 15],
    <Object>["-7 * -(6 / 3)", 14],
    <Object>["2 + 3 * 4 / 3 - 6 / 3 * 3 + 8", 8],
    <Object>["-66/-22/45--7*-9/21/42+-31+-12", -43.00476190476191],
    <Object>["-77+-51/73*85+44*81*69/-7+44", -35223.24070450098],
  ];
  for (final List<Object> t in tests) {
    test("Test", () {
      expect(calc(t[0] as String), equals(t[1]));
    });
  }
}
