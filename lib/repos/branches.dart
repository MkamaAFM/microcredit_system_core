import 'package:microcredit_system_core/objects/branch.dart';
import 'data_repo.dart';

// class BranchesRepo extends DataRepo<Branch> {
//   BranchesRepo(String oid) : super(oid: oid, collectionPath: 'branches');

//   @override
//   Stream<List<Branch>> data() async* {
//     await for (final data in snapshot) {
//       yield [
//         for (final doc in data.docs)
//           Branch(id, oid, individualClients, loanProducts, name, imageURL,
//               contacts, address, users, groupClients)
//       ];
//     }
//   }
// }
