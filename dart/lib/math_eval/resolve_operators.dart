
import 'package:dart/math_eval/resolve_first_operators.dart';
import 'package:dart/math_eval/resolve_second_operators.dart';

List<String> resolveOperators(List<String> expression) {

  while ( expression.contains("*") ||  expression.contains("/")){
    expression = resolveFirstOperators(expression);
  }
  while ( expression.contains("+") ||  expression.contains("-")){
    expression = resolveSecondOperators(expression);
  }
  return expression;
}
