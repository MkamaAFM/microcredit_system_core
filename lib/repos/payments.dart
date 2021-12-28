import 'package:microcredit_system_core/objects/payment.dart';
import 'data_repo.dart';
import 'individual_clients.dart';
import 'users.dart';

class PaymentRepo extends DataRepo<Payment> {
  final UsersRepo _usersRepo;
  final IndividualClientsRepo _clientsRepo;
  PaymentRepo(String oid, this._usersRepo, this._clientsRepo)
      : super(oid: oid, collectionPath: 'payments');

  @override
  Stream<List<Payment>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          Payment(
              id: doc.id,
              oid: doc['oid'],
              dateTime: doc['date_time'],
              amount: doc['amount'],
              description: doc['description'],
              user: await _usersRepo.singleData(doc['app_user_id']).first,
              name: doc['name'],
              paidBy: await _clientsRepo.singleData(doc['paid_by_id']).first,
              documentsURL: doc['documents_url'],
              paymentType: (doc['payment_type'] as String).paymentType)
      ];
    }
  }
}
