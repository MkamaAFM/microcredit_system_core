import 'package:microcredit_system_core/objects/contact.dart';
import 'data_repo.dart';

class ContactsRepo extends DataRepo<Contact> {
  ContactsRepo(String oid) : super(oid: oid, collectionPath: 'contacts');

  @override
  Stream<List<Contact>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          Contact(
              id: doc.id,
              oid: doc['oid'],
              name: doc['name'],
              details: doc['details'],
              contact: doc['contact'])
      ];
    }
  }
}
