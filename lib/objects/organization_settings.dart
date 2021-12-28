import 'contact.dart';
import 'data_object.dart';

class OrganizationSettings extends DataObject {
  final String name, currency, joinRequestCode;
  final List<Contact> contacts;
  final List<String> otherFeeNames;
  final List<String> businessSectors;
  final String logoURL, imageURL;
  final int numberOfLoanApproves, numberOfLoanDisaprove;

  OrganizationSettings(
      String id,
      String oid,
      this.name,
      this.currency,
      this.joinRequestCode,
      this.contacts,
      this.logoURL,
      this.imageURL,
      this.numberOfLoanApproves,
      this.numberOfLoanDisaprove,
      this.otherFeeNames,
      this.businessSectors)
      : super(id, oid);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'name': name,
        'currency': currency,
        'contacts_id': [for (final contact in contacts) contact.id],
        'other_fee_names': otherFeeNames,
        'logo_url': logoURL,
        'image_url': imageURL,
        'business_sectors': businessSectors,
        'number_of_loan_approves': numberOfLoanApproves,
        'number_of_loan_disaprove': numberOfLoanDisaprove
      };
}
