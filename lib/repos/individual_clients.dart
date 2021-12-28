import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:microcredit_system_core/objects/client/individual_client.dart';
import 'data_repo.dart';
import 'fees.dart';
import 'guarantors.dart';
import 'people_informations.dart';
import 'users.dart';


class IndividualClientsRepo extends DataRepo<IndividualClient> {
  final PeopleInformationsRepo _informationsRepo;
  final GuarantorsRepo _guarantorsRepo;
  final UsersRepo _usersRepo;
  final FeesRepo _feesRepo;
  IndividualClientsRepo(
    String oid,
    this._informationsRepo,
    this._guarantorsRepo,
    this._usersRepo,
    this._feesRepo,
  ) : super(oid: oid, collectionPath: 'individual_clients');

  @override
  Stream<List<IndividualClient>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          IndividualClient(
            id: doc.id,
            oid: doc['oid'],
            otherDetails: doc['other_details'],
            active: doc['active'],
            registeredOn: (doc['registered_on'] as Timestamp).toDate(),
            loanOfficer: await _usersRepo.singleData('loan_officer_id').last,
            documentsURL: doc['documents_url'],
            guarantors:
                await _guarantorsRepo.dataByID(doc['guarantors_id']).last,
            informations:
                await _informationsRepo.singleData(doc['info_id']).last,
            fees: await _feesRepo.dataByID(doc['fees_id']).last,
          )
      ];
    }
  }
}
