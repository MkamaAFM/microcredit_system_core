import 'data_object.dart';
import 'user.dart';

class Money extends DataObject {
  final DateTime dateTime;
  final double amount;
  final String description;
  final AppUser user;
  final MoneyType type;

  Money(
      {required String id,
      required String oid,
      required this.dateTime,
      required this.amount,
      required this.description,
      required this.user,
      required this.type})
      : super(id, oid);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'date_time': dateTime,
        'amount': amount,
        'description': description,
        'app_user_id': user.id,
        'money_type': type.toString(),
      };
}

enum MoneyType { asset, liability }

extension StringExtension on String {
  MoneyType get moneyType => this == MoneyType.asset.toString()
      ? MoneyType.asset
      : MoneyType.liability;
}
