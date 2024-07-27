List<String> resolveFirstOperators(List<String> expression) {
  final List<String> listExpression = expression;
  print(listExpression);
  for (int i = 0; i < listExpression.length; i++) {
    print("BEFORE MULTIPLY: $listExpression");

    final String currentCharacter = listExpression[i];
    if (currentCharacter == "*" || currentCharacter == "/") {
      final String char2 = listExpression.removeAt(i + 1);
      final String char1 = listExpression.removeAt(i - 1);

      print("CHAR2: $char2");
      final double num2 = double.parse(char2 == "-" ? "-1" : char2);
      final double num1 = double.parse(char1);

      listExpression[i - 1] =
          (currentCharacter == "*" ? num1 * num2 : num1 / num2).toString();
      if (char2 == "-") {
        listExpression.insert(i, currentCharacter);
      }
      i--;
    }
    print("AFTER MULTIPLY: $listExpression");
  }

  print("first operators: $listExpression");

  return listExpression;
}
