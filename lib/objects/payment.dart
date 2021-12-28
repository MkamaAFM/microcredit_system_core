import 'client/individual_client.dart';
import 'money.dart';
import 'user.dart';

class Payment extends Money {
  final String name;
  final IndividualClient paidBy;
  final List<String> documentsURL;
  final PaymentType paymentType;

  Payment(
      {required String id,
      required String oid,
      required DateTime dateTime,
      required double amount,
      required String description,
      required AppUser user,
      required this.name,
      required this.paidBy,
      required this.documentsURL,
      required this.paymentType})
      : super(
            id: id,
            oid: oid,
            dateTime: dateTime,
            amount: amount,
            description: description,
            user: user,
            type: MoneyType.asset);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'name': name,
        'paid_by_id': paidBy.id,
        'documents_url': documentsURL,
        'payment_type': paymentType.toString()
      };
}

enum PaymentType { cash, bank, mobile, savings, other }

extension StringExtension on String {
  PaymentType get paymentType {
    PaymentType value = PaymentType.other;
    for (final type in PaymentType.values) {
      if (type.toString() == this) {
        value = type;
        break;
      }
    }
    return value;
  }
}
