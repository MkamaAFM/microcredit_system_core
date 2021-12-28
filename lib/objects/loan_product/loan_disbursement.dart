import '../money.dart';
import '../user.dart';

class LoanDisbursement extends Money {
  final bool disbursed;

  LoanDisbursement(
      {required String id,
      required String oid,
      required DateTime dateTime,
      required double amount,
      required String description,
      required AppUser user,
      required this.disbursed})
      : super(
            id: id,
            oid: oid,
            dateTime: dateTime,
            amount: amount,
            description: description,
            user: user,
            type: MoneyType.liability);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'disbursed': disbursed,
      };
}
