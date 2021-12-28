import 'data_object.dart';

class Contact extends DataObject {
  final String name, details, contact;

  Contact(
      {required String id,
      required String oid,
      required this.name,
      required this.details,
      required this.contact})
      : super(id, oid);

  @override
  Map<String, Object> get map =>
      {...super.map, 'name': name, 'details': details, 'contact': contact};
}
