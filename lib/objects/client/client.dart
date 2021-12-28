import '../data_object.dart';
import '../fee.dart';
import '../guarantor.dart';
import '../user.dart';

abstract class Client extends DataObject {
  final String otherDetails;
  final DateTime registeredOn;
  final AppUser loanOfficer;
  final List<String> documentsURL;
  final List<Guarantor> guarantors;
  final List<Fee> fees;

  Client(
    String id,
    String oid,
    this.otherDetails,
    this.registeredOn,
    this.loanOfficer,
    this.documentsURL,
    this.guarantors,
    this.fees,
  ) : super(id, oid);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'registered_on': registeredOn,
        'other_details': otherDetails,
        'loan_officer_id': loanOfficer.id,
        'documents_url': documentsURL,
        'guarantors_id': [for (final guarantor in guarantors) guarantor.id],
        'fees_id': [for (final fee in fees) fee.id]
      };
}
