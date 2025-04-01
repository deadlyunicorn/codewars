String meeting(String peopleString) {
  final List<String> peopleList = peopleString.split(';');

  final List<List<String>> namesList =
      peopleList.map((String names) => names.toUpperCase().split(':')).toList();

  namesList.sort(
    (List<String> a, List<String> b) {
      final String lastNameA = a[1];
      final String lastNameB = b[1];

      final int comparisonResult = lastNameA.compareTo(lastNameB);
      if (comparisonResult != 0) {
        return comparisonResult;
      }

      final String firstNameA = a[0];
      final String firstNameB = b[0];

      return firstNameA.compareTo(firstNameB);
    },
  );

  return namesList.map((List<String> fullname) {
    return (fullname[1], fullname[0]);
  }).join('');
}

void main() {
  final res = meeting(
    "Fred:Corwill;Wilfred:Corwill;Barney:Tornbull;Betty:Tornbull;Bjon:Tornbull;Raphael:Corwill;Alfred:Corwill",
  );

  print(res);
}
