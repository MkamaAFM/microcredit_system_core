import 'app_permission.dart';
import 'data_object.dart';

class UserRole extends DataObject {
  final String name;
  final List<AppPermission> permissions;

  UserRole(
      {required String id,
      required String oid,
      required this.name,
      required this.permissions})
      : super(id, oid);

  UserRole.empty()
      : name = 'Empty role',
        permissions = const [],
        super('', '');

  @override
  Map<String, Object> get map => {
        ...super.map,
        'name': name,
        'permissions_code': [
          for (final permission in permissions) permission.code
        ]
      };
}
