import 'package:dart/math_eval/resolve_operators.dart';

List<String> resolveParentheses(List<String> expression) {
  final List<String> listExpression = expression;

  for (int i = listExpression.length - 1; i >= 0; i--) {
    final String currentCharacter = listExpression[i];

    if (currentCharacter == "(") {
      final int parenthesisStart = i;
      final int parenthesisEnd = listExpression.indexOf(")", i);
      print( "before solving $listExpression");
      final solvedParenthesis = resolveOperators(
          listExpression.getRange(parenthesisStart + 1, parenthesisEnd ).toList(),);
      listExpression.removeRange(parenthesisStart , parenthesisEnd );
      print( "after solving $listExpression");
      listExpression[i] = solvedParenthesis.join('');
    }
  }

  print("Will return $listExpression");
  return listExpression;
}
