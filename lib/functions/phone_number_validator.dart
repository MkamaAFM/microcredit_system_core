bool validPhoneNumber(String number) {
  if (number.length < 10 || number.length > 13) {
    return false;
  }
  if (number.startsWith('+')) {
    String n = number.substring(1);
    if (_canParse(n)) {
      return true;
    } else {
      return false;
    }
  }
  return _canParse(number);
}

bool _canParse(String number) {
  return (int.tryParse(number) != null);
}
