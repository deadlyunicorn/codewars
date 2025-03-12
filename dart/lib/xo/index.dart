bool XO(String str) {
  return RegExp('x',caseSensitive: false).allMatches(str).length ==
      RegExp('o',caseSensitive: false).allMatches(str).length;
}


void main(){

  print(RegExp('[O]').allMatches("OO").length);
}