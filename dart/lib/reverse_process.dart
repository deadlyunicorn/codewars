import "package:test/test.dart";

String decode(String textToDecode) {
  // your code
  // print("bac".runes);

  final List<String> characterList = List<String>.generate(
    26,
    (int index) => String.fromCharCode(index + 97),
  );

  final int key;
  final List<String> encodedCharacterArray;
  final List<String> decodedCharacterArray = <String>[];

  {
    final List<int> runes = textToDecode.runes.toList();

    final int splitAt =
        runes.indexOf(runes.firstWhere((int element) => element > 96));
    key = int.parse(textToDecode.substring(0, splitAt));
    encodedCharacterArray =
        textToDecode.substring(splitAt, runes.length).split('');
  }

  for (final String character in encodedCharacterArray) {
    final int encodedValue = characterList.indexOf(character);
    final List<int> decodedValue = <int>[];
    for (int i = 0; i <= 26; i++) {
      //? Shouldnt be 25? T_T
      if (i * key % 26 == encodedValue) {
        decodedValue.add(i);
      }
    }
    if (decodedValue.isNotEmpty) {
      if (decodedValue.length > 2)
        return "Impossible to decode"; //? Huh. I have messed up something here
      decodedCharacterArray.add(characterList[decodedValue.first]);
    }
  }

  return decodedCharacterArray.join('');

  // '0' is 48
  // '9' is 57

  // 'a' is 97
  // 'z' is 122

  //
}

void main() {
  void dotest(String r, String exp) {
    test("Testing for $r", () => expect(decode(r), equals(exp)));
  }

  group("fixed tests", () {
    dotest(
      "1273409kuqhkoynvvknsdwljantzkpnmfgf",
      "uogbucwnddunktsjfanzlurnyxmx",
    );
    dotest("1544749cdcizljymhdmvvypyjamowl", "mfmwhbpoudfujjozopaugcb");
    dotest(
      "1122305vvkhrrcsyfkvejxjfvafzwpsdqgp",
      "rrsxppowmjsrclfljrajtybwviqb",
    );
    dotest("7235897srigyvazffyrtxizwgpmvpts", "qfkoexapddefbtkpiojcxjbq");
    dotest("673334wauamqaamqkuusqegeqmi", "Impossible to decode");
  });
}
