import 'data_object.dart';
import 'person_informations/person_informations.dart';

class Guarantor extends DataObject {
  final PersonInformations informations;
  Guarantor(
      {required String id, required String oid, required this.informations})
      : super(id, oid);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'info_id': informations.id,
      };
}
