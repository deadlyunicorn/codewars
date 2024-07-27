bool containsOperator(List<String> expression) {
  for (final String operator in operators) {
    if (expression.contains(operator)) {
      return true;
    }
  }

  return false;
}

// if ( operators.contains( currentCharacter ) ){
//       currentOperator = currentCharacter;
//     }
const List<String> operators = <String>["+", "-", "*", "/"];
