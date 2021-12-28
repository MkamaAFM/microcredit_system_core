import 'package:microcredit_system_core/objects/client/group_client.dart';
import 'package:microcredit_system_core/repos/users.dart';
import 'contacts.dart';
import 'data_repo.dart';
import 'fees.dart';
import 'guarantors.dart';
import 'individual_clients.dart';

class GroupClientsRepo extends DataRepo<GroupClient> {
  final UsersRepo _usersRepo;
  final GuarantorsRepo _guarantorsRepo;
  final IndividualClientsRepo _clientsRepo;
  final ContactsRepo _contactsRepo;
  final FeesRepo _feesRepo;
  GroupClientsRepo(String oid, this._usersRepo, this._guarantorsRepo,
      this._clientsRepo, this._contactsRepo, this._feesRepo)
      : super(oid: oid, collectionPath: 'group_clients');

  @override
  Stream<List<GroupClient>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          GroupClient(
              id: doc.id,
              oid: doc['oid'],
              leaderID: doc['leader_id'],
              otherDetails: doc['other_details'],
              registeredOn: doc['registered_on'],
              loanOfficer:
                  await _usersRepo.singleData(doc['loan_officer_id']).last,
              documentsURL: doc['documents_url'],
              guarantors:
                  await _guarantorsRepo.dataByID(doc['guarantors_id']).last,
              name: doc['name'],
              clients: await _clientsRepo.dataByID(doc['clients_id']).last,
              contacts: await _contactsRepo.dataByID(doc['contacts_id']).last,
              fees: await _feesRepo.dataByID(doc['fees_id']).last)
      ];
    }
  }
}
