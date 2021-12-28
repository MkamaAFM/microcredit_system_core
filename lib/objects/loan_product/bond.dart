import '../data_object.dart';

class Bond extends DataObject {
  final String name, description;
  final List<String> documentsURL;
  final double estmatedValue;
  final bool active;
  Bond({
    required String id,
    required String oid,
    required this.name,
    required this.description,
    required this.documentsURL,
    required this.estmatedValue,
    required this.active,
  }) : super(id, oid);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'name': name,
        'description': description,
        'documents_url': documentsURL,
        'estmated_value': estmatedValue,
        'active': active,
      };
}
