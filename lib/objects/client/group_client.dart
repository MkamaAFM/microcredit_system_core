import '../contact.dart';
import '../fee.dart';
import '../guarantor.dart';
import '../user.dart';
import 'client.dart';
import 'individual_client.dart';

class GroupClient extends Client {
  final String name, leaderID;
  final List<IndividualClient> clients;
  final List<Contact> contacts;
  IndividualClient get leader =>
      clients.firstWhere((element) => element.id == leaderID);

  GroupClient(
      {required String id,
      required String oid,
      required String otherDetails,
      required DateTime registeredOn,
      required AppUser loanOfficer,
      required List<String> documentsURL,
      required List<Guarantor> guarantors,
      required List<Fee> fees,
      required this.name,
      required this.clients,
      required this.contacts,
      required this.leaderID})
      : super(id, oid, otherDetails, registeredOn, loanOfficer, documentsURL,
            guarantors, fees);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'name': name,
        'leader_id': leaderID,
        'clients_id': [for (final client in clients) client.id],
        'contacts_id': [for (final contact in contacts) contact.id]
      };
}
