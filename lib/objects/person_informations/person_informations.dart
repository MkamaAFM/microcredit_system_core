import '../address.dart';
import '../contact.dart';
import '../data_object.dart';
import 'gender.dart';
import 'verified_id.dart';

class PersonInformations extends DataObject {
  final String firstName,
      secondName,
      lastName,
      imageURL,
      nationality,
      businessSector;
  final Gender gender;
  final DateTime dateOfBirth;
  final List<Address> addresses;
  final List<Contact> contacts;
  final VerifiedId verifiedId;

  PersonInformations(
      {required String id,
      required String oid,
      required this.verifiedId,
      required this.firstName,
      required this.secondName,
      required this.lastName,
      required this.imageURL,
      required this.nationality,
      required this.businessSector,
      required this.gender,
      required this.dateOfBirth,
      required this.addresses,
      required this.contacts})
      : super(id, oid);

  int get age => throw UnimplementedError();

  @override
  Map<String, Object> get map => {
        ...super.map,
        'addresses_id': [for (final address in addresses) address.id],
        'first_name': firstName,
        'second_name': secondName,
        'last_name': lastName,
        'image_url': imageURL,
        'nationality': nationality,
        'business_sector': businessSector,
        'gender': gender.toString(),
        'date_of_birth': dateOfBirth,
        'contacts_id': [for (final contact in contacts) contact.id],
        'verified_id_id': verifiedId.id
      };
}
