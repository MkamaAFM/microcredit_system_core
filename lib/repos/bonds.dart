import 'package:microcredit_system_core/objects/loan_product/bond.dart';
import 'data_repo.dart';

class BondsRepo extends DataRepo<Bond> {
  BondsRepo(String oid) : super(oid: oid, collectionPath: 'bonds');

  @override
  Stream<List<Bond>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          Bond(
            id: doc.id,
            oid: doc['oid'],
            name: doc['name'],
            description: doc['description'],
            documentsURL: doc['documentsURL'],
            estmatedValue: doc['estmatedValue'],
            active: doc['active'],
          )
      ];
    }
  }
}
