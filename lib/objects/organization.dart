import 'branch.dart';
import 'organization_settings.dart';
import 'data_object.dart';

class Organization extends DataObject {
  final OrganizationSettings settings;
  final Set<Branch> branches;

  Organization(String id, String oid, this.settings, this.branches)
      : super(id, oid);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'settings_id': settings.id,
        'branches_id': [for (final branch in branches) branch.id],
      };
}
