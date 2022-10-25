class ValidationCreditCard {
  final String numberCard;
  List<int> list = [];
  int valueIncrement = 0;

  ValidationCreditCard(this.numberCard) {
    list = convertInDigits(cleanDigits(numberCard));
    print(checkCard(list));
  }

  String cleanDigits(String value) {
    return value.replaceAll(RegExp(r'[^\d]'), '');
  }

  List<int> convertInDigits(String value) {
    return value.split('').map((e) => int.parse(e)).toList();
  }

  bool checkCard(List<int> list) {
    List<int> listTemp = [];
    late int numberSeparator;

    for (int i = 0; i < list.length; i++) {
      if (i < 15) {
        listTemp.add(list[i]);
      } else {
        numberSeparator = list[i];
      }
    }

    for (int i = 0; i < listTemp.length; i++) {
      if (i % 2 == 0) {
        valueIncrement += checkNumber(listTemp[i] * 2);
      } else {
        valueIncrement += checkNumber(listTemp[i]);
      }
    }

    valueIncrement = 10 - (valueIncrement % 10);

    if (valueIncrement == numberSeparator) {
      return true;
    } else if (valueIncrement == 10 && numberSeparator == 0) {
      return true;
    } else {
      return false;
    }
  }

  int checkNumber(int x) {
    int value = 0;

    if (x < 9) {
      return x;
    } else {
      List<int> listInt = x.toString().split('').map(int.parse).toList();
      for (int i = 0; i < listInt.length; i++) {
        value += listInt[i];
      }
      return value;
    }
  }
}
