import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:microcredit_system_core/objects/loan_product/loan_disbursement.dart';
import 'data_repo.dart';
import 'users.dart';


class LoanDisbursementsRepo extends DataRepo<LoanDisbursement> {
  final UsersRepo _usersRepo;
  LoanDisbursementsRepo(String oid, this._usersRepo)
      : super(oid: oid, collectionPath: 'loan_disbursements');

  @override
  Stream<List<LoanDisbursement>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          LoanDisbursement(
            id: doc.id,
            oid: doc['oid'],
            dateTime: (doc['date_time'] as Timestamp).toDate(),
            amount: doc['amount'],
            description: doc['description'],
            user: await _usersRepo.singleData(doc['app_user_id']).last,
            disbursed: doc['disbursed'],
          )
      ];
    }
  }
}
