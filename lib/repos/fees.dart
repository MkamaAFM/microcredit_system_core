import 'package:microcredit_system_core/objects/fee.dart';
import 'package:microcredit_system_core/repos/payments.dart';
import 'data_repo.dart';

class FeesRepo extends DataRepo<Fee> {
  final PaymentRepo _paymentRepo;
  FeesRepo(String oid, this._paymentRepo)
      : super(oid: oid, collectionPath: 'fees');

  @override
  Stream<List<Fee>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          Fee(
            id: doc.id,
            oid: doc['oid'],
            name: doc['name'],
            amount: doc['amount'],
            payments: await _paymentRepo.dataByID(doc['payments_id']).first,
          )
      ];
    }
  }
}
