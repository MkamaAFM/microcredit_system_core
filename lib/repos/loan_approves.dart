import 'package:microcredit_system_core/objects/loan_product/loan_approve.dart';
import 'data_repo.dart';
import 'users.dart';

class LoanApprovesRepo extends DataRepo<LoanApprove> {
  final UsersRepo _usersRepo;
  LoanApprovesRepo(String oid, this._usersRepo)
      : super(oid: oid, collectionPath: 'loan_approves');

  @override
  Stream<List<LoanApprove>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          LoanApprove(
            id: doc.id,
            oid: doc['oid'],
            approve: doc['approve'],
            user: await _usersRepo.singleData(doc['user_id']).last,
            reason: doc['reason'],
          )
      ];
    }
  }
}
