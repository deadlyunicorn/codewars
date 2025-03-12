
import "package:dart/xo/index.dart";
import "package:test/test.dart";

void main() {
  group('Fixed tests', () {
    test("Testing for xo", () {
      expect(XO('xo'), equals(true));
    });
    test("Testing for XO", () {
      expect(XO('XO'), equals(true));
    });
    test("Testing for xo0", () {
      expect(XO('xo0'), equals(true));
    });
    test("Testing for xxxoo", () {
      expect(XO('xxxoo'), equals(false));
    });
    test("Testing for xxOo", () {
      expect(XO("xxOo"), equals(true));
    });
    test("Testing for empty string", () {
      expect(XO(''), equals(true));
    });
    test("Testing for xxxxxoooxooo", () {
      expect(XO('xxxxxoooxooo'), equals(true));
    });
    test("Testing for xxxm", () {
      expect(XO("xxxm"), equals(false));
    });
    test("Testing for ooom", () {
      expect(XO("ooom"), equals(false));
    });
    test("Testing for Oo", () {
      expect(XO("Oo"), equals(false));
    });
    test("Testing for abcdefghijklmnopqrstuvwxyz", () {
      expect(XO('abcdefghijklmnopqrstuvwxyz'), equals(true));
    });
  });
}