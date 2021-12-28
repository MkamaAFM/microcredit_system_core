import 'contact.dart';
import 'data_object.dart';
import 'user_role.dart';

class AppUser extends DataObject {
  final String name, imageUrl, uid, bid;
  final UserRole role;
  final List<Contact> contacts;
  final bool activated;

  AppUser({
    required this.bid,
    required String oid,
    required this.uid,
    required String id,
    required this.name,
    required this.imageUrl,
    required this.role,
    required this.contacts,
    required this.activated,
  }) : super(id, oid);


  @override
  Map<String, Object> get map => {
        ...super.map,
        'uid': uid,
        'oid': oid,
        'bid': bid,
        'name': name,
        'image_url': imageUrl,
        'role_id': role.id,
        'contacts_id': [for (final contact in contacts) contact.id],
        'activated': activated,
      };
}
