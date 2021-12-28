import 'package:microcredit_system_core/objects/person_informations/person_informations.dart';
import '../fee.dart';
import '../guarantor.dart';
import '../user.dart';
import 'client.dart';

class IndividualClient extends Client {
  final PersonInformations informations;
  final bool active;

  IndividualClient({
    required String id,
    required String oid,
    required String otherDetails,
    required DateTime registeredOn,
    required AppUser loanOfficer,
    required List<String> documentsURL,
    required List<Guarantor> guarantors,
    required List<Fee> fees,
    required this.informations,
    required this.active,
  }) : super(id, oid, otherDetails, registeredOn, loanOfficer, documentsURL,
            guarantors, fees);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'info_id': informations.id,
        'active': active,
      };
}
