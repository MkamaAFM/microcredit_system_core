import 'package:microcredit_system_core/objects/guarantor.dart';
import 'data_repo.dart';
import 'people_informations.dart';

class GuarantorsRepo extends DataRepo<Guarantor> {
  final PeopleInformationsRepo _informationsRepo;
  GuarantorsRepo(String oid, this._informationsRepo)
      : super(oid: oid, collectionPath: 'guarantors');

  @override
  Stream<List<Guarantor>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          Guarantor(
            id: doc.id,
            oid: doc['oid'],
            informations:
                await _informationsRepo.singleData(doc['info_id']).last,
          )
      ];
    }
  }
}
