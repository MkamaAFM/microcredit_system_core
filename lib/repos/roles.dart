import 'package:microcredit_system_core/objects/app_permission.dart';
import 'package:microcredit_system_core/objects/user_role.dart';
import 'data_repo.dart';

class UserRoleRepo extends DataRepo<UserRole> {
  UserRoleRepo(String oid) : super(oid: oid, collectionPath: 'user_roles');

  @override
  Stream<List<UserRole>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          UserRole(
              id: doc.id,
              oid: doc['oid'],
              name: doc['name'],
              permissions: [
                for (final code in (doc['permissions_code'] as List<int>))
                  AppPermission.permissionList
                      .firstWhere((element) => element.code == code)
              ])
      ];
    }
  }
}
