
// ignore: no_leading_underscores_for_local_identifiers
import 'package:dart/math_eval/contains_operator.dart';
import 'package:dart/math_eval/resolve_parentheses.dart';

import 'resolve_operators.dart';

double calc(String _expression) {
  List<String> expression = _expression.split('')
    ..removeWhere((String element) => element == " ");
  print(expression);
  expression = getNumbers(expression);
  expression = resolveParentheses(expression);

  print( expression.toString() + "NONO");
  expression = resolveOperators(expression);

  print("after parenthesis:$expression");
  while (containsOperator(expression)) {
    expression = resolveOperators(expression);
  }

  return (expression.fold(1, (double previousValue, String element) => previousValue * double.parse( element ),)); // evaluated expression
}

List<String> getNumbers(List<String> expression){

  for(int i = 0; i < expression.length - 1; i ++){
    final String currentCharacter = expression[i];
    final String nextCharacter = expression[i+1];
    if ( operators.contains(currentCharacter) || currentCharacter == "(" || currentCharacter == ")" ){
      continue;
    } else if (  operators.contains(nextCharacter) || nextCharacter == "(" || nextCharacter == ")"  ) {
      continue;
    } else{
      expression[i] = currentCharacter + expression.removeAt(i+1);
      i --;
    }
  }
  
  return expression;
}
