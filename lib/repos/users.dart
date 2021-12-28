import 'package:microcredit_system_core/objects/user.dart';
import 'contacts.dart';
import 'data_repo.dart';
import 'roles.dart';

class UsersRepo extends DataRepo<AppUser> {
  final UserRoleRepo _roleRepo;
  final ContactsRepo _contactsRepo;

  UsersRepo(this._roleRepo, this._contactsRepo, String oid)
      : super(oid: oid, collectionPath: 'users');

  @override
  Stream<List<AppUser>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          AppUser(
              bid: doc['bid'],
              oid: doc['oid'],
              uid: doc['uid'],
              id: doc.id,
              name: doc['name'],
              imageUrl: doc['image_url'],
              role: await _roleRepo.singleData(doc.id).last,
              contacts: await _contactsRepo
                  .dataByID((doc['contacts_id'] as List<String>))
                  .last,
              activated: doc['activated'])
      ];
    }
  }
}
