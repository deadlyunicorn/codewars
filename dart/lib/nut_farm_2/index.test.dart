import "package:dart/nut_farm_2/index.dart";
import "package:test/test.dart";

void main() {
  test("Bounce Left", () {
    var tree = [
      " o o o  ",
      " /    / ",
      "   /    ",
      "  /  /  ",
      "   ||   ",
      "   ||   ",
      "   ||   "
    ];
    var actual = shake_tree(tree);
    var expected = [1, 1, 0, 0, 1, 0, 0, 0];
    expect(actual, equals(expected));
  });

  test("Roll Left", () {
    var tree = [
      " o      ",
      " / o o/ ",
      " ///    ",
      "   ///  ",
      "   ||   ",
      "   ||   ",
      "   ||   "
    ];
    var actual = shake_tree(tree);
    var expected = [2, 0, 1, 0, 0, 0, 0, 0];

    expect(actual, equals(expected));
  });

  test("Bounce Right", () {
    var tree = [
      " o o o  ",
      " \\    \\ ",
      "   \\    ",
      "  \\  \\  ",
      "   ||   ",
      "   ||   ",
      "   ||   "
    ];
    var actual = shake_tree(tree);
    var expected = [0, 0, 0, 1, 1, 0, 1, 0];
    expect(actual, equals(expected));
  });

  test("Roll Right", () {
    var tree = [
      " o o  oo  ",
      " \\\\\\   \\\\ ",
      "  o \\o    ",
      "  \\\\  \\   ",
      "    ||    ",
      "    ||    ",
      "    ||    "
    ];
    var actual = shake_tree(tree);
    var expected = [0, 0, 0, 0, 1, 3, 0, 1, 0, 1];
    expect(actual, equals(expected));
  });
}
