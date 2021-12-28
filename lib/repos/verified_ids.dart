import 'package:microcredit_system_core/objects/person_informations/verified_id.dart';
import 'data_repo.dart';

class VerifiedIDsRepo extends DataRepo<VerifiedId> {
  VerifiedIDsRepo(String oid) : super(oid: oid, collectionPath: 'verified_ids');

  @override
  Stream<List<VerifiedId>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          VerifiedId(
            id: doc.id,
            oid: doc['oid'],
            number: doc['number'],
            providerName: doc['provider_name'],
            frontImageURL: doc['front_image_url'],
            backImageURL: doc['back_image_url'],
          )
      ];
    }
  }
}
