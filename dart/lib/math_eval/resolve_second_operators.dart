List<String> resolveSecondOperators(List<String> expression) {
  final List<String> listExpression = expression;

  for (int i = 0; i < listExpression.length; i++) {
    final String currentCharacter = listExpression[i];

    if ((currentCharacter == "+" || currentCharacter == "-")) {
      final String nextCharacter =
          i + 1 == listExpression.length ? "0" : listExpression.removeAt(i + 1);
      if (nextCharacter == "+" || nextCharacter == "-") {
        listExpression[i] = nextCharacter == currentCharacter ? "+" : "-";
      } else if (i != 0) {
        final String previousCharacter = listExpression.removeAt(i - 1);
        final double num2 =
            double.parse(previousCharacter == "(" ? "0" : previousCharacter);
        final double num1 = double.parse(nextCharacter);
        print("num2 : $num2");
        print("num1 : $num1");
        print("operation : $currentCharacter");
        listExpression[i-- - 1] =
            (currentCharacter == "+" ? num1 + num2 : num2 - num1).toString();
        print("done: $listExpression");
      } else if (i == 0) {
        listExpression[i] = (currentCharacter == "-"
                ? -double.parse(nextCharacter)
                : double.parse(nextCharacter))
            .toString();
      }
      i--;
    }
  }
  print("After operatons: $expression");

  return listExpression;
}
