import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:microcredit_system_core/objects/person_informations/gender.dart';
import 'package:microcredit_system_core/objects/person_informations/person_informations.dart';
import 'addresses.dart';
import 'contacts.dart';
import 'data_repo.dart';
import 'verified_ids.dart';

class PeopleInformationsRepo extends DataRepo<PersonInformations> {
  final AdressesRepo _adressesRepo;
  final ContactsRepo _contactsRepo;
  final VerifiedIDsRepo _iDsRepo;
  PeopleInformationsRepo(
      String oid, this._adressesRepo, this._contactsRepo, this._iDsRepo)
      : super(oid: oid, collectionPath: 'people_informations');

  @override
  Stream<List<PersonInformations>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          PersonInformations(
              id: doc.id,
              oid: doc['oid'],
              firstName: doc['first_name'],
              secondName: doc['second_name'],
              lastName: doc['last_name'],
              imageURL: doc['image_url'],
              nationality: doc['nationality'],
              businessSector: doc['business_Sector'],
              gender: (doc['gender'] as String).gender,
              dateOfBirth: (doc['date_of_birth'] as Timestamp).toDate(),
              addresses: await _adressesRepo.dataByID(doc['addresses_id']).last,
              contacts: await _contactsRepo.dataByID(doc['contacts_id']).last,
              verifiedId: await _iDsRepo.singleData(doc['verified_id_id']).last)
      ];
    }
  }
}
