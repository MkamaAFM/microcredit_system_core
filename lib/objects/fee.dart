import 'payment.dart';
import 'data_object.dart';

class Fee extends DataObject {
  final String name;
  final double amount;
  final List<Payment> payments;

  static const commonFees = [
    'Penalty',
    'Processing',
    'Registration'
  ]; //TODO: do something in ui

  Fee({
    required String id,
    required String oid,
    required this.name,
    required this.amount,
    required this.payments,
  }) : super(id, oid);

  double get balance => amount - totalPayment;

  double get totalPayment {
    double totalPayment = 0;
    for (final payment in payments) {
      totalPayment = totalPayment + payment.amount;
    }
    return totalPayment;
  }

  bool get paid => balance <= 0;

  @override
  Map<String, Object> get map => {
        ...super.map,
        'name': name,
        'amount': amount,
        'payments_id': [for (final payment in payments) payment.id],
      };
}
