class Installment {
  final String loanID;
  final DateTime dateTime;
  final double interestAmount, balance, principleAmount;
  final bool cleared;
  double get totalAmount => interestAmount + principleAmount;
  Installment(
      {required this.dateTime,
      required this.balance,
      required this.cleared,
      required this.loanID,
      required this.interestAmount,
      required this.principleAmount});
  bool get inArrears => dateTime.isBefore(DateTime.now());
}
